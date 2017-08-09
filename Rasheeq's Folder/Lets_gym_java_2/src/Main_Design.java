import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.ComboBoxModel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;

import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.JScrollPane;
import javax.swing.JComboBox;

public class Main_Design {

	private JFrame frame;
	private JTable table_1;
	public Database_Handler db;
	public ArrayList<String> cnames;
	public Object[] newRow;
	JComboBox comboBox, comboBox2;
	JPanel panelConnectPage, panelStartPage;
	
	/**
	 * Launch the application.
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main_Design window = new Main_Design();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 * @throws Exception 
	 */
	public Main_Design() throws Exception {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 * @throws Exception 
	 */
	private void initialize() throws Exception {
		
		db = new Database_Handler();
		db.getConnection("lets_gym_database", "root", "");
        
		frame = new JFrame();
		frame.setBounds(100, 100, 706, 457);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		panelConnectPage = new JPanel();
		panelConnectPage.setVisible(true);
		panelConnectPage.setBounds(0, 0, 706, 457);
		panelConnectPage.setLayout(null);
		frame.getContentPane().add(panelConnectPage);
		
		JButton btnConnect = new JButton("Connect");
		btnConnect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				/*Connect_Window_Design cwd = new Connect_Window_Design();
				cwd.frame.setVisible(true);*/
				panelConnectPage.setVisible(false);
				panelStartPage.setVisible(true);
				
			}
		});
		btnConnect.setBounds(250, 250, 200, 30);
		panelConnectPage.add(btnConnect);
		
		JTextField txtUserName = new JTextField();
		txtUserName.setText("UserName");
		txtUserName.setBounds(250, 150, 200, 30);
		panelConnectPage.add(txtUserName);
		
		JPasswordField txtpswrd = new JPasswordField();
		txtpswrd.setText("Password");
		txtpswrd.setBounds(250, 200, 200, 30);
		panelConnectPage.add(txtpswrd);
		
		panelStartPage = new JPanel();
		panelStartPage.setBounds(0, 0, 706, 457);
		panelStartPage.setVisible(false);
		panelStartPage.setLayout(null);
		frame.getContentPane().add(panelStartPage);
		
		JButton btnInsert = new JButton("Insert");
		btnInsert.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Insert_Window_Design iwd = new Insert_Window_Design(cnames, table_1, db, comboBox.getSelectedItem().toString());
				iwd.frame.setVisible(true);
			}
		});
		btnInsert.setBounds(10, 45, 89, 23);
		panelStartPage.add(btnInsert);
		
		JButton btnDelete = new JButton("Delete");
		btnDelete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				System.out.println(table_1.getSelectedRow() + ":" + table_1.getSelectedColumn());
				try {
					String tableName = comboBox.getSelectedItem().toString();
					int columnIndex = getColumnIndex(db.getPrimaryKey(tableName));
					//System.out.println("Row Index:"+table_1.getSelectedRow()+" Column Index:"+columnIndex);
					
					String deleteData = table_1.getValueAt(table_1.getSelectedRow(), columnIndex).toString();
					//System.out.println(deleteData);
					db.deleteRow(tableName, deleteData);;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				DefaultTableModel model = (DefaultTableModel) table_1.getModel();
				model.removeRow(table_1.getSelectedRow());
			}
		});
		btnDelete.setBounds(109, 45, 89, 23);
		panelStartPage.add(btnDelete);
		
		JButton btnDeleteColumn = new JButton("Delete Column");
		btnDeleteColumn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Delete_Column_Window dcw = new Delete_Column_Window(cnames, db, comboBox.getSelectedItem().toString(), table_1);
				dcw.frame.setVisible(true);
			}
		});
		btnDeleteColumn.setBounds(422, 45, 128, 23);
		panelStartPage.add(btnDeleteColumn);
		
		JButton btnAddColumn = new JButton("Add Column");
		btnAddColumn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Add_Column_Window acw = new Add_Column_Window(table_1, db, comboBox.getSelectedItem().toString());
				acw.frame.setVisible(true);
			}
		});
		btnAddColumn.setBounds(560, 45, 120, 23);
		panelStartPage.add(btnAddColumn);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 122, 670, 285);
		panelStartPage.add(scrollPane);
		
		/*ResultSet res = db.testQuery("student");
		ArrayList<ArrayList<String>> r = db.getResult(res);
        ArrayList<String> cnames = db.getColumnNames(res);
		
		String[] columnNames = cnames.toArray(new String[cnames.size()]);
		
		Object[][] data = new Object[r.size()][];
		for (int i = 0; i < r.size(); i++) {
		    data[i] = r.get(i).toArray(new String[r.size()]);
		}
		
		table_1 = new JTable(data, columnNames);
		scrollPane.setViewportView(table_1);
		*/
		
		
		
		ArrayList<String> tableNamesList = db.showTables();
		
		comboBox = new JComboBox(tableNamesList.toArray());
		comboBox.setBounds(215, 12, 200, 20);
		panelStartPage.add(comboBox);
		comboBox.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ResultSet res = db.testQuery(comboBox.getSelectedItem().toString());
				ArrayList<ArrayList<String>> r = db.getResult(res);
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
				
				table_1 = new JTable(new DefaultTableModel(data, columnNames));
				scrollPane.setViewportView(table_1);
			}
		});
		
		
		String queryTitle[] = {"This week's Class List", "Total amount earned by each membership", "Name of customers who paid money for platinum package", "Name of the customer who were attend in a branch", "Name of customer trains by  some trainer", "Show the capacity of each branch", "Name of trainer who takes class of workout group for this week", "Name of exercise attends by some customer", "Name of the customer who has due"};
		String query[] = {"select w.g_name, s.day, s.start_time, s.end_time, r.room_no, b.b_name from class as c inner join workout_group_list as w on w.g_id = c.workout_group_list_id inner join schedules as s on s.s_id = c.schedule_id inner join room as r on c.room_id = r.room_id inner join branch as b on b.b_id = r.branch_id;", 
				"select m.m_name, sum(amount) from customer_pays_membership as cpm inner join customer_owns_membership as com on cpm.owns_id = com.com_id inner join membership as m on m.m_id = com.membership_id group by (membership_id);", 
				"select c.c_name, m.m_name, cpm.payment_date, cpm.amount from customer_pays_membership as cpm inner join customer_owns_membership as com on cpm.owns_id = com.com_id inner join membership as m on m.m_id = com.membership_id inner join customer as c on c.c_id = com.customer_id where m_name = 'Platinum';", 
				"select b.b_name,cu.c_name, ca.attents_date, c.class_id from branch as b inner join room as r on r.branch_id=b.b_id inner join class as c on c.room_id=r.room_id inner join customer_attends_class as ca on c.class_id=ca.class_id inner join customer as cu on ca.customer_id=cu.c_id;", 
				"select c.c_name,s.s_name from customer as c inner join customer_attends_class as ca on c.c_id=ca.customer_id inner join class as cl on ca.class_id=cl.class_id inner join trainer_trains_class as tc on tc.class_id=cl.class_id inner join trainer as t on tc.t_id=t.t_id inner join staff as s on t.staff_id=s.s_id;", 
				"select b.b_name,sum(r.capacity) from branch as b inner join room as r on r.branch_id=b.b_id group by b_id;", 
				"select st.s_name, w.g_name, s.day from trainer as t inner join trainer_trains_class as ttc on t.staff_id = ttc.t_id inner join class as c on ttc.class_id = c.class_id inner join workout_group_list as w on w.g_id = c.workout_group_list_id inner join staff as st on st.s_id = t.staff_id inner join schedules as s on c.schedule_id = s.s_id;", 
				"select c.c_name,e.exercise_name from customer as c inner join customer_attends_class as ca on c.c_id=ca.customer_id inner join class as cl on ca.class_id=cl.class_id inner join workout_group_list as w on w.g_id=cl.workout_group_list_id inner join exercise as e on w.g_id=e.exercise_id;", 
				"select c.c_name, sum(m_fee), sum(amount), sum(m_fee - amount) from customer_pays_membership as cpm inner join customer_owns_membership as com on com.com_id = cpm.owns_id inner join membership as m on m.m_id = com.membership_id inner join customer as c on c.c_id = com.customer_id group by com.customer_id;"};
		String newColumnNames[][] = {{"Class Name", "Week Day", "Start Time", "End Time", "Room No.", "Branch"}, 
				{"Membership Name", "Total Amount Earned"}, 
				{"Customer Name", "Membership Name", "Payment_Date", "Amount"}, 
				{"Branch Name", "Customer Name", "Attending Date", "Class ID"}, 
				{"Customer Name", "Trainer Name"}, 
				{"Branch Name", "Capacity"}, 
				{"Trainer Name", "Workout Group", "Day"}, 
				{"Customer Name", "Exercise Name"}, 
				{"Customer Name", "Total Fee", "Total Paid", "Due Amount"}};
		comboBox2 = new JComboBox(queryTitle);
		comboBox2.setBounds(215, 42, 200, 20);
		panelStartPage.add(comboBox2);
		comboBox2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ArrayList<ArrayList<String>> r = db.runQuery(query[comboBox2.getSelectedIndex()]);
				Object[][] data = new Object[r.size()][];
				for (int i = 0; i < r.size(); i++) {
				    data[i] = r.get(i).toArray(new String[r.size()]);
				}
				
				table_1 = new JTable(new DefaultTableModel(data, newColumnNames[comboBox2.getSelectedIndex()]));
				scrollPane.setViewportView(table_1);
			}
		});
		
		
		
	}
	
	public int getColumnIndex(String columnName)
	{
	    for (int i = 0; i < cnames.size(); i++)
	    {
	        String s = cnames.get(i);
	        if (columnName.equalsIgnoreCase(s))
	        {
	            return i;
	        }
	    } 
	    return -1;
	}
	
}
