package com.shoppingmall.order.contrller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.shoppingmall.order.vo.OrderVO;

public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	private SqlSession sqlSession;

	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException {
		List<OrderVO> orderGoodsList = new ArrayList<OrderVO>();
		orderGoodsList = (ArrayList)sqlSession.selectList("mapper.order.selectMyOrderList", orderVO);
		return orderGoodsList;
	}
	
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException {
		int order_id = selectOrderID();
		for(int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO)myOrderList.get(i);
			orderVO.setOrder_id(order_id);
			sqlSession.insert("mapper.order.insertNewOrder", order_id);
		}
	}

	private int selectOrderID() throws DataAccessException{
		return sqlSession.selectOne("mapper.order.selectOrderID");
	}

	public OrderVO findMyOrder(String order_id) throws DataAccessException {
		OrderVO orderVO = (OrderVO)sqlSession.selectOne("mapper.order.selectMyOrder",order_id);
		return null;
	}

	@Override
	public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException {
		for(int i = 0; i < myOrderList.size() ; i++) {
			OrderVO orderVO = (OrderVO) myOrderList.get(i);
			sqlSession.delete("mapper.order.deleteGoodsFromCart", orderVO);
		}
	}

}
