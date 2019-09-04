package cn.edu.neu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.mapper.AddressMapper;
import cn.edu.neu.model.Address;
import cn.edu.neu.service.AddressService;

@Service
@Transactional 
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressMapper mapper;

	@Override
	public List<Address> getAddressByUserId(int loginUserId) {
		// TODO Auto-generated method stub
		List<Address> addrs=mapper.findAddrByUserId(loginUserId);
		return addrs;
	}

	@Override
	public void addAddress(Address address) {
		// TODO Auto-generated method stub
		mapper.saveAddress(address);
	}

	@Override
	public void updateAddress(Address address) {
		// TODO Auto-generated method stub
		mapper.updateAddress(address);
	}

	@Override
	public void delAddress(String addrId) {
		// TODO Auto-generated method stub
		mapper.delAddress(addrId);
	}
	@Override
	public void setDefaultAddress(String addrId, int userId) {
		// TODO Auto-generated method stub
		mapper.unsetDefaultAddress(userId);
		mapper.setDefaultAddress(addrId);
	}

	@Override
	public Address getAddressById(String addrId) {
		// TODO Auto-generated method stub
		Address addr=mapper.findAddressById(addrId);
		return addr;
	}
}
