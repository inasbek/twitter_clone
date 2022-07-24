package swift.back.twitter.infrastructure.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import swift.back.twitter.infrastructure.entities.social.Comment;
import swift.back.twitter.infrastructure.entities.user.UserAccount;

import java.util.List;
import java.util.UUID;

@Repository
public interface SocialRepository extends JpaRepository<Comment, UUID> {

    List<Comment> getAllByUser(UserAccount user);
}
