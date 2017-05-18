package com.pt.dao;

import java.util.List;

import com.pt.fenye.Page;
import com.pt.po.Critique;

public interface CritiqueDAO {
	//添加评论
	public void addCritique(Critique critique);
	
	//获得指定文章的评论数
	public int queryCritiqueCount(int AId);
	
	//根据Page来查询指定文章的评论
	public List<Critique> queryByPage(int AId,Page page);
}
