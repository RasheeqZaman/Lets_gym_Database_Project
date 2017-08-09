import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Main {
	
	/*public static void main(String[] args) throws Exception {
		Database_Handler db = new Database_Handler();
		db.getConnection("practice_2", "root", "");
		ResultSet res = db.testQuery("student");
		ArrayList<ArrayList<String>> r = db.getResult(res);
		ArrayList<String> cnames;
        cnames =null;
		try {
			cnames = db.getColumnNames(res);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String[] columnNames = cnames.toArray(new String[cnames.size()]);
		
		Object[][] data = new Object[r.size()][];
		for (int i = 0; i < r.size(); i++) {
		    data[i] = r.get(i).toArray(new String[r.size()]);
		}
		
		for(String i: cnames) {
			System.out.print(i+" ");
		}
		System.out.println("");
		
		for(ArrayList<String> i: r) {
			for(String j: i) {
				System.out.print(j+" ");
			}
			System.out.println("");
		}
		
		System.out.println("Hello World");
	}*/
}
