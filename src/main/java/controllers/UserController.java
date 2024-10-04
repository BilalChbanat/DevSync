package controllers;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import models.User;
import repositories.UserRepository;
import repositories.UserRepositoryImpl;

import java.util.List;

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UserController {

    // Singleton instance of UserRepository
    private static final UserRepository userRepository = new UserRepositoryImpl();

    @GET
    public Response getAllUsers() {
        List<User> users = userRepository.findAll();
        return Response.ok(users).build();
    }

    @GET
    @Path("/{id}")
    public Response getUserById(@PathParam("id") Long id) {
        User user = userRepository.findById(id);
        if (user != null) {
            return Response.ok(user).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @POST
    public Response createUser(User user) {
        User createdUser = userRepository.create(user);
        return Response.status(Response.Status.CREATED).entity(createdUser).build();
    }

    @PUT
    @Path("/{id}")
    public Response updateUser(@PathParam("id") Long id, User user) {
        user.setId(id);
        User updatedUser = userRepository.update(user);
        if (updatedUser != null) {
            return Response.ok(updatedUser).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @DELETE
    @Path("/{id}")
    public Response deleteUser(@PathParam("id") Long id) {
        userRepository.delete(id);
        return Response.noContent().build();
    }

    @GET
    @Path("/name/{name}")
    public Response getUserByName(@PathParam("name") String name) {
        User user = userRepository.findByName(name);
        if (user != null) {
            return Response.ok(user).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @GET
    @Path("/managers")
    public Response getManagers(@QueryParam("isManager") Boolean isManager) {
        List<User> managers = userRepository.findByManager(isManager);
        return Response.ok(managers).build();
    }
}
