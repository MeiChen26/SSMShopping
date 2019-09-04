package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.UserMapper;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;



@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper mapper;

	public boolean delete(int id) {
		
		return mapper.delete(id);
	}

	public Page<User> findAll() {
		//开始分页
		//PageHelper.startPage();
		//紧跟着的第一个select方法会被分页
		Page<User> page = new Page<User>(2);
		Map<String, Object> m=new HashMap<String,Object>();
		m.put("name","%a%");
		m.put("age",10);
		page.setParams(m);
		List<User> findAllList = mapper.findAll(page);
		//用Page对结果进行包装
		 page.setList(findAllList);  
		 System.out.println(page);
		return page;
	}

	public User findById(int id) {

		User user = mapper.findById(id);
		
		return user;
	}

	public void save(User user) {

		mapper.save(user);
	}

	public boolean update(User user) {

		return mapper.update(user);
	}

	@Override
	public User checkUser(User user) {
		// TODO Auto-generated method stub
		return mapper.checkUser(user);
	}
	
	@Override
	public boolean regUser(User user) {
		// TODO Auto-generated method stub
		if(mapper.checkUserName(user)==0){
			try{
				System.out.println(mapper.regUser(user));	
				//System.out.println(user);
				return true;
			}
			catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
		else
			return false;
	}

	@Override
	public boolean checkUserName(String userName) {
		// TODO Auto-generated method stub
		User user=new User();
		user.setUserName(userName);
		if(mapper.checkUserName(user)==0)
			return true;
		else
			return false;
	}

	@Override
	public User checkAdmin(User user) {
		// TODO Auto-generated method stub
		return mapper.checkAdmin(user);
	}
}
