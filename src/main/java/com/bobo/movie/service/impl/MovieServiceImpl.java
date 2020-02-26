package com.bobo.movie.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bobo.movie.dao.MovieMapper;
import com.bobo.movie.domain.Movie;
import com.bobo.movie.service.MovieService;
import com.bobo.movie.vo.MovieVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Resource
	private MovieMapper movieMapper;

	@Override
	public PageInfo<Movie> selects(MovieVO movieVO,Integer page,Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Movie> list = movieMapper.selects(movieVO);
		return new PageInfo<Movie>(list);
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		// TODO Auto-generated method stub
		return movieMapper.deleteBatch(ids);
	}

}
