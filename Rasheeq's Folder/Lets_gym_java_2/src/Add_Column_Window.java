import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.JButton;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.JComboBox;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.awt.event.ActionEvent;

public class Add_Column_Window {

	public JFrame frame;
	private JTextField textField_1;
	private JTextField textField;
	JTable table;
	Database_Handler db;
	JComboBox comboBox;
	String tableName;
	/**
	 * Create the application.
	 */
	public Add_Column_Window(JTable table, Database_Handler db, String tableName) {
		this.table = table;
		this.db = db;
		this.tableName = tableName;
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
		
		JLabel lblColumnName = new JLabel("Column Name");
		lblColumnName.setBounds(39, 44, 97, 33);
		frame.getContentPane().add(lblColumnName);
		
		JLabel lblColumnType = new JLabel("Column Type");
		lblColumnType.setBounds(39, 93, 97, 33);
		frame.getContentPane().add(lblColumnType);
		
		JButton btnOk = new JButton("Ok");
		btnOk.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				DefaultTableModel model = (DefaultTableModel) table.getModel();
				String columnName = textField_1.getText().toString();
				model.addColumn(columnName);
				try {
					db.addColumn(tableName, columnName, comboBox.getSelectedItem().toString(), Integer.parseInt(textField.getText().toString()));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
		btnOk.setBounds(149, 202, 89, 23);
		frame.getContentPane().add(btnOk);
		
		textField_1 = new JTextField();
		textField_1.setBounds(229, 50, 86, 20);
		frame.getContentPane().add(textField_1);
		textField_1.setColumns(10);
		
		String dataType[] = {"VARCHAR", "INT"};
		comboBox = new JComboBox(dataType);
		comboBox.setBounds(229, 99, 86, 20);
		frame.getContentPane().add(comboBox);
		
		JLabel lblLength = new JLabel("Length");
		lblLength.setBounds(39, 144, 79, 33);
		frame.getContentPane().add(lblLength);
		
		textField = new JTextField();
		textField.setBounds(229, 150, 86, 20);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
	}
}
