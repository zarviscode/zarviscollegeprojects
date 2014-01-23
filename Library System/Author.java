// Author.java
 
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.text.*;

public class Author extends JInternalFrame implements ActionListener 
{
	public static JScrollPane AuthorJSP = new JScrollPane();

	Dimension screen 	= Toolkit.getDefaultToolkit().getScreenSize();

	JPanel 	jpnlMain  	= new JPanel();

	JButton bttnExit   	= new JButton("Cancel");
	JButton bttnInfo   	= new JButton("Short Info.");
				
	JLabel 	lblPicture 	= new JLabel(new ImageIcon("images/developer.gif"));
	JLabel  lblFullname 	= new JLabel("Fullname: Hina Chandio");
	JLabel  lblMunicipal	= new JLabel("Municipality: Tandojam");
	JLabel  lblProvince 	= new JLabel("Province: Sindh");
	JLabel  lblCountry 	= new JLabel("Country: Pakistan");
	JLabel  lblCellNum	= new JLabel("Cellular Phone: ");
	JLabel  lblEmail 	= new JLabel("Email Add: shafi_hina@yahoo.com");
	JLabel  lblWebsite	= new JLabel("Website:");

	JTextArea textArea = new JTextArea(
	    "This is Library Managemnet System \n" +
	    "A system intented for small library only.\n\n" +
	    "CREDITS TO:"+ "\n" + 
	     "MUHAMMAD ADNAN MALIK\n"  +
	    "Sir Sajjad Hussain"  + "\n\n" +
	    "GREETINGS TO ALL AND TO ALL MY FRIENDS." );

	mdlFunctions module_func = new mdlFunctions();

	public Author(JFrame getParentFrame)
	{
		super("About the Author",false,true,false,true);
		
		jpnlMain.setBackground(Color.WHITE);
		jpnlMain.setLayout(null);

		setFrameIcon(new ImageIcon("images/author.gif"));
		setSize(350,400);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setLocation((screen.width - 350)/2,((screen.height-400)/2)-40);
		
		getContentPane().setLayout(new BorderLayout(0,0));
		getContentPane().add(BorderLayout.CENTER, jpnlMain);

		module_func.setJLabel(lblPicture,15,25,100,100);
		module_func.setJLabel(lblFullname,130,5,200,50);
		module_func.setJLabel(lblMunicipal,130,20,200,50);
		module_func.setJLabel(lblProvince,130,35,200,50);
		module_func.setJLabel(lblCountry,130,50,200,50);
		module_func.setJLabel(lblCellNum,130,65,200,50);
		module_func.setJLabel(lblEmail,130,80,200,50);
		module_func.setJLabel(lblWebsite,130,95,200,50);
		
		jpnlMain.add(lblPicture);
		jpnlMain.add(lblFullname);
		jpnlMain.add(lblMunicipal);
		jpnlMain.add(lblProvince);
		jpnlMain.add(lblCountry);
		jpnlMain.add(lblCellNum);
		jpnlMain.add(lblEmail);
		jpnlMain.add(lblWebsite);

		//TextArea
		module_func.setJTextArea(textArea,0,0,320,195);
        		textArea.setEditable(false);
        
		AuthorJSP.getViewport().add(textArea);
		AuthorJSP.setBounds(15,140,320,195);
		jpnlMain.add(AuthorJSP);
        
		module_func.setJButton(bttnExit,230,340,100,24,"exit","Unload Form");
		module_func.setJButton(bttnInfo,130,340,100,24,"info","Short Information");
		bttnExit.setMnemonic(KeyEvent.VK_C);
		bttnInfo.setMnemonic(KeyEvent.VK_S);

		jpnlMain.add(bttnExit);
		jpnlMain.add(bttnInfo);

		bttnInfo.addActionListener(this);
		bttnExit.addActionListener(this);
	}

	public void actionPerformed(ActionEvent event) 
	{
		Object object = event.getSource();
		if(object == bttnInfo){ShortInfo();}
		else
		{		
		setVisible(false);
		dispose();//Unload Form
		}
	}
	
	protected void ShortInfo()
	{
		try {
	    	JOptionPane.showConfirmDialog(this,
			"INFO: If you want to have softwares\n\n1. " +
			"Just contact me at\ncellphone number: 022-2762314\n" +
			"Email Address:  hina_shafi@yahoo.com\n\n"+
			"For more details just visit the ff websites.\n",
			"Library Management System",  	

          	JOptionPane.OK_OPTION,
          	JOptionPane.INFORMATION_MESSAGE);
		
		} catch(Exception e) {}
	}

}
