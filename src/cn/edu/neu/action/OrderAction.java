package cn.edu.neu.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Address;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;

@Controller
@SessionAttributes(types={String[].class})
@RequestMapping("/order")
public class OrderAction extends BaseAction{
	
	@RequestMapping("/buyGoods")
	public String buyGoods(@RequestParam(required=false) String[] goodsId,@RequestParam(required=false) String[] goodsName,@RequestParam(required=false) String[] goodsPrice,
			@RequestParam(required=false) String[] goodsDiscount,@RequestParam(required=false) String[] num,@RequestParam(required=false) String[] size,
			@RequestParam(required=false) String[] color,
			@RequestParam(required=false) String[] pic,@RequestParam(required=false) String[] goodsPostalfee,
			Map<String,Object> m){
		if(goodsId!=null && goodsName!=null && goodsPrice!=null && goodsDiscount!=null && num!=null
				&& size!=null && color!=null && pic!=null && goodsPostalfee!=null ){
/*			for(int i=0;i<goodsId.length;i++){
				System.out.println(goodsId[i]);
				System.out.println(goodsName[i]);
				System.out.println(goodsPrice[i]);
				System.out.println(goodsDiscount[i]);
				System.out.println(num[i]);
				System.out.println(size[i]);
				System.out.println(color[i]);
				System.out.println(pic[i]);
			}
*/
			
		}	
		m.put("goodsId", goodsId);
		m.put("goodsName", goodsName);
		m.put("goodsDiscount", goodsDiscount);
		m.put("size", size);
		m.put("color", color);
		m.put("num", num);
		//m.put("goodsPostalfee", goodsPostalfee);
		m.put("pic",pic);
		List<Address> addrs=this.getServMgr().getAddressService().getAddressByUserId(this.getLoginUserId());
		m.put("addrs", addrs);
		return "/order/buyGoods";
	}
	
	@RequestMapping("/addOrder")
	public String addOrder(@RequestParam String address,@RequestParam String orderPostalfee, HttpSession session,
			Map<String,String> m){
		/*System.out.println(address);	
		for(int i=0;i<((String[])session.getAttribute("goodsId")).length;i++){
			System.out.print(((String[])session.getAttribute("goodsId"))[i]+"  ");
			System.out.print(((String[])session.getAttribute("goodsName"))[i]+"  ");
			System.out.print(((String[])session.getAttribute("goodsDiscount"))[i]+"  ");
			System.out.print(((String[])session.getAttribute("size"))[i]+"  ");
			System.out.print(((String[])session.getAttribute("color"))[i]+"  ");
			System.out.print(((String[])session.getAttribute("num"))[i]+"  ");
			System.out.println(orderPostalfee);
			
		}*/
		/*	Map<String,String[]> m=new HashMap<String,String[]>();
		m.put("goodsId", (String[])session.getAttribute("goodsId"));
		m.put("orderName", (String[])session.getAttribute("goodsName"));
		m.put("orderPrice", (String[])session.getAttribute("goodsDiscount"));
		m.put("orderSize", (String[])session.getAttribute("size"));
		m.put("orderColor", (String[])session.getAttribute("color"));
		m.put("orderNum", (String[])session.getAttribute("num"));
		m.put("orderPic", (String[])session.getAttribute("pic"));*/
		Order order=new Order();
		order.setUserId(this.getLoginUserId());
		order.setOrderAddress(address);
		order.setOrderPostalfee(Float.parseFloat(orderPostalfee));

		List<OrderDetail> orderDetails=new ArrayList<OrderDetail>();
		for(int j=0;j<((String[])session.getAttribute("goodsId")).length;j++){
			OrderDetail od=new OrderDetail();
			od.setGoodsId(Integer.parseInt(((String[])session.getAttribute("goodsId"))[j]));
			od.setOdetailName(((String[])session.getAttribute("goodsName"))[j]);
			od.setOdetailPrice(Float.parseFloat(((String[])session.getAttribute("goodsDiscount"))[j]));
			od.setOdetailSize(((String[])session.getAttribute("size"))[j]);
			od.setOdetailColor(((String[])session.getAttribute("color"))[j]);
			od.setOdetailNum(Integer.parseInt(((String[])session.getAttribute("num"))[j]));
			od.setOdetailPic(((String[])session.getAttribute("pic"))[j]);
			orderDetails.add(od);
		}
		//System.out.println(orderDetails);
		try{
			
			this.getServMgr().getOrderService().addOrder(order,orderDetails);
			m.put("orderId",order.getOrderId()+"");
			return "/order/addOrder";
		}
		catch(Exception e){
			e.printStackTrace();
			this.addMessage("提交订单失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}
	}
	
	@RequestMapping("/toPay")
	public String toPay(@RequestParam String orderId,Map<String,String> m){
		m.put("orderId",orderId);
		return "/order/addOrder";
	}
	@RequestMapping("/payForOrder")
	public String payForOrder(@RequestParam String orderId,Map<String,String> m){
		try{
			this.getServMgr().getOrderService().changeOrderStatus(orderId,Constants.ORDER_PAID);
			m.put("orderId",orderId);
			return "forward:/order/getMyOrders";
		}
		catch(Exception e){
			e.printStackTrace();
			return EXECUTE_RESULT;
		}
	}
	@RequestMapping("/pay")
	public String pay(@RequestParam String orderId,Map<String,String> m){
		try{
			
			return "/order/pay";
		}
		catch(Exception e){
			e.printStackTrace();
			return EXECUTE_RESULT;
		}
	}
	
	@RequestMapping("/getMyOrders")
	public String getMyOrders(@RequestParam(required=false) String status,Map<String,Page<Order>> m){
		System.out.println("-----------"+status);
		Page<Order> orders=this.getServMgr().getOrderService().getMyOrders(this.getLoginUserId(),status);
		m.put("orders", orders);
		return "/order/orderList";
	}
	
	@RequestMapping("/delOrder")
	public String delOrder(@RequestParam String orderId){
		try{
			int status=this.getServMgr().getOrderService().getOrderStatusById(orderId);
			if(status==Constants.ORDER_SUCCEED || status==Constants.ORDER_CLOSED){
				this.getServMgr().getOrderService().delOrder(orderId);
				//return "forward:/order/getMyOrders";
				return "forward:"+getReferUrl();
			}else{
				this.addMessage("抱歉，目前的订单状态不允许删除订单");
				this.addRedirURL("返回", "@back");
				return EXECUTE_RESULT;
			}
		}
		catch(Exception e){
			e.printStackTrace();
			this.addMessage("删除订单失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}
	}
	
	@ResponseBody
	@RequestMapping("/handleOrderStatus")
	public Map<String,String> handleOrderStatus(@RequestParam String orderId,@RequestParam int status){
		Map<String,String> m=new HashMap<String,String>();
		try{
			
			switch(status){
			case 2://申请退款
				//System.out.println("----"+this.getServMgr().getOrderService().getOrderStatusById(orderId));
				if(this.getServMgr().getOrderService().getOrderStatusById(orderId)==Constants.ORDER_PAID){
					this.getServMgr().getOrderService().changeOrderStatus(orderId,status);
					m.put("handle", "success");
				}else{
					m.put("handle", "failure");
				}
				break;
			case 5://确认收货
				if(this.getServMgr().getOrderService().getOrderStatusById(orderId)==Constants.ORDER_SENDING){
					this.getServMgr().getOrderService().changeOrderStatus(orderId,status);
					m.put("handle", "success");
				}else{
					m.put("handle", "failure");
				}
				break;
			case 6://申请退货
				if(this.getServMgr().getOrderService().getOrderStatusById(orderId)==Constants.ORDER_SENDING){
					this.getServMgr().getOrderService().changeOrderStatus(orderId,status);
					m.put("handle", "success");
				}else{
					m.put("handle", "failure");
				}	
				break;
			case 9://取消订单
				if(this.getServMgr().getOrderService().getOrderStatusById(orderId)==Constants.ORDER_WAITING){
					this.getServMgr().getOrderService().changeOrderStatus(orderId,status);
					m.put("handle", "success");
				}else{
					m.put("handle", "failure");
				}	
				break;
			default:
				m.put("handle", "failure");
				break;
			}		
		}
		catch(Exception e){
			e.printStackTrace();		
			m.put("handle", "exception");
		}
		return m;
	}
	
	@RequestMapping("/getOrderDetailById")
	public String getOrderDetailById(@RequestParam String orderId,Map<String,Order> m){
		Order orderDetail=this.getServMgr().getOrderService().getOrderDetailById(orderId);
		m.put("orderDetail", orderDetail);
		return "/order/orderDetail";
	}
	

}
