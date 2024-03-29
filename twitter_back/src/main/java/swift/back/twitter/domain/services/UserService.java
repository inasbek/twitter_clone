package swift.back.twitter.domain.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.util.Streamable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Service;
import swift.back.twitter.infrastructure.entities.user.UserAccount;
import swift.back.twitter.infrastructure.repositories.UserRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final JdbcUserDetailsManager jdbcUserDetailsManager;
    private final BCryptPasswordEncoder bcryptPasswordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, JdbcUserDetailsManager jdbcUserDetailsManager, BCryptPasswordEncoder bcryptPasswordEncoder){
        this.userRepository = userRepository;
        this.jdbcUserDetailsManager = jdbcUserDetailsManager;
        this.bcryptPasswordEncoder = bcryptPasswordEncoder;
    }

    public List<UserAccount> findAll(){
        Iterable<UserAccount> users = this.userRepository.findAll();
        return Streamable.of(users).toList();
    }

    public UserAccount getUserById(UUID id){
        Optional<UserAccount> userAccount = this.userRepository.findById(id);
//        if(userAccount.isEmpty()){
//            throw NoSuchEntityException.withIdAndElem(id,"user account");
//        }
        return  userAccount.get();
    }

    public UserAccount getUserByUsername(String username){
        return this.userRepository.findUserAccountByUsername(username).get();
    }

    public void createUser(UserAccount userAccount, String email, String password, List<GrantedAuthority> roles) {
    //    checkMailNotAlreadyTaken(email);
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(email,bcryptPasswordEncoder.encode(password),roles);
        jdbcUserDetailsManager.createUser(userDetails);
        this.saveUserAccount(userAccount);
    }

    public void changePassword(String newPassword) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        UserDetails currentUser = this.jdbcUserDetailsManager.loadUserByUsername(username);
        String password = this.bcryptPasswordEncoder.encode(newPassword);
      //  this.checkPasswordAreDifferent(password, currentUser.getPassword());
        this.jdbcUserDetailsManager.changePassword(currentUser.getPassword(), password);
    }

    public void changeMail(String newEmail) {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
//        this.checkMailAreDifferent(newEmail, email);
//        this.checkMailNotAlreadyTaken(newEmail);

        UserAccount userAccount = this.getUserAccountByEmail(email);
        userAccount.setEmail(newEmail);

        UserDetails currentUser = this.jdbcUserDetailsManager.loadUserByUsername(email);
        UserDetails newUserDetails = new org.springframework.security.core.userdetails.User(newEmail,currentUser.getPassword(),currentUser.getAuthorities());

        this.jdbcUserDetailsManager.deleteUser(email);

        jdbcUserDetailsManager.createUser(newUserDetails);
        this.saveUserAccount(userAccount);
    }

    public UserAccount getUserAccountByEmail(String email){
        Optional<UserAccount>  userAccount = this.userRepository.findUserAccountByEmail(email);
//        if(userAccount.isEmpty()){
//            throw NoUserFormMailException.withMail(email);
//        }
        return userAccount.get();
    }

    public UserAccount getMyUserAccount(){
        return this.getUserAccountByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    private void saveUserAccount(UserAccount userAccount){
        this.userRepository.save(userAccount);
    }

//    private void checkPasswordAreDifferent(String newPassword, String oldpassword){
//        if (this.bcryptPasswordEncoder.matches(newPassword, oldpassword)) {
//            throw SamePasswordException.of();
//        }
//    }
//
//    private void checkMailAreDifferent(String newEmail, String oldEmail){
//        if(oldEmail.equals(newEmail)){
//            throw SameMailException.withMail(newEmail);
//        }
//    }
//
//    private void checkMailNotAlreadyTaken(String email){
//        try {
//            this.getUserAccountByEmail(email);
//        } catch (Exception e){
//            return;
//        }
//        throw MailAlreadyTakenException.withMail(email);
//    }
}
