package cn.edu.neu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.OrderMapper;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;
import cn.edu.neu.model.Size;
import cn.edu.neu.service.OrderService;
@Transactional
@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper mapper;

	@Override
	public int addOrder(Order order,List<OrderDetail> orderDetails) {
		// TODO Auto-generated method stub
		Date d=new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str=sf.format(d);
		Random r=new Random();
		int i=r.nextInt(100);
		String s="";
		if(i<10)
			s="00"+i;
		else if(i>=10&&i<=99)
			s="0"+i;
		String orderCode=str+s;
		
	
		order.setOrderCode(orderCode);
		mapper.saveOrder(order);
		int orderId=order.getOrderId();
		System.out.println("---------"+order.getOrderId());
		
		for(int j=0;j<orderDetails.size();j++){
			OrderDetail od=orderDetails.get(j);
			od.setOrderId(orderId);
			mapper.saveOrderDetail(od);
		}
		
		return orderId;
	}

	@Override
	public Page<Order> getMyOrders(int loginUserId,String status) {
		// TODO Auto-generated method stub
		Page<Order> page = new Page<Order>(10);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("userId", loginUserId+"");
		m.put("status", status);
		page.setParams(m);
		List<Order> orderList=mapper.findMyOrders(page);
		System.out.println(orderList);
		page.setList(orderList);
		return page;
	}

	@Override
	public void delOrder(String orderId) {
		// TODO Auto-generated method stub
		mapper.delOrderDetail(orderId);
		mapper.delOrder(orderId);
	}

	@Override
	public void changeOrderStatus(String orderId,int status) {
		// TODO Auto-generated method stub
		Map<String,String> m=new HashMap<String,String>();
		m.put("orderId", orderId);
		mapper.updateOrderStatus(orderId,status);
	}

	@Override
	public int getOrderStatusById(String orderId) {
		// TODO Auto-generated method stub
		int status=mapper.findOrderStatusById(Integer.parseInt(orderId));
		return status;
	}

	@Override
	public Order getOrderDetailById(String orderId) {
		// TODO Auto-generated method stub
		Order orderDetail=mapper.findOrderDetailById(orderId);
		return orderDetail;
	}

	@Override
	public Page<Order> getAdminOrders(String orderCode, String userName, String orderStatus, String startDate,
			String endDate, String sort) {
		// TODO Auto-generated method stub
		Page<Order> page = new Page<Order>(10);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("orderCode", orderCode);
		m.put("userName", userName);
		m.put("orderStatus", orderStatus);
		m.put("startDate", startDate);
		m.put("endDate", endDate);
		m.put("sort", sort);
		page.setParams(m);
		List<Order> orderList=mapper.findOrders(page);
		page.setList(orderList);
		return page;
	}

	@Override
	public void updateOrderPostInfo(String orderId, String orderPostname, String orderPostcode,int status) {
		// TODO Auto-generated method stub
		mapper.updateOrderPostInfo(orderId, orderPostname, orderPostcode,status);
	}

	@Override
	public void delOrderByIds(String[] orderIds) {
		// TODO Auto-generated method stub
		for(int i=0;i<orderIds.length;i++){
			mapper.delOrderDetail(orderIds[i]);
			mapper.delOrder(orderIds[i]);
		}
	}

	@Override
	public Integer[] getOrderStatusByIds(String[] orderIds) {
		// TODO Auto-generated method stub
		return mapper.findOrderStatusByIds(orderIds);
	}

}
