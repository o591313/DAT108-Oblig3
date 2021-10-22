package no.hvl.dat108;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ShoppingList {
	
	private List<String> items = new ArrayList<>();
	
	public String getItem(int index) {
		return items.get(index);
	}
    
    public synchronized void addItem(String item) {
        items.add(item);
    }
    
    public synchronized void removeItem(String item) {
    	System.out.println(item);
    	items.removeIf(i -> i.equals(item));
    }
    
    public List<String> getItems() {
        return items;
    }

}
