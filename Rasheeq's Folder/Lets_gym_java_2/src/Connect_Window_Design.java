import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JPasswordField;

public class Connect_Window_Design {

	public JFrame frame;
	private JTextField textField;
	private JTextField textField_1;
	private JPasswordField passwordField;

	/**
	 * Create the application.
	 */
	public Connect_Window_Design() {
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
		
		JLabel lblDatabaseName = new JLabel("Database Name");
		lblDatabaseName.setBounds(10, 11, 76, 44);
		frame.getContentPane().add(lblDatabaseName);
		
		textField = new JTextField();
		textField.setBounds(96, 23, 151, 20);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		JLabel lblUserName = new JLabel("User Name");
		lblUserName.setBounds(10, 80, 76, 30);
		frame.getContentPane().add(lblUserName);
		
		JLabel lblNewLabel = new JLabel("Password");
		lblNewLabel.setBounds(10, 151, 76, 30);
		frame.getContentPane().add(lblNewLabel);
		
		textField_1 = new JTextField();
		textField_1.setBounds(96, 85, 151, 20);
		frame.getContentPane().add(textField_1);
		textField_1.setColumns(10);
		
		passwordField = new JPasswordField();
		passwordField.setBounds(96, 156, 151, 20);
		frame.getContentPane().add(passwordField);
	}
}
