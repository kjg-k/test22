package json;

import org.json.simple.JSONObject;

public class SungjukDTO {
	private String name;
    private int kuk;
    private int eng;
    
    public Object toJSONObject() {
    	JSONObject json = new JSONObject();
    	
    	json.put("name", name);
    	json.put("kuk", kuk);
    	json.put("eng", eng);
    	
    	return json;
    }
    
	public SungjukDTO() {
		super();
	}
	public SungjukDTO(String name, int kuk, int eng) {
		super();
		this.name = name;
		this.kuk = kuk;
		this.eng = eng;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKuk() {
		return kuk;
	}
	public void setKuk(int kuk) {
		this.kuk = kuk;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
}
