package model;

public class Attend {

  private String id;
  
  private String gift;
  
  

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getGift() {
	return gift;
}

public void setGift(String gift) {
	this.gift = gift;
}

@Override
public String toString() {
	return "{\"id\":\"" + id + "\", \"gift\":\"" + gift + "\"}";
}


public Attend(String id, String gift) {
	super();
	this.id = id;
	this.gift = gift;
}
  
  
  
  
}
