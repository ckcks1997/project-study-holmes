package model;


public class Search {
	
	private String part;
	private String searchData;
	
	public Search() {
		
	}

	public Search(String part, String searchData) {
		super();
		this.part = part;
		this.searchData = searchData;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}

	
}
