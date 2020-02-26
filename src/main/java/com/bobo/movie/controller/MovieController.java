package com.bobo.movie.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bobo.movie.domain.Movie;
import com.bobo.movie.service.MovieService;
import com.bobo.movie.vo.MovieVO;
import com.github.pagehelper.PageInfo;
//1710E 改变了
@Controller

public class MovieController {
	
	@Resource
	private MovieService movieService;
	
	/**
	 * 列表
	 * @param movieVO
	 * @param model
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("selects")
	public String list(MovieVO movieVO,Model model,@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "2")Integer pageSize) {
		 PageInfo<Movie> info = movieService.selects(movieVO, page, pageSize);
		model.addAttribute("info",info);
		model.addAttribute("movieVO",movieVO);
		
		return "movies";
	}

	/**
	 * 批量删除
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteBatch")
	public boolean deleteBatch(@RequestParam("ids[]") Integer[] ids) {
		
		return movieService.deleteBatch(ids) >0;
	}
}
