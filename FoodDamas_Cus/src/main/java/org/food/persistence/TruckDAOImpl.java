package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.TruckMemberVO;
import org.food.domain.PositionVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TruckDAOImpl implements TruckDAO {
	@Inject
	private SqlSessionTemplate sqlsession;

	@Override
	public List<Object> distance(PositionVO vo) {

		return sqlsession.selectList("org.food.service.TruckListMapper.distance", vo);
	}

}
