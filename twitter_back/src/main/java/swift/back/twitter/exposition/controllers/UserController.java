package swift.back.twitter.exposition.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import swift.back.twitter.domain.UserService;
import swift.back.twitter.exposition.models.AccountDTO;

@RestController
@RequestMapping("user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService){
        this.userService = userService;
    }

    @PostMapping(value = "/create", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity createAccount(@RequestBody AccountDTO accountDTO){
       // this.userService.
    }
}
