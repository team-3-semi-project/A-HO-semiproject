package com.ahohotel.hotellist.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.hotellist.model.dto.HotelListDTO;

public class HotelListDAO {

	public List<HotelListDTO> searchHotelList(SqlSession session, SelectCriteria selectCriteria){
		
		return session.selectList("HotelListDAO.selectHotelList", selectCriteria);
	}
	
}
