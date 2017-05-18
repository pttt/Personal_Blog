package com.pt.dao;

import java.util.List;

import com.pt.fenye.Page;
import com.pt.po.Critique;

public interface CritiqueDAO {
	//�������
	public void addCritique(Critique critique);
	
	//���ָ�����µ�������
	public int queryCritiqueCount(int AId);
	
	//����Page����ѯָ�����µ�����
	public List<Critique> queryByPage(int AId,Page page);
}
