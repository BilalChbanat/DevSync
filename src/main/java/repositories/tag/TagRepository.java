package repositories.tag;

import models.Tag;
import java.util.List;

public interface TagRepository {

    Tag create(Tag tag);
    Tag findById(Long id);
    List<Tag> findAll();
    Tag update(Tag tag);
    void delete(Long id);
    List<Tag> findByName(String name);
}
