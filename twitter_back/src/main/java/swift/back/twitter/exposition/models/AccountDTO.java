package swift.back.twitter.exposition.models;

public record AccountDTO(
        String email,
        String password,
        String username,
        String fullname,
        String profileImage
){}
