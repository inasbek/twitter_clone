package swift.back.twitter.exposition.models;

import swift.back.twitter.infrastructure.entities.user.User;

public record CommentDTO(
        String content,
        String title,
        User user,
        String filelink
){}
