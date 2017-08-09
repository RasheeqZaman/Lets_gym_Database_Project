import java.awt.EventQueue;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Insert_Window_Design {

	public JFrame frame;
	private ArrayList<JTextField> textField;
	public ArrayList<String> columnNames, data;
	JTable table;
	Database_Handler db;
	String tableName;
	/**
	 * Create the application.
	 */
	public Insert_Window_Design(ArrayList<String> columnNames, JTable table, Database_Handler db,String tableName) {
		this.columnNames = columnNames;
		this.table = table;
		textField = new ArrayList<JTextField>();
		data = new ArrayList<String>();
		this.db = db;
		this.tableName=tableName;
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 489, 350);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		int i=0;
		for(i=0; i<columnNames.size(); i++) {

			JLabel lblId = new JLabel(columnNames.get(i));
			lblId.setBounds(45, i*30+10, 100, 14);
			frame.getContentPane().add(lblId);
			
			textField.add(new JTextField());
			textField.get(i).setBounds(200, i*30+10, 150, 25);
			frame.getContentPane().add(textField.get(i));
			textField.get(i).setColumns(10);
		}
		
		JButton btnNewButton = new JButton("Submit");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				for(int i=0; i<columnNames.size(); i++) {
					data.add(textField.get(i).getText().toString());
				}
				DefaultTableModel model = (DefaultTableModel) table.getModel();
				model.addRow(data.toArray());
				db.insertData(data, tableName);
				frame.dispose();
			}
		});
		btnNewButton.setBounds(173, i*30+10, 89, 23);
		frame.getContentPane().add(btnNewButton);
	}
	
	public ArrayList<String> getData(){
		return data;
	}
}
