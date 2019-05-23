package com.shoppingmall.order.contrller;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.shoppingmall.order.vo.OrderVO;

public interface OrderDAO {
	public List<OrderVO> listMyOrderGoods(OrderVO orderBean)throws DataAccessException;
	public OrderVO findMyOrder(String order_id) throws DataAccessException;
	public void removeGoodsFromCart(List<OrderVO>myOrderList) throws DataAccessException;
}
