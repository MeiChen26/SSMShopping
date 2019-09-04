package cn.edu.neu.test;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.neu.mapper.UserMapper;
import cn.edu.neu.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@Configuration("/config/spring-common.xml")
public class UserTest {

	@Autowired
	private UserMapper userMapper;
	
	@Test
	public void testAdd(){
		User user = new User(-1, 23, "jiuqiyuliang","",0,"",0);
		userMapper.save(user);
		
	}
	
	@Test
	public void testFindAll(){
		//List<User> findAllList = userMapper.findAll();
		//System.out.println(findAllList.size());
	}
	
	@Test
	public void testFindById(){
		User user = userMapper.findById(2);
		System.out.println(user.getUserId());
		System.out.println(user.getUserName());
	}


	@Test
	public void testUpdate(){
		
		User user = new User(2, 23, "yuliang","",0,"",0);
		userMapper.update(user);
	}
	
	@Test
	public void testDelete(){
		userMapper.delete(1);
	}
}
