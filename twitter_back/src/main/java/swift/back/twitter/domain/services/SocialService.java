package swift.back.twitter.domain.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swift.back.twitter.infrastructure.entities.social.Comment;
import swift.back.twitter.infrastructure.entities.user.UserAccount;
import swift.back.twitter.infrastructure.repositories.SocialRepository;

import java.util.List;
import java.util.UUID;

@Service
public class SocialService {

    private final SocialRepository socialRepository;

    @Autowired
    public SocialService(SocialRepository socialRepository){
        this.socialRepository = socialRepository;
    }

    public void likeCommentById(UUID uuid, int like){
        Comment comment = this.socialRepository.getReferenceById(uuid);
        comment.setLikes(comment.getLikes()+like);
        this.socialRepository.save(comment);
    }


    public void addComment(Comment comment){
        this.socialRepository.save(comment);
    }

    public void deleteCommentById(UUID uuid){
        this.socialRepository.deleteById(uuid);
    }

    public void deleteComment(Comment comment){
        this.socialRepository.delete(comment);
    }

    public Comment getCommentByUUID(UUID uuid){
        return this.socialRepository.getReferenceById(uuid);
    }

    public List<Comment> getAllComment(){
        return this.socialRepository.findAll();
    }

    public List<Comment> getCommentsByUser(UserAccount user) {
        return this.socialRepository.getAllByUser(user);
    }

    public void retweetCommentbyID(UUID uuid) {
        Comment comment = this.socialRepository.getReferenceById(uuid);
        comment.setLikes(comment.getRetweet()+1);
        this.socialRepository.save(comment);
    }

    public void commentAComment(Comment comment, UUID parentCommentId) {
       Comment commentParent = this.socialRepository.getReferenceById(parentCommentId);
       List<Comment> comments = commentParent.getComments();
       comments.add(comment);
       commentParent.setComments(comments);
       this.socialRepository.save(commentParent);
    }
}
