package com.pt.service;

import com.pt.fenye.Page;
import com.pt.fenye.Result;
import com.pt.po.Critique;

public interface CritiqueService {
	//添加评论
	public void addCritique(Critique critique);
	
	//分页显示评论
	public Result showCritiqueByPage(int AId,Page page);
	
	//获得指定文章的评论数
	public int getCritiqueCount(int AId);
}
