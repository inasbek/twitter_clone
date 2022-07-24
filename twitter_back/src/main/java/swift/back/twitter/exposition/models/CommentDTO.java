package swift.back.twitter.exposition.models;

import swift.back.twitter.infrastructure.entities.user.User;
import swift.back.twitter.infrastructure.entities.user.UserAccount;

public record CommentDTO(
        String content,
        String title,
        UserAccount user,
        String filelink
){}
