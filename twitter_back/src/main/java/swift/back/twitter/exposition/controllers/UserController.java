package swift.back.twitter.exposition.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import swift.back.twitter.domain.services.UserService;
import swift.back.twitter.exposition.models.AccountDTO;
import swift.back.twitter.infrastructure.entities.user.UserAccount;

import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("user")
public class UserController {

    private UserService userService;

    @Autowired
    public UserController(UserService userService){
        this.userService = userService;
    }

    @PostMapping(value = "/create", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity createAccount(@RequestBody AccountDTO accountDTO){
        UserAccount user = new UserAccount();
        user.setEmail(accountDTO.email());
        user.set_followed(false);
        user.setBio("");
        user.setFullname(accountDTO.fullname());
        user.setId(UUID.randomUUID());
        user.setUsername(accountDTO.username());
        user.setProfil_image_url(accountDTO.profileImage());
        user.setInscriptionDate(Date.from(Instant.now()));
       this.userService.createUser(user,accountDTO.email(),accountDTO.password(),null);
       return ResponseEntity.ok().build();
    }

    @GetMapping()
    public List<UserAccount> getUsers(){
        return this.userService.findAll();
    }

    @GetMapping(value = "/{username}")
    public UserAccount getUserByUsername(@PathVariable(value = "username") String username){
        return this.userService.getUserByUsername(username);
    }

    @GetMapping(value = "/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<UserAccount> getUserProfilById(@PathVariable(value="id") String id){
        var result = this.userService.getUserById(UUID.fromString(id));
        return ResponseEntity.ok(result);
    }

    @PatchMapping(value = "/me/updatemail/{newMail}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity modifyMail(@PathVariable(value = "newMail") String newMail){
        this.userService.changeMail(newMail);
        return ResponseEntity.ok().build();
    }

    /**
     * Pour mettre à jour son mot de passe
     **/
    @PatchMapping(value = "/me/updatepassword/{newPassword}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity modifyPassword(@PathVariable(value = "newPassword") String newPassword){
        this.userService.changePassword(newPassword);
        return ResponseEntity.ok().build();
    }

}
