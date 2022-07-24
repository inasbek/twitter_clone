package swift.back.twitter.infrastructure.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import swift.back.twitter.infrastructure.entities.user.UserAccount;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<UserAccount,UUID> {
    Optional<UserAccount> findUserAccountByEmail(String email);

    Optional<UserAccount> findUserAccountByUsername(String username);
}