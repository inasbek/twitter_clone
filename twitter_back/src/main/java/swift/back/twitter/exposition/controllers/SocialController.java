package swift.back.twitter.exposition.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import swift.back.twitter.domain.services.SocialService;
import swift.back.twitter.exposition.models.CommentDTO;
import swift.back.twitter.exposition.models.LikeDTO;
import swift.back.twitter.infrastructure.entities.social.Comment;

import java.sql.Date;
import java.time.Instant;
import java.util.*;

@RestController
@RequestMapping(value = "social")
public class SocialController {

    private final SocialService socialService;

    @Autowired
    public SocialController(SocialService socialService){
        this.socialService = socialService;
    }

    @PostMapping(value = "/comment",consumes = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity createComment(@RequestBody CommentDTO request){
        Comment comment = new Comment();
        comment.setContent(request.content());
        comment.setDate(Date.from(Instant.now()));
        comment.setId(UUID.randomUUID());
        comment.setTitle(request.title());
        comment.setUser(request.user());
        comment.setRetweet(0);
        comment.setFile_link(request.filelink());
        comment.setLikes(0);
        comment.setComments(null);
        this.socialService.addComment(comment);
        return ResponseEntity.ok().build();
    }

    /**
     * Pour supprimer un commentaire ( à qui nous appartient )
     **/
    @DeleteMapping(value = "/deletecomment/{id}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity deleteCommentRecipe(@PathVariable(value="id") String commentId){
        this.socialService.deleteComment(this.socialService.getCommentByUUID(UUID.fromString(commentId)));
        return ResponseEntity.ok().build();
    }

    @GetMapping()
    public List<Comment> getAll(){
        return this.socialService.getAllComment();
    }

    @GetMapping(value = "/{id}")
    public Comment getCommentById(@PathVariable(value = "id") String id){
        return this.socialService.getCommentByUUID(UUID.fromString(id));
    }


    /**
     * Pour Like un commentaire
     **/
    @PostMapping(value = "/like",consumes = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity likeComment(@RequestBody LikeDTO request){
        this.socialService.likeCommentById(UUID.fromString(request.commentID()), request.like());
        return ResponseEntity.ok().build();
    }


    /**
     * Pour ajouter un retweet à un commentaire
     **/
    @PostMapping(value = "/retweet/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity getRecipeSocial(@PathVariable(value="id") String idComment){
        this.socialService.retweetCommentbyID(UUID.fromString(idComment));
        return ResponseEntity.ok().build();
    }

    @PostMapping(value = "comment/{id}")
    public ResponseEntity commentAComment(@RequestBody CommentDTO request,@PathVariable(value = "id") String parentCommentId){
        Comment comment = new Comment();
        comment.setContent(request.content());
        comment.setDate(Date.from(Instant.now()));
        comment.setId(UUID.randomUUID());
        comment.setTitle(request.title());
        comment.setUser(null);
        comment.setRetweet(0);
        comment.setFile_link(request.filelink());
        comment.setLikes(0);
        comment.setComments(new ArrayList<Comment>());
        this.socialService.addComment(comment);
        this.socialService.commentAComment(comment,UUID.fromString(parentCommentId));
        return ResponseEntity.ok().build();
    }
}
