package com.pt.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.pt.fenye.Page;
import com.pt.fenye.Result;
import com.pt.po.Article;
import com.pt.rss.CreateRss;
import com.pt.service.ArticleService;

public class ShowRSS extends ActionSupport {
	private ArticleService articleService;
	public ArticleService getArticleService() {
		return articleService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public String execute() throws Exception {
		Page page = new Page();		//��ҳ��Ϣ
		page.setCurrentPage(0);		//���õ�ǰҳΪ��һҳ
		page.setEveryPage(10);		//ÿҳ��ʾ10����¼
		Result result = articleService.
			showArticleByPage(page);//ͨ������ҵ���߼��������ɲ�ѯ
		page = result.getPage();
		List<Article> all = result.getList();//������½����
		String filePath = ServletActionContext.
			getServletContext().getRealPath("/rss.xml");//���ö����ļ���ַ
		CreateRss.publishRss(all, filePath);//д�붩���ļ�
		return this.SUCCESS;
	}
}
