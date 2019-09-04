package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.User;

public interface UserMapper {

	void save(User user);
	boolean update(User user);
	boolean delete(int id);
	User findById(int id);
	List<User> findAll(Page<User> p);
	User checkUser(User user);
	int regUser(User user);
	int checkUserName(User user);
	User checkAdmin(User user);
}
