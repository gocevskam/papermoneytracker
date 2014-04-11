package com.papermoneytracker.struts2;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;

public class JsonTable extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 6294965300966835258L;

	private List<Tracking> gridModel;

	private Integer rows = 0;
	private Integer page = 0;
	private String sord;
	private String sidx;
	private String searchField;
	private String searchString;
	private String searchOper;
	private Integer total = 1;
	private Integer records;
	private String _;
	private String nd;
	private String _search;

	private Map<String, Object> session;
	
	public String execute() {
		MoneyUser u = (MoneyUser) session.get("user");
		if (u != null) {
			gridModel = TrackingDAO.getAllFrom(u.getUsername());
			records = gridModel.size();
		}
		return SUCCESS;
	}

	public String getJSON() {
		return execute();
	}

	public List<Tracking> getGridModel() {
		return gridModel;
	}

	public void setGridModel(List<Tracking> gridModel) {
		this.gridModel = gridModel;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getRecords() {
		return records;
	}

	public void setRecords(Integer records) {
		this.records = records;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public String getSearchOper() {
		return searchOper;
	}

	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String get_() {
		return _;
	}

	public void set_(String _) {
		this._ = _;
	}

	public String getNd() {
		return nd;
	}

	public void setNd(String nd) {
		this.nd = nd;
	}

	public String get_search() {
		return _search;
	}

	public void set_search(String _search) {
		this._search = _search;
	}
}
