package com.papermoneytracker.struts2;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;

public class AllTrackingsJsonTable extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5668731869311025040L;
	
	private List<Tracking> gridModelAllTrackings;
	
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
	
	public String execute() {
		 {
			gridModelAllTrackings = TrackingDAO.getAll();
			records = gridModelAllTrackings.size();
		}
		return SUCCESS;
	}

	public String getJSON() {
		return execute();
	}

	public List<Tracking> getGridModelAllTrackings() {
		return gridModelAllTrackings;
	}

	public void setGridModelAllTrackings(List<Tracking> gridModelAllTrackings) {
		this.gridModelAllTrackings = gridModelAllTrackings;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String getSearchOper() {
		return searchOper;
	}

	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getRecords() {
		return records;
	}

	public void setRecords(Integer records) {
		this.records = records;
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

	public String get_() {
		return _;
	}

	public void set_(String _) {
		this._ = _;
	}
	
	

}
