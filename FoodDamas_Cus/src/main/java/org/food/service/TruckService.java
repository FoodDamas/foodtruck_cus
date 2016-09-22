package org.food.service;

import java.util.List;

import org.food.domain.TruckMemberVO;
import org.food.domain.PositionVO;

public interface TruckService {
	public List<Object> distance(PositionVO vo);
	public Integer distanceLength(PositionVO vo);
}
