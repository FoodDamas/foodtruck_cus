package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.MemberVO;
import org.food.domain.PositionVO;
import org.food.persistence.TruckDAO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class TruckServiceImpl implements TruckService {
	@Inject
	TruckDAO dao;

	@Override
	public List<Object> distance(PositionVO vo) {
		return dao.distance(vo);
	}



}
