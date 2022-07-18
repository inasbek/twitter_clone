package swift.back.twitter.infrastructure.entities.user;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Data
@Entity
@Table(name = "user_account")
public class UserAccount {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", updatable = false, nullable = false)
    private UUID id;
    //let id: String
    //let username: String
    //let profileImageUrl: String
    //let fullname: String
    //let email: String
    //var stats: UserStats
    //var bio: String?

    @Column(name = "username") // -> the true username
    private String username;

    @Column(name = "profil_image_url")
    private String profil_image_url;

    @Column(name = "fullname") //
    private String fullname;

    @Column(name = "email", unique = true)
    private String email;

//    @Column(name = "stats")
//    private UserStats user_stats;
//    struct UserStats {
//        let followers: Int
//        let following: Int
//    }

    @Column(name = "bio", nullable = true)
    private String bio;

    @Column(name = "followed")
    private boolean is_followed;

    @Column(name = "inscription_date", updatable = false)
    @Temporal(TemporalType.DATE)
    private Date inscriptionDate;

}