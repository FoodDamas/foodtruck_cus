package org.food.persistence;

import java.util.List;

import org.food.domain.TruckMemberVO;
import org.food.domain.PositionVO;
import org.springframework.stereotype.Repository;

public interface TruckDAO {
	public List<Object> distance(PositionVO vo);
	public Integer distanceLength(PositionVO vo);
}
