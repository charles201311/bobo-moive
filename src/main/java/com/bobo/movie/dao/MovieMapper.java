package com.bobo.movie.dao;

import java.util.List;

import com.bobo.movie.domain.Movie;
import com.bobo.movie.vo.MovieVO;

public interface MovieMapper {
	
	/**模糊查询
	 * 
	 * @param movieVOs
	 * @return
	 */
	List<Movie> selects(MovieVO movieVOs);
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);
	
	

}
