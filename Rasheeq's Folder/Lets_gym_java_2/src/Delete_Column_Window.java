import java.awt.Checkbox;
import java.awt.EventQueue;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.awt.event.ActionEvent;

public class Delete_Column_Window {

	public JFrame frame;
	ArrayList<String> columnNames;
	private ArrayList<JCheckBox> checkBox;
	Database_Handler db;
	String tableName;
	JTable table;
	/**
	 * Launch the application.

	/**
	 * Create the application.
	 */
	public Delete_Column_Window(ArrayList<String> columnNames, Database_Handler db, String tableName, JTable table) {
		this.db = db;
		this.table = table;
		this.tableName = tableName;
		this.columnNames = columnNames;
		this.checkBox = new ArrayList<JCheckBox>();
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		int i=0;
		for(i=0; i<columnNames.size(); i++) {

			JLabel lblId = new JLabel(columnNames.get(i));
			lblId.setBounds(45, i*30+10, 100, 14);
			frame.getContentPane().add(lblId);
			
			checkBox.add(new JCheckBox(""));
			checkBox.get(i).setBounds(213, i*30+10, 97, 23);
			frame.getContentPane().add(checkBox.get(i));
		}
		
		JButton btnOk = new JButton("OK");
		btnOk.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				for(int i=0; i<columnNames.size(); i++) {
					if(checkBox.get(i).isSelected()) {
						try {
							db.deleteColumn(tableName, columnNames.get(i).toString());
							System.out.println(i);
							table.removeColumn(table.getColumnModel().getColumn(i));
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				frame.dispose();
			}
		});
		btnOk.setBounds(129, i*30+10, 89, 23);
		frame.getContentPane().add(btnOk);
	}
}
