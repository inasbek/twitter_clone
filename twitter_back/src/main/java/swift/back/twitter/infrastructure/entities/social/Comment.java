package swift.back.twitter.infrastructure.entities.social;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import swift.back.twitter.infrastructure.entities.user.User;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Data
@Entity
@Table(name = "comment")
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    private UUID id;

    @Column(name = "title")
    private String title;

    @ManyToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id")
    private User user;

    @Column(name = "add_date", updatable = false)
    @Temporal(TemporalType.DATE)
    private Date date;

    @Column(name = "content")
    private String content;

    @Column(name = "file_link")
    private String file_link;

    @Column(name = "likes")
    private Integer likes;

    @Column(name = "retweet")
    private Integer retweet;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinColumn(name = "comments",referencedColumnName = "id")
    private List<Comment> comments;
}
