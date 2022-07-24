package swift.back.twitter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import swift.back.twitter.domain.services.UserService;
import swift.back.twitter.domain.services.SocialService;
import swift.back.twitter.infrastructure.repositories.SocialRepository;

import javax.sql.DataSource;


@Configuration
public class BeanConfiguration {

    @Autowired private DataSource dataSource;
//
    private final ApplicationContext context;
//
    @Autowired
    public BeanConfiguration(ApplicationContext context) {
        this.context = context;
    }
//
//
    @Bean
    public JdbcUserDetailsManager jdbcUserDetailsManager() {
        return new JdbcUserDetailsManager(dataSource);
    }
//
    @Bean
    public BCryptPasswordEncoder bcryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
//
//    public UserService userService() {
//        return this.context.getBean(UserService.class);
//    }
//
//
//    public SocialService socialService() {
//        return this.context.getBean(SocialService.class);
//    }

}
