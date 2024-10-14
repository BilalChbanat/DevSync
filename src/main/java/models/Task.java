package models;

import ENUMS.TaskStatus;
import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private TaskStatus status;

    @Column(name = "deadline")
    private LocalDate deadline;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User assignedTo;

    @ManyToMany
    @JoinTable(
            name = "task_tags",
            joinColumns = @JoinColumn(name = "task_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id")
    )

    private List<Tag> tags;

    @Column(name = "is_token_modifiable")
    private boolean isTokenModifiable;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDate createdAt;

    @ManyToOne
    @JoinColumn(name = "created_by")
    private User createdBy;

    public Task() {}

    public Task(Long id, String title, String description, TaskStatus status, LocalDate deadline,
                User assignedTo, List<Tag> tags, boolean isTokenModifiable, LocalDate createdAt, User createdBy) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.status = status;
        this.deadline = deadline;
        this.assignedTo = assignedTo;
        this.tags = tags;
        this.isTokenModifiable = isTokenModifiable;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", deadline=" + deadline +
                ", assignedTo=" + assignedTo +
                ", tags=" + tags +
                ", isTokenModifiable=" + isTokenModifiable +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                '}';
    }
}
