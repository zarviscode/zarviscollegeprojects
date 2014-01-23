// frmSplash.java

import javax.swing.*;
import java.awt.*;

public class Splash extends JWindow implements Runnable
{
	public void run()
	{
		JLabel SplashLabel = new JLabel(new ImageIcon("images/Splash.jpg"));
		Dimension screen = 	Toolkit.getDefaultToolkit().getScreenSize();
		
		getContentPane().add(SplashLabel,BorderLayout.CENTER);
		
		setSize(490,300);
		setLocation((screen.width - 490)/2,((screen.height-300)/2));
		show();
	}
}