package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;

public interface OrderService {

	int addOrder(Order order,List<OrderDetail> orderDetails);

	Page<Order> getMyOrders(int loginUserId,String status);

	void delOrder(String orderId);

	void changeOrderStatus(String orderId, int status);

	int getOrderStatusById(String orderId);

	Order getOrderDetailById(String orderId);

	Page<Order> getAdminOrders(String orderCode, String userName, String orderStatus, String startDate, String endDate,
			String sort);

	void updateOrderPostInfo(String orderId, String orderPostname, String orderPostcode, int status);

	void delOrderByIds(String[] orderIds);

	Integer[] getOrderStatusByIds(String[] orderIds);

}
