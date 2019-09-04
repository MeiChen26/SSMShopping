package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.model.Address;

public interface AddressMapper {

	List<Address> findAddrByUserId(int loginUserId);

	void saveAddress(Address address);

	void updateAddress(Address address);

	void delAddress(String addrId);

	void setDefaultAddress(String addrId);

	void unsetDefaultAddress(int userId);

	Address findAddressById(String addrId);

}
