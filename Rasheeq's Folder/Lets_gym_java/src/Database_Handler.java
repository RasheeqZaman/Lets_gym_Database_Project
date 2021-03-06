
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class Database_Handler {
    static Connection connect = null;
    Statement statement = null;
    ResultSet result = null;
    PreparedStatement pStatement = null;
    
    Database_Handler(){
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/lets_gym_database";
		try {
			Class.forName(driver);
			connect = DriverManager.getConnection(url, "root", "");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    public boolean getConnection(String userName, String password){
		
		return false;	
	}
    
    public ArrayList<ArrayList<String>> getData(String tableName){
        try{
            String query ="SELECT * FROM "+tableName;
            statement = connect.createStatement();
            result = statement.executeQuery(query);
        }catch(Exception e){
            e.printStackTrace();
        }
        return getResult(result);
    }
    
    public ArrayList<String> showTables(){

        ArrayList<String> records = new ArrayList<String>();
        try{
            
            String query ="SHOW TABLES";
            statement = connect.createStatement();
            result = statement.executeQuery(query);
            try {
                while(result.next()){
                    records.add(result.getString(1));
                }
                
            }catch(Exception e){
                e.printStackTrace();
            }
            
            
        }catch(Exception e){
            System.out.println("2.Error in query..");
            e.printStackTrace();
        }
        return records;
    }
    
    public void deleteRow(String tableName, String data) throws SQLException {
    	PreparedStatement st = connect.prepareStatement("DELETE FROM "+tableName+" WHERE "+getPrimaryKey(tableName)+" = "+data);
    	st.executeUpdate();
    }
    
    public void addColumn(String table_name, String column_name, String datatype, int length) throws SQLException {
    	PreparedStatement st = connect.prepareStatement("ALTER TABLE "+table_name+" ADD "+column_name+" "+datatype+"("+length+")");
    	st.executeUpdate();
    }
    
    public void deleteColumn(String table_name, String column_name) throws SQLException {
    	PreparedStatement st = connect.prepareStatement("ALTER TABLE "+table_name+" DROP COLUMN "+column_name);
    	st.executeUpdate();
    }
    public String getPrimaryKey(String tableName) throws SQLException {
    	String query = "SHOW KEYS FROM "+tableName+" WHERE Key_name = 'PRIMARY'";
        pStatement = connect.prepareStatement(query);
        ResultSet res = pStatement.executeQuery();
        res.next();
		return res.getString(5);
    	
    }
    
    public ArrayList<String> getColumnNames(ResultSet result) throws SQLException{
    	ArrayList<String> colName = new ArrayList<String>();
        for(int i = 1 ; i <= result.getMetaData().getColumnCount() ; i++){
            colName.add(result.getMetaData().getColumnName(i));
        }
        return colName;
    }
    
    public ArrayList<ArrayList<String>> getResult(ResultSet result){
        
        ArrayList<ArrayList<String>> records = new ArrayList<ArrayList<String>>();
        try {
            while(result.next()){
                ArrayList<String> r = new ArrayList<String>();
                for(int i = 1 ; i <= result.getMetaData().getColumnCount() ; i++){
                    r.add(result.getString(i));
                }
                records.add(r);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return records;
    }
    
    public void insertData(ArrayList<String> data, String tableName){
        
        try{
            
            String query = "INSERT INTO "+tableName+" VALUES(";
            for(int i=1; i<data.size(); i++) {
            	query+= "?,";
            }
            query+="?)";
            pStatement = connect.prepareStatement(query);
            for(int i=0; i<data.size(); i++) {
            	pStatement.setString(i+1,data.get(i).toString());
            }
            pStatement.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
}
