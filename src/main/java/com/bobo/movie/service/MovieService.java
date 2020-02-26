package com.bobo.movie.service;

import com.bobo.movie.domain.Movie;
import com.bobo.movie.vo.MovieVO;
import com.github.pagehelper.PageInfo;

public interface MovieService{
	/**模糊查询
	 * 
	 * @param movieVOs
	 * @return
	 */
	PageInfo<Movie> selects(MovieVO movieVO,Integer page,Integer pageSize);
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);
}
