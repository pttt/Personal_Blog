package com.pt.dao;

import com.pt.po.BlogInfo;

public interface BlogInfoDAO {
	//���ø��Ի�����
	public void save(BlogInfo info);
	//���
	public BlogInfo get(String username);
}
