import java.awt.Color;
import java.awt.EventQueue;
import java.awt.event.WindowAdapter;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class Main_Design {

	private JFrame frame;
	private JPanel panelStartSelect;
	private JLabel lblLogIn;
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
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
	 */
	public Main_Design() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("Lets Gym");
		frame.setBounds(0, 0, 1280, 720);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		frame.getContentPane().setLayout(null);
		frame.getContentPane().setBackground(new Color(255, 255, 255));
		/*
		Database_Handler db = new Database_Handler();
		ArrayList<ArrayList<String>> tableData = db.getData("manager");
		
		for(ArrayList<String> i: tableData) {
			for(String j: i) {
				System.out.print(j);
			}
			System.out.println("");
		}*/
		
		panelStartSelect = new JPanel();
		panelStartSelect.setSize(650, 300);
		panelStartSelect.setBackground(new Color(10,255,60,10));
		frame.getContentPane().add(panelStartSelect);
		panelStartSelect.setLayout(null);
		panelStartSelect.setVisible(true);
		panelStartSelect.setLocation(300, 250);
		
		lblLogIn = new VoidLabel("LogIn", 50, Color.DARK_GRAY, new Color(24,130,20));
		lblLogIn.setBounds(30, 156, 200, 200);
		panelStartSelect.add(lblLogIn);
		
		
	}
}
