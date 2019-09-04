package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.model.Address;

public interface AddressService {

	List<Address> getAddressByUserId(int loginUserId);

	void addAddress(Address address);

	void updateAddress(Address address);

	void delAddress(String addrId);

	void setDefaultAddress(String addrId, int userId);

	Address getAddressById(String addrId);

}
