import java.awt.Color;
import java.awt.Font;
import java.awt.FontFormatException;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.swing.JLabel;


public class VoidLabel extends JLabel{
	public VoidLabel(String text, int fontSize, Color fColor, Color bColor){
		super(text);
		try {
			Font getF = Font.createFont(Font.TRUETYPE_FONT, getClass().getResource("/fon9.otf").openStream());
			Font f = getF.deriveFont(Font.PLAIN, fontSize);
			setFont(f);
        } catch (FontFormatException | IOException e) {
			e.printStackTrace();
		}
		setForeground(fColor);
		setBackground(bColor);
	}
	
}
