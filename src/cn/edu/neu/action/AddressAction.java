package cn.edu.neu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.model.Address;

@Controller
@RequestMapping("/address")
public class AddressAction extends BaseAction {
	@RequestMapping("/getMyAddress")
	public String getMyAddress(Map<String,List<Address>> m){
		List<Address> addrs=this.getServMgr().getAddressService().getAddressByUserId(this.getLoginUserId());
		m.put("addrs", addrs);
		return "/address/addressList";
	}
	
	@RequestMapping("/handleAddress")
	public String handleAddress(Address address){
		try{System.out.println("======="+address.getAddrId());
			if(address.getAddrId()==0){
				address.setUserId(this.getLoginUserId());
				this.getServMgr().getAddressService().addAddress(address);			
			}
			else{
				this.getServMgr().getAddressService().updateAddress(address);
			}
			return "forward:/address/getMyAddress";
		}catch(Exception e){
			e.printStackTrace();
			this.addMessage("操作收货地址失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}
	}
	
	@RequestMapping("/delAddress")
	public String delAddress(@RequestParam String addrId){
		try{
			this.getServMgr().getAddressService().delAddress(addrId);
			return "forward:/address/getMyAddress";
		}catch(Exception e){
			e.printStackTrace();
			this.addMessage("删除收货地址失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}
	}
	
	@ResponseBody
	@RequestMapping("/setDefaultAddress")
	public Map<String,String> setDefaultAddress(@RequestParam String addrId){
		Map<String,String> m=new HashMap<String,String>();
		try{ 
			int userId=this.getLoginUserId();
			this.getServMgr().getAddressService().setDefaultAddress(addrId,userId);
			m.put("setDefault","success");
		}catch(Exception e){
			e.printStackTrace();
			m.put("setDefault","failure");
		}
		return m;
	}
	
	@ResponseBody
	@RequestMapping("getAddressById")
	public Map<String,Address> getAddressById(@RequestParam String addrId){
		Map<String,Address> m=new HashMap<String,Address>();
		try{ 
			Address addr=this.getServMgr().getAddressService().getAddressById(addrId);
			m.put("addr",addr);
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("-------"+m);
		return m;
	}

	////////////////////////////////////////Ajax////////////////////////////////////////////
	@RequestMapping("/getMyAddressAjax")
	public String getMyAddressAjax(Map<String, List<Address>> m) {
		List<Address> addrs = this.getServMgr().getAddressService().getAddressByUserId(this.getLoginUserId());
		m.put("addrs", addrs);
		return "/address/addressListAjax";
	}

	@RequestMapping("/handleAddressAjax")
	public String handleAddressAjax(Address address) {
		try {
			System.out.println("=======" + address.getAddrId());
			if (address.getAddrId() == 0) {
				address.setUserId(this.getLoginUserId());
				this.getServMgr().getAddressService().addAddress(address);
			} else {
				this.getServMgr().getAddressService().updateAddress(address);
			}
			return "forward:/address/getMyAddressAjax";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}

	@RequestMapping("/delAddressAjax")
	public String delAddressAjax(@RequestParam String addrId) {
		try {
			this.getServMgr().getAddressService().delAddress(addrId);
			return "forward:/address/getMyAddressAjax";
		} catch (Exception e) {
			e.printStackTrace();
			this.addMessage("删除收货地址失败");
			this.addRedirURL("返回", "@back");
			return EXECUTE_RESULT;
		}
	}

/*	@ResponseBody
	@RequestMapping("/setDefaultAddressAjax")
	public Map<String, String> setDefaultAddressAjax(@RequestParam String addrId) {
		Map<String, String> m = new HashMap<String, String>();
		try {
			this.getServMgr().getAddressService().setDefaultAddress(addrId);
			m.put("setDefault", "success");
		} catch (Exception e) {
			e.printStackTrace();
			m.put("setDefault", "failure");
		}
		return m;
	}

	@ResponseBody
	@RequestMapping("getAddressByIdAjax")
	public Map<String, Address> getAddressByIdAjax(@RequestParam String addrId) {
		Map<String, Address> m = new HashMap<String, Address>();
		try {
			Address addr = this.getServMgr().getAddressService().getAddressById(addrId);
			m.put("addr", addr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("-------" + m);
		return m;
	}*/
}
