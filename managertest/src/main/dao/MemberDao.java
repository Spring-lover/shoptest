package main.dao;

import main.domain.Member;

public interface MemberDao {
    Member findUserByUsernameAndPassword(String username, String password);
}
