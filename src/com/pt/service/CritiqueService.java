package com.pt.service;

import com.pt.fenye.Page;
import com.pt.fenye.Result;
import com.pt.po.Critique;

public interface CritiqueService {
	//�������
	public void addCritique(Critique critique);
	
	//��ҳ��ʾ����
	public Result showCritiqueByPage(int AId,Page page);
	
	//���ָ�����µ�������
	public int getCritiqueCount(int AId);
}
