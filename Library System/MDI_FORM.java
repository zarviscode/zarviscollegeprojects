// MDI_FORM.java

import java.beans.*;
import java.util.*;
import java.text.*;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import javax.swing.plaf.metal.*;

public class MDI_FORM extends JFrame implements ActionListener,InternalFrameListener
{
	Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
	JDesktopPane desktop = new JDesktopPane();
	JLabel StatusLabel = new JLabel ("Copyright © Asian Technologies 2006. All Rights Reserved.",JLabel.CENTER);
	
	JMenuBar menubar = new JMenuBar();
	
	// Set the Caption of JMenu
	JMenu mnuFile =  new JMenu("File");	
	JMenu mnuRecords =  new JMenu("Records");					
	JMenu mnuTools =  new JMenu("Tools");	
	JMenu mnuWindows =  new JMenu("Windows");					
	JMenu mnuHelp =  new JMenu("Help");		

	// Set JMenuItem	
	JMenuItem relogin = new JMenuItem();
	JMenuItem itmUsers = new JMenuItem();
	JMenuItem itmSwitch = new JMenuItem();	
	JMenuItem itmExit = new JMenuItem();

	JMenuItem itmBarrowers = new JMenuItem();
	JMenuItem itmBarrowed = new JMenuItem();
	JMenuItem itmBooks = new JMenuItem();					
	JMenuItem itmDue = new JMenuItem();
	JMenuItem itmReturned = new JMenuItem();
	JMenuItem itmCategory = new JMenuItem();
	JMenuItem itmFines = new JMenuItem();
	JMenuItem itmYear = new JMenuItem();
	JMenuItem itmCourse = new JMenuItem();						

	JMenuItem itmSections = new JMenuItem();
	JMenuItem itmCalc = new JMenuItem();
	JMenuItem itmNotepad = new JMenuItem();						JMenuItem itmWordpad = new JMenuItem();		
	JMenuItem itmPaint = new JMenuItem();	
		
	JMenuItem itmNormal = new JMenuItem();		
	JMenuItem itmMinimized = new JMenuItem();
	JMenuItem itmMaximized = new JMenuItem();	
	JMenuItem itmCascade = new JMenuItem();
	JMenuItem itmHorizontal = new JMenuItem();
	JMenuItem itmVertical = new JMenuItem();						
	JMenuItem itmArrange = new JMenuItem();

	JMenuItem itmContent = new JMenuItem();
	JMenuItem itmKeys = new JMenuItem();	
	JMenuItem itmAuthor = new JMenuItem();

	String DBDriver	= "sun.jdbc.odbc.JdbcOdbcDriver";
	String DBSource 	= "jdbc:odbc:LibrarySystem";
	String DBUserName = "Admin";
	String DBPassword 	= "libsys";

	Connection conn;
	
	Splash FormSplash= new Splash();
	Thread ThFormSplash = new Thread(FormSplash);

	Author objAuthor;
	Barrowers objBarrowers;
	Barrowed objBarrowed;
	Books objBooks;
	ReturnedBooks objReturnedBooks;
	DueBooks objDueBooks;
	Category objCategory;
	Year objYear;
	Course objCourse;
	Sections objSections;
	Users objUsers;
	Keys objKeys;
	Fines objFines;

	public static void main(String [ ] args)
	{
		JFrame.setDefaultLookAndFeelDecorated(true); 
		JDialog.setDefaultLookAndFeelDecorated(true);
    		MetalTheme myXPStyleTheme = new XPStyleTheme();
	    	MetalLookAndFeel.setCurrentTheme(myXPStyleTheme);
    		try 
	    	{
			UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
    		}
		catch (Exception err) 
	    	{
        			System.out.println("Error loading myXPStyleTheme");			
   		}	
		new MDI_FORM();
	}
	
	public MDI_FORM()
	{
		super("Central Library Management System");
		StatusLabel.setFont(new Font("Dialog", Font.PLAIN, 12));
		
		loadSplashScreen();
		FormSplash.dispose(); 	// Dispose the allocated memory

		desktop.setBackground(Color.GRAY);
		desktop.setBorder(BorderFactory.createLoweredBevelBorder());
		desktop.setDragMode(JDesktopPane.OUTLINE_DRAG_MODE);

		getContentPane().add(CreateJToolBar(),BorderLayout.PAGE_START);
		getContentPane().add(desktop,BorderLayout.CENTER);
		getContentPane().add(StatusLabel,BorderLayout.PAGE_END);
		
		addWindowListener(new WindowAdapter()
		{
      			public void windowClosing(WindowEvent e)
			{
				UnloadWindow();
			}
		});
      
		setJMenuBar(CreateJMenuBar());
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);

		// Menu Icon
		setIconImage(new ImageIcon("images/MDI_ico.gif").getImage());
		setLocation(0,0);
		setSize(screen);
		setResizable(true);
		setVisible(true);
		show();	
		
		try
		{
			Class.forName(DBDriver);
			conn = DriverManager.getConnection(DBSource,DBUserName ,DBPassword);
		}
		catch(ClassNotFoundException e)  
		{
			JOptionPane.showMessageDialog(null,"Unable to load driver.", 
				"Database Connection Error", JOptionPane.ERROR_MESSAGE);
 			System.exit(1);
 		}
 		catch(SQLException e)
 		{
			JOptionPane.showMessageDialog(null,"Unable to connect with database.",
				 "Database Connection Error", JOptionPane.ERROR_MESSAGE);
 			System.exit(1);
 		}		
 		
		try
		{
			loadLogin();
		}
		catch(SQLException sqle) { }
	}
	
	// Create a Menubar
	protected JMenuBar CreateJMenuBar()		
	{
		// -----------------	
		// MENUBAR
		// -----------------
		
		mnuFile.setMnemonic('F');
		mnuRecords.setMnemonic('R');
		mnuTools.setMnemonic('T');
		mnuWindows.setMnemonic('W');
		mnuHelp.setMnemonic('H');
		
		menubar.add(setJMenu(mnuFile));																	//Add JMenuItems
		menubar.add(setJMenu(mnuRecords));	
		menubar.add(setJMenu(mnuTools));	
		menubar.add(setJMenu(mnuWindows));	
		menubar.add(setJMenu(mnuHelp));	
		
		// -----------------	
		// SUBMENU
		// -----------------
		
		// FILES MENU

		// Set shortcuts Keys
		relogin.setAccelerator(KeyStroke.getKeyStroke	
			(KeyEvent.VK_I,ActionEvent.CTRL_MASK));															//Set Key Shortcuts

		itmUsers.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_U,ActionEvent.CTRL_MASK));			

		itmSwitch.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_S,ActionEvent.CTRL_MASK));			

		itmExit.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_X,ActionEvent.CTRL_MASK));			

		// Add JMenuItems			
		mnuFile.add(setJMenuItem(relogin,"Re-Login","images/info.gif"));
		mnuFile.add(setJMenuItem(itmUsers,"Users Records","images/users.gif"));
		mnuFile.addSeparator();		// Create a Separator.
		mnuFile.add(setJMenuItem(itmExit,"Exit Application","images/update.gif"));	

		// Add Action Listeners
		relogin.addActionListener(this);
		itmUsers.addActionListener(this);
		itmExit.addActionListener(this);


		// RECORDS MENU

		// Set shortcuts Keys
		itmBarrowers.setAccelerator(KeyStroke.getKeyStroke	
			(KeyEvent.VK_B,ActionEvent.CTRL_MASK));				

		itmBarrowed.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_A,ActionEvent.CTRL_MASK));		
	
		itmBooks.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_O,ActionEvent.CTRL_MASK));			

		itmDue.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_D,ActionEvent.CTRL_MASK));			

		itmReturned.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_R,ActionEvent.CTRL_MASK));			

		itmCategory.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_C,ActionEvent.CTRL_MASK));													
		itmFines.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F,ActionEvent.CTRL_MASK));			
		itmYear.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_Y,ActionEvent.CTRL_MASK));			
		itmCourse.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_U,ActionEvent.CTRL_MASK));			

		itmSections.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_S,ActionEvent.CTRL_MASK));			

		// Add JMenuItems								mnuRecords.add(setJMenuItem(itmBarrowers,"Barrowers","images/Barrowers.gif"));
		mnuRecords.add(setJMenuItem(itmBarrowed,"Barrowed Books","images/barrowed.gif"));
		mnuRecords.add(setJMenuItem(itmBooks,"Books","images/Books.gif"));	
		mnuRecords.add(setJMenuItem(itmDue,"Due Books","images/due books.gif"));
		mnuRecords.add(setJMenuItem(itmReturned,"Returned Books","images/return.gif"));

		mnuRecords.addSeparator();			//Create a Separator

		mnuRecords.add(setJMenuItem(itmCategory,"Category","images/settings.gif"));
		mnuRecords.add(setJMenuItem(itmFines,"Fines","images/fines.gif"));
		mnuRecords.add(setJMenuItem(itmYear,"Year","images/year-icon.gif"));
		mnuRecords.add(setJMenuItem(itmCourse,"Course","images/course.gif"));	
		mnuRecords.add(setJMenuItem(itmSections,"Sections","images/sections.gif"));	

		// Add Action Listeners
		itmBarrowers.addActionListener(this);
		itmBarrowed.addActionListener(this);
		itmBooks.addActionListener(this);
		itmDue.addActionListener(this);
		itmReturned.addActionListener(this);
		itmCategory.addActionListener(this);			
		itmFines.addActionListener(this);			
		itmYear.addActionListener(this);
		itmCourse.addActionListener(this);
		itmSections.addActionListener(this);			

		// TOOLS MENU

		// Set shortcuts Keys
		itmCalc.setAccelerator(KeyStroke.getKeyStroke	
			(KeyEvent.VK_F1,ActionEvent.ALT_MASK));
				
		itmNotepad.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F2,ActionEvent.ALT_MASK));

		itmWordpad.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F3,ActionEvent.ALT_MASK));

		itmPaint.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F4,ActionEvent.ALT_MASK));
		
		// Add JMenuItems
		mnuTools.add(setJMenuItem(itmCalc,"Calculator","images/calc.gif"));		
		mnuTools.add(setJMenuItem(itmNotepad,"Notepad","images/notepad.gif"));	
		mnuTools.add(setJMenuItem(itmWordpad,"Wordpad","images/wordpad.gif"));	
		mnuTools.add(setJMenuItem(itmPaint,"MS Paint","images/mspaint.gif"));		
		
		// Add Action Listeners
		itmCalc.addActionListener(this);
		itmNotepad.addActionListener(this);
		itmWordpad.addActionListener(this);
		itmPaint.addActionListener(this);

		// WINDOWS MENU
			
		// Set shortcuts Keys
		itmNormal.setAccelerator(KeyStroke.getKeyStroke	
			(KeyEvent.VK_F5,ActionEvent.ALT_MASK));
		
		itmMinimized.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F6,ActionEvent.ALT_MASK));
	
		itmMaximized.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F7,ActionEvent.ALT_MASK));

		itmCascade.setAccelerator(KeyStroke.getKeyStroke	
			(KeyEvent.VK_F8,ActionEvent.ALT_MASK));

		itmHorizontal.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F9,ActionEvent.ALT_MASK));

		itmVertical.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F10,ActionEvent.ALT_MASK));

		itmArrange.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_F11,ActionEvent.ALT_MASK));

		// Add JMenuItems
		mnuWindows.add(setJMenuItem(itmNormal,"Normal","images/content.gif"));			mnuWindows.add(setJMenuItem(itmMinimized,"Minimized","images/content.gif"));				
		mnuWindows.add(setJMenuItem(itmMaximized,"Maximized","images/content.gif"));				

		mnuWindows.addSeparator();		//Create a Separator

		mnuWindows.add(setJMenuItem(itmCascade,"Cascade","images/content.gif"));		
		mnuWindows.add(setJMenuItem(itmHorizontal,"Tile Horizontally","images/content.gif"));			
		mnuWindows.add(setJMenuItem(itmVertical,"Tile Vertically","images/content.gif"));		
		mnuWindows.add(setJMenuItem(itmArrange,"Arrange Icon","images/content.gif"));		
			
		// Add Action Listeners
		itmNormal.addActionListener(this);
		itmMinimized.addActionListener(this);
		itmMaximized.addActionListener(this);

		// HELP MENU

		// Set shortcuts Keys
		itmContent.setAccelerator(KeyStroke.getKeyStroke	
			(KeyEvent.VK_C,ActionEvent.ALT_MASK));

		itmKeys.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_K,ActionEvent.ALT_MASK));

		itmAuthor.setAccelerator(KeyStroke.getKeyStroke
			(KeyEvent.VK_A,ActionEvent.ALT_MASK));

		// Add JMenuItems		
		mnuHelp.add(setJMenuItem(itmContent,"Content...","images/Help.gif"));		
		mnuHelp.add(setJMenuItem(itmKeys,"Key Shortcuts","images/ktouch.gif"));	
		mnuHelp.add(setJMenuItem(itmAuthor,"Author","images/author.gif"));		

		// Add Action Listeners	
		itmContent.addActionListener(this);
		itmKeys.addActionListener(this);
		itmAuthor.addActionListener(this);
			
		//Set the Background of JMenuBar. 
		menubar.setBackground(new Color(255,255,255));
		return menubar;
	}

	protected JMenu setJMenu(JMenu menu)
	{
		//Set the Font of JMenu
		menu.setFont(new Font("Dialog", Font.BOLD, 12)); 			
		
		//Set the Background of JMenu
		menu.setBackground(new Color(255,255,255));						 
		return menu;
	}	
	
	// Create a Menu
	protected JMenuItem setJMenuItem(JMenuItem mnuitem, String sCaption, String imgLocation)
	{
		// Set the Caption of JMenuItem		
		mnuitem.setText(sCaption);

		mnuitem.setIcon(new ImageIcon(imgLocation));
		mnuitem.setFont(new Font("Dialog", Font.PLAIN, 12));  
		mnuitem.setBackground(new Color(255,255,255));
		return mnuitem;
	}
	
	//Creat a Toolbar
	protected JToolBar CreateJToolBar()		
	{
		JToolBar toolbar = new JToolBar("Toolbar");
		
		toolbar.setMargin(new Insets(0,0,0,0));
		
		// Create Toolbar Icon
		toolbar.add(CreateJToolbarButton("Barrowers Records",
			"images/Barrowers.gif","tlBarrowers"));

		toolbar.add(CreateJToolbarButton("Barrowed Records",
			"images/barrowed.gif","tlBarrowed"));

		toolbar.add(CreateJToolbarButton("Books Records",
			"images/Books.gif","tlBooks"));

		toolbar.add(CreateJToolbarButton("Due Books Records",
			"images/due books.gif","tlDueBooks"));

		toolbar.add(CreateJToolbarButton("Returned Books",
			"images/return.gif","tlReturned"));

		toolbar.addSeparator();

		toolbar.add(CreateJToolbarButton("Category",
			"images/settings.gif","tlCategory"));
	
		toolbar.add(CreateJToolbarButton("Fines",
			"images/fines.gif","tlFines"));
	
		toolbar.add(CreateJToolbarButton("Year",
			"images/year-icon.gif","tlYear"));
	
		toolbar.add(CreateJToolbarButton("Course",
			"images/course.gif","tlCourse"));
	
		toolbar.add(CreateJToolbarButton("Sections",
			"images/sections.gif","tlSections"));
	
		toolbar.addSeparator();
	
		toolbar.add(CreateJToolbarButton("Content...",
			"images/Help.gif","tlContents"));

		toolbar.add(CreateJToolbarButton("Key Shortcuts",
			"images/ktouch.gif","tlKeys"));
	
		toolbar.add(CreateJToolbarButton("Author",
			"images/author.gif","tlAuthor"));
	
		//Set the Background of JMenuBar
		toolbar.setBackground(new Color(255,255,255));
	
		return toolbar;		
	}
	
	protected JButton CreateJToolbarButton(String srcToolTipText,String srcImageLocation,String srcActionCommand)
	{
		JButton NewJButton = new JButton(new ImageIcon(srcImageLocation));
		
		NewJButton.setActionCommand(srcActionCommand);
		NewJButton.setToolTipText(srcToolTipText);
		NewJButton.setBackground(new Color(255,255,255));			//Set the Background of JMenuBar. 
		NewJButton.addActionListener(JToolBarActionListener);
		return NewJButton;
	}
		
	ActionListener JToolBarActionListener = new ActionListener()
	{
		public void actionPerformed(ActionEvent e)	
		{
			String srcObject = e.getActionCommand();

			if(srcObject=="tlBarrowers")
			{
				try{loadBarrowers();}
				catch(SQLException sqle){}
			}

			else if(srcObject=="tlBarrowed")
			{
				try 	
				{ 
					loadBarrowed();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlBooks")
			{
				try
				{
					loadBooks();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlReturned")
			{
				try
				{
					loadReturnedBook();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlDueBooks")
			{
				try
				{
					loadDueBooks();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlCategory")
			{
				try 
				{
					loadCategory();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlYear")
			{
				try
				{
					loadYear();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlCourse")
			{
				try
				{
					loadCourse();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlSections")
			{
				try
				{
					loadSections();
				}
				catch(SQLException sqle) { }
			}

			else if(srcObject=="tlFines")
			{
				try
				{
					loadFines();
				}
				catch(SQLException sqle) { }
			}		

			else if(srcObject=="tlContents")
			{
				loadContent();
			}
			
			else if(srcObject=="tlKeys")
			{
				loadKeys();
			}

			else if(srcObject=="tlAuthor")
			{
				loadAuthor();
			}
		}
	};

	// Load Content
	protected void loadContent()
	{
		try 
		{
		    	JOptionPane.showConfirmDialog(this,
				"LIBRARY HELLO TO ALL JAVA PROGRAMMERS\n\n" +
				"This is my first programming in JAVA [JDBC]\n"+
				"Please send your comments and suggestions to\n\n"+
				"sabbasi_11@yahoo.com",
				"Library Management System",  	
			          	JOptionPane.OK_OPTION,
			          	JOptionPane.INFORMATION_MESSAGE);
		} 
		catch(Exception e) { }
	}

	// Load Splash Screen
	protected void loadSplashScreen()
	{
		// Start the thread
		ThFormSplash.start();
		while(!FormSplash.isShowing())
		{
			try
			{
				//Display the FormSplash for 10 seconds i.e. 100000
				Thread.sleep(10000);
			}
			catch(InterruptedException e) { }
		}
	}
	
	// Load Barrowers Records
	protected void loadBarrowers() throws SQLException
	{			
		boolean load_barrowers = isLoaded("Barrowers Records");
		if(load_barrowers == false)
		{
			objBarrowers = new Barrowers(conn,this); 
			desktop.add(objBarrowers);
			
			objBarrowers.setVisible(true);	
			objBarrowers.show();			
		}
		else
		{
			try
			{
				objBarrowers.setIcon(false);
				objBarrowers.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	protected void loadLogin() throws SQLException
	{
 		JDialog JDLogin = new Login(this);
		JDLogin.show();
	}
	
	protected void loadBarrowed() throws SQLException
	{
		boolean load_barrowed = isLoaded("Barrowed Books");
		if(load_barrowed == false)
		{
			objBarrowed = new Barrowed(conn,this); 
			desktop.add(objBarrowed);
			
			objBarrowed.setVisible(true);
			objBarrowed.show();
		}
		else
		{
			try
			{
				objBarrowed.setIcon(false);
				objBarrowed.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	protected void loadFines() throws SQLException
	{
		boolean load_fines = isLoaded("Fines");
		if(load_fines == false)
		{
			objFines = new Fines(conn,this); 
			desktop.add(objFines);			
			objFines.setVisible(true);
			objFines.show();
		}
		else
		{
			try
			{
				objFines.setIcon(false);
				objFines.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	// Load Returned Books	
	protected void loadReturnedBook() throws SQLException
	{
		boolean load_returnedbooks = isLoaded("Returned Books");
		if(load_returnedbooks == false)
		{
			objReturnedBooks = new ReturnedBooks(conn,this); 
			desktop.add(objReturnedBooks);			
			objReturnedBooks.setVisible(true);
			objReturnedBooks.show();
		}
		else
		{
			try
			{
				objReturnedBooks.setIcon(false);
				objReturnedBooks.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	} 

	// Load Due Books	
	protected void loadDueBooks() throws SQLException
	{
		boolean load_duebooks = isLoaded("Due Books");
		if(load_duebooks == false)
		{
			objDueBooks = new DueBooks(conn,this); 
			desktop.add(objDueBooks);			
			objDueBooks.setVisible(true);
			objDueBooks.show();
		}
		else
		{
			try
			{
				objDueBooks.setIcon(false);
				objDueBooks.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	protected void loadYear() throws SQLException
	{
		boolean load_year = isLoaded("Year");
		if(load_year == false)
		{
			objYear = new Year(conn, this); 
			desktop.add(objYear);			
			objYear.setVisible(true);
			objYear.show();
		}
		else
		{
			try
			{
				objYear.setIcon(false);
				objYear.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	protected void loadCategory() throws SQLException
	{
		boolean load_category = isLoaded("Category Records");
		if(load_category == false)
		{
			objCategory = new Category(conn, this); 
			desktop.add(objCategory);			
			objCategory.setVisible(true);
			objCategory.show();
		}
		else
		{
			try
			{
				objCategory.setIcon(false);
				objCategory.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	protected void loadCourse() throws SQLException
	{
		boolean load_course = isLoaded("Course");
		if(load_course == false)
		{
			objCourse = new Course(conn, this); 
			desktop.add(objCourse);			
			objCourse.setVisible(true);
			objCourse.show();
		}
		else
		{
			try
			{
				objCourse.setIcon(false);
				objCourse.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	protected void loadSections() throws SQLException
	{
		boolean load_sections = isLoaded("Sections");
		if(load_sections == false)
		{
			objSections = new Sections(conn, this); 
			desktop.add(objSections);			
			objSections.setVisible(true);
			objSections.show();
		}
		else
		{
			try
			{
				objSections.setIcon(false);
				objSections.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	// Load Books Records	
	protected void loadBooks() throws SQLException
	{
		boolean load_books = isLoaded("Books Records");
		if(load_books == false)
		{
			objBooks = new Books(conn, this); 
			desktop.add(objBooks);			
			objBooks.setVisible(true);
			objBooks.show();
		}
		else
		{
			try
			{
				objBarrowers.setIcon(false);
				objBarrowers.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	// Load the Author Form
	protected void loadAuthor()
	{
		boolean load_author = isLoaded("About the Author");
		if(load_author == false)
		{
			objAuthor = new Author(this); 
			desktop.add(objAuthor);
			
			objAuthor.setVisible(true);
			objAuthor.show();
		}
		else
		{
			try
			{
				objAuthor.setIcon(false);
				objAuthor.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	// Load Key Shortcuts
	protected void loadKeys()
	{
		boolean load_keys = isLoaded("Key Shortcuts");
		if(load_keys == false)
		{
			objKeys = new Keys(this); 
			desktop.add(objKeys);
			
			objKeys.setVisible(true);
			objKeys.show();
		}
		else
		{
			try
			{
				objKeys.setIcon(false);
				objKeys.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	// Load Users
	protected void loadUsers() throws SQLException
	{
		boolean load_users = isLoaded("Users");
		if(load_users == false)
		{
			objUsers = new Users(conn, this); 
			desktop.add(objUsers);			
			objUsers.setVisible(true);
			objUsers.show();
		}
		else
		{
			try
			{
				objUsers.setIcon(false);
				objUsers.setSelected(true);
			}
			catch(PropertyVetoException e) { }
		}
	}
	
	private void menubar_actionPerformed(ActionEvent event, int intWhich) 
	{
		switch(intWhich) 
		{
			case 0:		
				UnloadWindow();
				break;
			case 1:	
				try{loadUsers();}
				catch(SQLException sqle){}
				break;
			case 2:	
				loadContent();
				break;
			case 3:	
				try{loadBarrowers();}
				catch(SQLException sqle){}
				break;
			case 4:
				try{loadBarrowed();}
				catch(SQLException sqle){}
				break;
			case 5:
				try{loadBooks();}
				catch(SQLException sqle){}
				break;
			case 6:
				try{loadCategory();}
				catch(SQLException sqle){}
				break;
			case 7:
				try{loadReturnedBook();}
				catch(SQLException sqle){}
				break;
			case 8:
				try{loadDueBooks();}
				catch(SQLException sqle){}
				break;
			case 9:
				try{loadCourse();}
				catch(SQLException sqle){}
				break;
			case 10:
				try{loadSections();}
				catch(SQLException sqle){}
				break;
			case 11:
				try{loadYear();}
				catch(SQLException sqle){}
				break;
			case 12:
				try{loadYear();}
				catch(SQLException sqle){}
				break;
			case 13:
				loadAuthor();		
				break;
			case 14:
				loadKeys();		
				break;
				
		}
	}

	public void actionPerformed(ActionEvent event) 
	{
		Object object = event.getSource();
		if(object == itmAuthor){menubar_actionPerformed(event,13);}
		else if(object == itmUsers){menubar_actionPerformed(event,1);}
		else if(object == itmContent){menubar_actionPerformed(event,2);}
		else if(object == itmBarrowers){menubar_actionPerformed(event,3);}
		else if(object == itmBarrowed){menubar_actionPerformed(event,4);}
		else if(object == itmBooks){menubar_actionPerformed(event,5);}
		else if(object == itmCategory){menubar_actionPerformed(event,6);}
		else if(object == itmReturned){menubar_actionPerformed(event,7);}
		else if(object == itmDue){menubar_actionPerformed(event,8);}
		else if(object == itmCourse){menubar_actionPerformed(event,9);}
		else if(object == itmSections){menubar_actionPerformed(event,10);}
		else if(object == itmYear){menubar_actionPerformed(event,11);}
		else if(object == itmFines){menubar_actionPerformed(event,12);}
		else if(object == itmKeys){menubar_actionPerformed(event,14);}
		else if(object == itmExit){menubar_actionPerformed(event,0);}
	}
	
	protected boolean isLoaded(String FormTitle) {

		JInternalFrame Form[] = desktop.getAllFrames();
		for (int i = 0; i < Form.length; i++) {
			if (Form[i].getTitle().equalsIgnoreCase (FormTitle)) {
				Form[i].show ();
				try{
					Form[i].setIcon(false);
					Form[i].setSelected(true);
				}catch(PropertyVetoException e){
				}			
				return true;
			}
		}
		return false;
	}
	
	protected void UnloadWindow()
	{
		try 
		{
	    	int reply = JOptionPane.showConfirmDialog(this,
	    	                                          "Are you sure you want to exit?",
	    	                                          "Confirm Exit" ,
	    	                                          JOptionPane.YES_NO_OPTION,
	    	                                          JOptionPane.WARNING_MESSAGE);
			// If the confirmation was affirmative, handle exiting.
			if (reply == JOptionPane.YES_OPTION) 
			{
				conn.close();
			    	setVisible(false); 	// hide the Frame
			    	dispose();         	// free the system resources
			    	System.exit(0);    	// close the application
			}
		}
		catch(Exception e) { }
	}
      
	public void internalFrameClosing(InternalFrameEvent e){UnloadWindow();}
	public void internalFrameClosed(InternalFrameEvent e){}
	public void internalFrameOpened(InternalFrameEvent e){}
	public void internalFrameIconified(InternalFrameEvent e){}
	public void internalFrameDeiconified(InternalFrameEvent e){}
	public void internalFrameActivated(InternalFrameEvent e){}
	public void internalFrameDeactivated(InternalFrameEvent e){}
	
}