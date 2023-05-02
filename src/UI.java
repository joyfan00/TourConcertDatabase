import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.Date;
import java.util.Locale;
import java.math.BigDecimal;

public class UI {
    String connectionUrl ="jdbc:sqlserver://localhost;"
    + "database=tours;"
    + "user=neha;"
    + "password=tourconcert;"
    + "encrypt=true;"
    + "trustServerCertificate=true;"
    + "loginTimeout=15;";

    // CUSTOMER OR ORGANIZER PAGE
    public void customerOrOrganizer () {
        //setting up the frame and the buttonss
        JFrame frame = new JFrame("Customer or Organizer");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JButton customer = new JButton("Customer");
        customer.setFont(new Font("Calibri", Font.PLAIN, 30));
        customer.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                goToCustomerHome();
            }
        });
        JButton organizer = new JButton("Event Organizer");
        organizer.setFont(new Font("Calibri", Font.PLAIN, 30));
        organizer.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                goToOrganizerHome();
            }
        });

        // add buttons to frame
        frame.add(customer);
        frame.add(organizer);
        // layout
        frame.setLayout(new GridLayout(2, 1));
        // frame last touches
        frame.setSize(500, 500);
        frame.setVisible(true);
    }
    // CUSTOMER HOME PAGE
    public void goToCustomerHome () {
        // Setting Home Screen
        JFrame home = new JFrame("Customer Home Screen");
        home.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        home.setSize(1000,1000);
        // Buttons to indicate which action the user would like to do on the database
        JButton new_existing_user = new JButton("New or Existing User Information");
        new_existing_user.setFont(new Font("Calibri", Font.PLAIN, 40));
        new_existing_user.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                new_or_existing_user();
            }
        });
        JButton songinfo = new JButton("Find My Setlist");
        songinfo.setFont(new Font("Calibri", Font.PLAIN, 40));
        songinfo.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputConcertInfo();
            }
        });
        JButton artist_concerts_info = new JButton("Artists Touring Near Me");
        artist_concerts_info.setFont(new Font("Calibri", Font.PLAIN, 40));
        artist_concerts_info.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputDateRangeAndCity();
            }
        });
        JButton purchase_merch = new JButton("Purchase Merchandise");
        purchase_merch.setFont(new Font("Calibri", Font.PLAIN, 40));
        purchase_merch.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputUserandConcertInfoMerch();
            }
        });
        JButton purchase_tickets = new JButton("Purchase Tickets");
        purchase_tickets.setFont(new Font("Calibri", Font.PLAIN, 40));
        purchase_tickets.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputUserandConcertInfoTickets();
            }
        });
        JButton customer_organizer = new JButton("Back to Customer/Organizer Screen");
        customer_organizer.setFont(new Font("Calibri", Font.PLAIN, 40));
        customer_organizer.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                customerOrOrganizer();
            }
        });

        // Add buttons to home screen
        home.add(new_existing_user);
        home.add(songinfo);
        home.add(artist_concerts_info);
        home.add(purchase_merch);
        home.add(purchase_tickets);
        home.add(customer_organizer);
        // setting layout
        home.setLayout(new GridLayout(6, 1));
        // Make home screen visible
        home.setVisible(true);
    }

    // QUERY #1:NEW OR EXISTING USER ACCESSING INFORMATION
    // CHOOSING NEW OR EXISTING USER
    public void new_or_existing_user () {
        //frame and buttons
        JFrame user = new JFrame("New or Existing User");
        JButton new_user = new JButton("New User");
        new_user.setFont(new Font("Calibri", Font.PLAIN, 40));
        new_user.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                user.dispose();
                new_user_info();
            }
        });
        JButton existing_user = new JButton("Existing User");
        existing_user.setFont(new Font("Calibri", Font.PLAIN, 40));
        existing_user.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                user.dispose();
                existing_user_info();
            }
        });

        // add buttons to frame
        user.add(new_user);
        user.add(existing_user);
        // set layout
        user.setLayout(new GridLayout(2, 1));
        // frame last touches
        user.setSize(500, 500);
        user.setVisible(true);

    }

    // NEW USER INFORMATION
    public void new_user_info () {
        // frame and buttons
        JFrame new_user = new JFrame("New User Information");
        JPanel labels_texts = new JPanel();
        JPanel buttons = new JPanel();
        JLabel name = new JLabel("Name: ");
        name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField name_input = new JTextField();
        name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new_user.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String name_text = name_input.getText().trim();
                new_user.dispose();
                new_user_query(name_text);
            }
        });

        // set layout of panels
        labels_texts.setLayout(new BoxLayout(labels_texts, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new FlowLayout());

        // add buttons to panels to add panels to frame
        labels_texts.add(name);
        labels_texts.add(name_input);
        buttons.add(back_home);
        buttons.add(submit);
        new_user.add(labels_texts, BorderLayout.PAGE_START);
        new_user.add(buttons, BorderLayout.PAGE_END);
        // frame last touches
        new_user.setSize(500, 500);
        new_user.setVisible(true);
    }

    public void new_user_query(String name) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement findSongs = connection.prepareCall("{call add_NewUser(?)}");
            findSongs.setString(1, name);
            int rowsAffected = findSongs.executeUpdate();
            if (rowsAffected > 0) {
                confirmationCustomer();
            }
            else {
                usernameInvalid();
            }
        }
        catch (SQLException s) {
            usernameInvalid();
            s.printStackTrace();
        } 
    }

    public void confirmationCustomer () {
        JFrame confirmation = new JFrame("Action Confirmation");
        JPanel labels = new JPanel();
        JPanel buttons = new JPanel();
        JLabel complete = new JLabel("Your action has been complete!");
        complete.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                confirmation.dispose();
                goToCustomerHome();
            }
        });
        labels.setLayout(new BoxLayout(labels, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new FlowLayout());
        labels.add(complete);
        buttons.add(back_to_home);
        confirmation.add(labels, BorderLayout.PAGE_START);
        confirmation.add(buttons, BorderLayout.PAGE_END);
        confirmation.setSize(500, 300);
        confirmation.setVisible(true);
    }

    public void usernameInvalid () {
        JFrame invalid_info = new JFrame("Invalid Information");
        JPanel labels = new JPanel();
        JPanel buttons = new JPanel();
        JLabel invalid = new JLabel("Username already taken. Try again.");
        invalid.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                invalid_info.dispose();
                goToCustomerHome();
            }
        });
        labels.setLayout(new BoxLayout(labels, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new FlowLayout());
        labels.add(invalid);
        buttons.add(back_to_home);
        invalid_info.add(labels, BorderLayout.PAGE_START);
        invalid_info.add(buttons, BorderLayout.PAGE_END);
        invalid_info.setSize(300, 300);
        invalid_info.setVisible(true);
    }

    // EXISTING USER INFORMATION
    public void existing_user_info () {
        JFrame existing_user = new JFrame("Existing User Info");
        JPanel labels_and_text = new JPanel();
        JPanel buttons = new JPanel();
        JLabel user_id = new JLabel("Username: ");
        JTextField user_id_input = new JTextField();
        user_id.setFont(new Font("Calibri", Font.PLAIN, 30));
        user_id_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                existing_user.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String user_input_text = user_id_input.getText().trim();
                existing_user.dispose();
                existing_user_query(user_input_text);
            }
        });

        labels_and_text.setLayout(new BoxLayout(labels_and_text, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new GridLayout());
        labels_and_text.add(user_id);
        labels_and_text.add(user_id_input);
        buttons.add(back_home);
        buttons.add(submit);
        existing_user.add(labels_and_text, BorderLayout.PAGE_START);
        existing_user.add(buttons, BorderLayout.PAGE_END);
        existing_user.setSize(500, 500);
        existing_user.setVisible(true);

    }

    public void existing_user_query(String user_input) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement existingUser = connection.prepareCall("{call checkUsers(?)}");
            existingUser.setString(1, user_input);
            ResultSet resultSet = existingUser.executeQuery();
            existing_user_info(resultSet);
        }
        catch (SQLException s) {

            s.printStackTrace();
        } 
    }

    public void existing_user_info(ResultSet resultSet) {
        StringBuilder b = new StringBuilder();
        try {
            while (resultSet.next()) {
                b.append("<html>Username: " + resultSet.getString(1) + "<br>Balance: " + resultSet.getString(2) + "<br>Number of Merch Purchased: " + resultSet.getString(3) + "<br>Number of Tickets Purchased: " + resultSet.getString(4) + "</html>");
            }
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        JFrame frame = new JFrame("Existing User Information");
        JPanel label = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel songs = new JLabel();
        songs.setText(b.toString());
        songs.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                goToCustomerHome();
            }
        });
        label.setLayout(new BoxLayout(label, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new GridLayout());
        label.add(songs);
        buttons_field.add(back_home);
        frame.add(label, BorderLayout.PAGE_START);
        frame.add(buttons_field, BorderLayout.PAGE_END);
        frame.setSize(1000, 500);
        frame.setVisible(true);
    }

    public void nonexistentUser () {
        JFrame invalid_info = new JFrame("Invalid Information");
        JPanel labels = new JPanel();
        JPanel buttons = new JPanel();
        JLabel invalid = new JLabel("Username does not exist. Try again.");
        invalid.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                invalid_info.dispose();
                goToCustomerHome();
            }
        });
        labels.setLayout(new BoxLayout(labels, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new GridLayout());
        labels.add(invalid);
        buttons.add(back_to_home);
        invalid_info.add(labels, BorderLayout.PAGE_START);
        invalid_info.add(buttons, BorderLayout.PAGE_END);
        invalid_info.setSize(500, 300);
        invalid_info.setVisible(true);
    }

    // QUERY #2: FIND MY SONGS
    public void inputConcertInfo () {
        // set up objects (JFrame, buttons, panels, textfields)
        JFrame concertinfo = new JFrame("Concert Info");
        JPanel concert_artist_info = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel tour_name = new JLabel("Tour name: ");
        tour_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField tour_name_input = new JTextField();
        tour_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel date = new JLabel("Date (in yyyy-mm-dd format):");
        date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField date_input = new JTextField();
        date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                concertinfo.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Concert Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String tour_name = tour_name_input.getText().trim();
                String date_text = date_input.getText().trim();
                concertinfo.dispose();
                findSongsQuery(tour_name, date_text);
            }
        });

        concert_artist_info.setLayout(new BoxLayout(concert_artist_info, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new FlowLayout());

        concert_artist_info.add(tour_name);
        concert_artist_info.add(tour_name_input);
        concert_artist_info.add(date);
        concert_artist_info.add(date_input);
        buttons_field.add(back_to_home);
        buttons_field.add(submit);
        concertinfo.add(concert_artist_info, BorderLayout.PAGE_START);
        concertinfo.add(buttons_field, BorderLayout.PAGE_END);
        concertinfo.setSize(800, 500);
        concertinfo.setVisible(true);
    }

    //RUN FIND SONGS STORED PROCEDURE
    public void findSongsQuery(String tour_name, String date_string) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement findSongs = connection.prepareCall("{call find_setlist2(?, ?)}");
            findSongs.setString(1, tour_name);
            Date date = Date.valueOf(date_string);
            findSongs.setDate(2, date);
            ResultSet resultSet = findSongs.executeQuery();
            printSongs(resultSet);
        }
        catch (SQLException s) {
            s.printStackTrace();
        } 
        

    }

    public void printSongs (ResultSet resultSet) {
        StringBuilder b = new StringBuilder();
        String lineSeparator = System.lineSeparator();
        try {
            b.append("<html>");
            while (resultSet.next()) {
                b.append("Song Name: " + resultSet.getString(1) + "<br>Artist name: "+ resultSet.getString(2) + "<br>Album name: " + resultSet.getString(3) + "</html>");
            }
            b.append("</html>");
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        JFrame frame = new JFrame("SetList");
        JPanel label = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel songs = new JLabel(b.toString());
        songs.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                goToCustomerHome();
            }
        });
        label.setLayout(new BoxLayout(label, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new GridLayout());
        label.add(songs);
        buttons_field.add(back_home);
        frame.add(label, BorderLayout.PAGE_START);
        frame.add(buttons_field, BorderLayout.PAGE_END);
        frame.setSize(1000, 500);
        frame.setVisible(true);
    }

    // QUERY #3: ARTISTS TOURING NEAR ME
    public void inputDateRangeAndCity() {
        // initialization of JFrames, buttons, panels, and defining characteristics regarding smaller attributes
        JFrame concertinfo = new JFrame("Concert Info");
        JPanel date_city_info = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel start_date = new JLabel("Start Date (in yyyy-mm-dd format): ");
        start_date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField start_date_input = new JTextField();
        start_date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel end_date = new JLabel("End Date (in yyyy-mm-dd format): ");
        end_date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField end_date_input = new JTextField();
        end_date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel city = new JLabel("City: ");
        city.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField city_input = new JTextField();
        city_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel state = new JLabel("State: ");
        state.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField state_input = new JTextField();
        state_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        // add action to home button
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                concertinfo.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String start_date_text = start_date_input.getText().trim();
                String end_date_text = end_date_input.getText().trim();
                String city_name = city_input.getText().trim();
                String state_name = state_input.getText().trim();
                concertinfo.dispose();
                find_artist_query(start_date_text, end_date_text, city_name, state_name);
            }
        });

        date_city_info.setLayout(new BoxLayout(date_city_info, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new FlowLayout());

        date_city_info.add(start_date);
        date_city_info.add(start_date_input);
        date_city_info.add(end_date);
        date_city_info.add(end_date_input);
        date_city_info.add(city);
        date_city_info.add(city_input);
        date_city_info.add(state);
        date_city_info.add(state_input);
        buttons_field.add(back_to_home);
        buttons_field.add(submit);
        concertinfo.add(date_city_info, BorderLayout.PAGE_START);
        concertinfo.add(buttons_field, BorderLayout.PAGE_END);
        concertinfo.setSize(800, 500);
        concertinfo.setVisible(true);
    }

    public void find_artist_query (String start_date, String end_date, String city, String state) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement findArtists = connection.prepareCall("{call find_artist(?, ?, ?, ?)}");
            Date start_date_date = Date.valueOf(start_date);
            findArtists.setDate(1, start_date_date);
            Date end_date_date = Date.valueOf(end_date);
            findArtists.setDate(2, end_date_date);
            findArtists.setString(3, city);
            findArtists.setString(4, state);
            ResultSet resultSet = findArtists.executeQuery();
            printArtistTourDate(resultSet);
        }
        catch (SQLException s) {
            s.printStackTrace();
        } 
    }

    public void printArtistTourDate (ResultSet resultSet) {
        StringBuilder b = new StringBuilder();
        try {
            b.append("<html>");
            while (resultSet.next()) {
                b.append("<br>Artist Name: " + resultSet.getString(1) + "<br>Tour name: " + resultSet.getString(2) + "<br>Date: " + resultSet.getString(3));
            }
            b.append("</html>");
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        JFrame frame = new JFrame("Artists, Tours, & Dates");
        JPanel label = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel songs = new JLabel(b.toString());
        songs.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                goToCustomerHome();
            }
        });
        label.setLayout(new BoxLayout(label, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new GridLayout());
        label.add(songs);
        buttons_field.add(back_home);
        frame.add(label, BorderLayout.PAGE_START);
        frame.add(buttons_field, BorderLayout.PAGE_END);
        frame.setSize(1000, 500);
        frame.setVisible(true);
    }


    // QUERY #4: PURCHASE MERCHANDISE
    public void inputUserandConcertInfoMerch() {
        // define objects (JFrame, panels, buttons, labels, textfields)
        JFrame user_concert_info = new JFrame("User, Concert, and Merch Information");
        JPanel label_and_text = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel user_id = new JLabel("User Name:");
        user_id.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField user_id_input = new JTextField();
        user_id_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel tour_name = new JLabel("Tour name:");
        tour_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField tour_name_input = new JTextField();
        tour_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel date = new JLabel("Concert Date (in yyyy-mm-dd format):");
        date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField date_input = new JTextField();
        date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel merchandise_item = new JLabel("Merchandise Item:");
        merchandise_item.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField merchandise_item_input = new JTextField();
        merchandise_item_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel quantity = new JLabel("Quantity:");
        quantity.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField quantity_input = new JTextField();
        quantity_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                user_concert_info.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String user_name = user_id_input.getText().trim();
                String tour_name = tour_name_input.getText().trim();
                String date = date_input.getText().trim();
                String merchandise_item = merchandise_item_input.getText().trim();
                String quantity = quantity_input.getText().trim();
                user_concert_info.dispose();
                purchaseMerchandiseQuery(user_name, tour_name, date, merchandise_item, quantity);
            }
        });

        label_and_text.setLayout(new BoxLayout(label_and_text, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new FlowLayout());

        label_and_text.add(user_id);
        label_and_text.add(user_id_input);
        label_and_text.add(tour_name);
        label_and_text.add(tour_name_input);
        label_and_text.add(date);
        label_and_text.add(date_input);
        label_and_text.add(date);
        label_and_text.add(date_input);
        label_and_text.add(merchandise_item);
        label_and_text.add(merchandise_item_input);
        label_and_text.add(quantity);
        label_and_text.add(quantity_input);
        buttons_field.add(back_home);
        buttons_field.add(submit);
        user_concert_info.add(label_and_text, BorderLayout.PAGE_START);
        user_concert_info.add(buttons_field, BorderLayout.PAGE_END);
        user_concert_info.setSize(1300, 600);
        user_concert_info.setVisible(true);
    }

    //Runs purchase merchandise stored procedure 
    public void purchaseMerchandiseQuery (String username, String tourname, String date, String merchandise_item, String quantity) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement buy_merch = connection.prepareCall("{call buy_merchandise(?, ?, ?, ?, ?)}");
            buy_merch.setString(1, username);
            buy_merch.setString(2, tourname);
            Date date_date = Date.valueOf(date);
            buy_merch.setDate(3, date_date);
            buy_merch.setString(4, merchandise_item);
            Integer quantity_int = Integer.valueOf(quantity);
            buy_merch.setInt(5, quantity_int);
            boolean execute = buy_merch.execute();
            CallableStatement checkBalance = connection.prepareCall("{call checkUsers(?)}");
            checkBalance.setString(1, username);
            ResultSet resultSet = checkBalance.executeQuery();
            userInfoMerchandise(resultSet);
        }
        catch (SQLException s) {
            invalidInformation();
            s.printStackTrace();
        } 
    }

    // Frame for printing out that there was invalid information 
    public void invalidInformation () {
        JFrame invalid_info = new JFrame("Invalid Information");
        JPanel labels = new JPanel();
        JPanel buttons = new JPanel();
        JLabel invalid = new JLabel("Invalid information! Please try again.");
        invalid.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                invalid_info.dispose();
                goToCustomerHome();
            }
            
        });
        labels.setLayout(new BoxLayout(labels, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new GridLayout());
        labels.add(invalid);
        buttons.add(back_to_home);
        invalid_info.add(labels, BorderLayout.PAGE_START);
        invalid_info.add(buttons, BorderLayout.PAGE_END);
        invalid_info.setSize(300, 300);
        invalid_info.setVisible(true);
    }

    //Frame for printing out user information 
    public void userInfoMerchandise (ResultSet resultSet) {
        StringBuilder b = new StringBuilder();
        try {
            b.append("<html>");
            while (resultSet.next()) {
                b.append("<br>Username: " + resultSet.getString(1) + "<br>Balance: " + resultSet.getString(2) + "<br>Merch Purchased: " + resultSet.getString(3) + "<br>Tickets Purchased: " + resultSet.getString(4));
            }
            b.append("</html>");
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        JFrame frame = new JFrame("SetList");
        JPanel label = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel songs = new JLabel(b.toString());
        songs.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                goToCustomerHome();
            }
        });
        label.setLayout(new BoxLayout(label, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new GridLayout());
        label.add(songs);
        buttons_field.add(back_home);
        frame.add(label, BorderLayout.PAGE_START);
        frame.add(buttons_field, BorderLayout.PAGE_END);
        frame.setSize(1000, 500);
        frame.setVisible(true);
    }

    // QUERY #5: PURCHASE TICKETS
    public void inputUserandConcertInfoTickets() {
        // define objects (JFrame, panels, buttons, labels, textfields)
        JFrame user_concert_info = new JFrame("User, Concert, and Ticket Information");
        JPanel label_and_text = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel user_id = new JLabel("User ID:");
        user_id.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField user_id_input = new JTextField();
        user_id_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel tour_name = new JLabel("Tour name:");
        tour_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField tour_name_input = new JTextField();
        tour_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel date = new JLabel("Concert Date (in yyyy-mm-dd format):");
        date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField date_input = new JTextField();
        date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel ticket_section = new JLabel("Ticket Section (VIP, General Admission,\n" +
                "Premium, Upper (Seated), Lower (Seated),\n" +
                "Other, Balcony):");
        ticket_section.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField ticket_section_input = new JTextField();
        ticket_section_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel quantity = new JLabel("Quantity:");
        quantity.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField quantity_input = new JTextField();
        quantity_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                user_concert_info.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String user_name = user_id_input.getText().trim();
                String artist_name = tour_name_input.getText().trim();
                String date = date_input.getText().trim();
                String ticket_section = ticket_section_input.getText().trim();
                String quantity = quantity_input.getText().trim();
                user_concert_info.dispose();
                purchaseTicketsQuery(user_name, artist_name, date, ticket_section, quantity);
            }
        });

        label_and_text.setLayout(new BoxLayout(label_and_text, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new FlowLayout());

        label_and_text.add(user_id);
        label_and_text.add(user_id_input);
        label_and_text.add(tour_name);
        label_and_text.add(tour_name_input);
        label_and_text.add(date);
        label_and_text.add(date_input);
        label_and_text.add(date);
        label_and_text.add(date_input);
        label_and_text.add(ticket_section);
        label_and_text.add(ticket_section_input);
        label_and_text.add(quantity);
        label_and_text.add(quantity_input);
        buttons_field.add(back_home);
        buttons_field.add(submit);
        user_concert_info.add(label_and_text, BorderLayout.PAGE_START);
        user_concert_info.add(buttons_field, BorderLayout.PAGE_END);
        user_concert_info.setSize(1300, 600);
        user_concert_info.setVisible(true);
    }

    //Runs purchase merchandise stored procedure 
    public void purchaseTicketsQuery (String username, String tourname, String date, String ticket_section, String quantity) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement buyTickets = connection.prepareCall("{call buy_tickets(?, ?, ?, ?, ?)}");
            buyTickets.setString(1, username);
            buyTickets.setString(2, tourname);
            Date date_date = Date.valueOf(date);
            buyTickets.setDate(3, date_date);
            buyTickets.setString(4, ticket_section);
            Integer quantity_int = Integer.valueOf(quantity);
            buyTickets.setInt(5, quantity_int);
            boolean execute = buyTickets.execute();
            CallableStatement checkBalance = connection.prepareCall("{call checkUsers(?)}");
            checkBalance.setString(1, username);
            ResultSet resultSet = checkBalance.executeQuery();
            userInfoTickets(resultSet);
            
        }
        catch (SQLException s) {
            invalidInformation();
            s.printStackTrace();
        } 
    }

    //Frame for printing out user information 
    public void userInfoTickets (ResultSet resultSet) {
        StringBuilder b = new StringBuilder();
        try {
            b.append("<html>");
            while (resultSet.next()) {
                b.append("<br>Username: " + resultSet.getString(1) + "<br>Balance: " + resultSet.getString(2) + "<br>Merch Purchased: " + resultSet.getString(3) + "<br>Tickets Purchased: " + resultSet.getString(4));
            }
            b.append("</html>");
        }
        catch (SQLException s) {
            s.printStackTrace();
        }
        JFrame frame = new JFrame("User Info");
        JPanel label = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel songs = new JLabel(b.toString());
        songs.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                goToCustomerHome();
            }
        });
        label.setLayout(new BoxLayout(label, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new GridLayout());
        label.add(songs);
        buttons_field.add(back_home);
        frame.add(label, BorderLayout.PAGE_START);
        frame.add(buttons_field, BorderLayout.PAGE_END);
        frame.setSize(1000, 500);
        frame.setVisible(true);
    }


    //ORGANIZER HOME PAGE
    public void goToOrganizerHome () {
        // Setting Home Screen
        JFrame home = new JFrame("Organizer Home Screen");
        home.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        home.setSize(1000,800);
        // Buttons to indicate which action the user would like to do on the database
        JButton new_merch = new JButton("New Merchandise for Concert");
        new_merch.setFont(new Font("Calibri", Font.PLAIN, 40));
        new_merch.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputTourMerchInfo();
            }
        });
        JButton cancel_concert = new JButton("Cancel Concert");
        cancel_concert.setFont(new Font("Calibri", Font.PLAIN, 40));
        cancel_concert.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputConcertToDelete();
            }
        });
        JButton customer_organizer = new JButton("Back to Customer/Organizer Screen");
        customer_organizer.setFont(new Font("Calibri", Font.PLAIN, 40));
        customer_organizer.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                customerOrOrganizer();
            }
        });

        // Add buttons to home screen
        home.add(new_merch);
        home.add(cancel_concert);
        home.add(customer_organizer);
        // setting layout
        home.setLayout(new GridLayout(3, 1));
        // Make home screen visible
        home.setVisible(true);
    }

    // QUERY #6
    // NEW MERCHANDISE ITEM FOR SPECIFIC CONCERT
    public void inputTourMerchInfo() {
        JFrame concert_artist_info = new JFrame();
        JPanel labels_and_text = new JPanel();
        JPanel buttonsField = new JPanel();
        JLabel tour_name = new JLabel("Tour Name: ");
        tour_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel date = new JLabel("Date of Concert (in yyyy-mm-dd format): ");
        date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel item_name = new JLabel("Merchandise Item: ");
        item_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel category = new JLabel("Merchandise Category (shirt, hoodie, hat, pants, keychain, poster, other clothing, other item): ");
        category.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel price = new JLabel("Merchandise Price (no dollar sign, just number with no decimal points): ");
        price.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel quantity = new JLabel("Quantity: ");
        quantity.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField tour_name_input = new JTextField();
        tour_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField date_input = new JTextField();
        date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField item_name_input = new JTextField();
        item_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField category_input = new JTextField();
        category_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField price_input = new JTextField();
        price_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField quantity_input = new JTextField();
        quantity_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                concert_artist_info.dispose();
                goToOrganizerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String tour_name = tour_name_input.getText().trim();
                String date = date_input.getText().trim();
                String item_name = item_name_input.getText().trim();
                String category = category_input.getText().trim();
                String price = price_input.getText().trim();
                String quantity = quantity_input.getText().trim();
                concert_artist_info.dispose();
                new_merchandise_query(tour_name, date, item_name, category, price, quantity);
            }
        });
        labels_and_text.setLayout(new BoxLayout(labels_and_text, BoxLayout.PAGE_AXIS));
        buttonsField.setLayout(new GridLayout());
        labels_and_text.add(tour_name);
        labels_and_text.add(tour_name_input);
        labels_and_text.add(date);
        labels_and_text.add(date_input);
        labels_and_text.add(item_name);
        labels_and_text.add(item_name_input);
        labels_and_text.add(category);
        labels_and_text.add(category_input);
        labels_and_text.add(price);
        labels_and_text.add(price_input);
        labels_and_text.add(quantity);
        labels_and_text.add(quantity_input);
        buttonsField.add(back_home);
        buttonsField.add(submit);
        concert_artist_info.add(labels_and_text, BorderLayout.PAGE_START);
        concert_artist_info.add(buttonsField, BorderLayout.PAGE_END);
        concert_artist_info.setSize(1000, 800);
        concert_artist_info.setVisible(true);
    }

    public void new_merchandise_query (String tour_name, String date, String item_name, String category, String price, String quantity) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement addMerch = connection.prepareCall("{call add_merch(?, ?, ?, ?, ?, ?)}");
            addMerch.setString(1, tour_name);
            Date date_date = Date.valueOf(date);
            addMerch.setDate(2, date_date);
            addMerch.setString(3, item_name);
            addMerch.setString(4, category);
            BigInteger price_int = new BigInteger(price);
            addMerch.setBigDecimal(5, new BigDecimal(price_int));
            Integer quantity_int = Integer.valueOf(quantity);
            addMerch.setInt(6, quantity_int);
            int rowsInserted = addMerch.executeUpdate();
            if (rowsInserted > 0) {
                confirmation();
            }
            else {
                invalidInformation();
            }
        }
        catch (SQLException s) {
            invalidInformation();
            s.printStackTrace();
        } 
    }

    public void confirmation () {
        JFrame confirmation_window = new JFrame("Action Confirmation");
        JPanel labels = new JPanel();
        JPanel buttons = new JPanel();
        JLabel complete = new JLabel("Your action has been complete!");
        complete.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                confirmation_window.dispose();
                goToOrganizerHome();
            }
        });
        labels.setLayout(new BoxLayout(labels, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new FlowLayout());
        labels.add(complete);
        buttons.add(back_to_home);
        confirmation_window.add(labels, BorderLayout.PAGE_START);
        confirmation_window.add(buttons, BorderLayout.PAGE_END);
        confirmation_window.setSize(500, 300);
        confirmation_window.setVisible(true);
    }

    public void concertInvalid () {
        JFrame invalid_info = new JFrame("Concert Invalid Information");
        JPanel labels = new JPanel();
        JPanel buttons = new JPanel();
        JLabel invalid = new JLabel("Invalid information! Please try again.");
        invalid.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                invalid_info.dispose();
                goToOrganizerHome();
            }
        });
        labels.setLayout(new BoxLayout(labels, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new FlowLayout());
        labels.add(invalid);
        buttons.add(back_to_home);
        invalid_info.add(labels, BorderLayout.PAGE_START);
        invalid_info.add(buttons, BorderLayout.PAGE_END);
        invalid_info.setSize(300, 300);
        invalid_info.setVisible(true);
    }


    // QUERY #7: CANCEL CONCERT
    public void inputConcertToDelete() {
        JFrame concert_info = new JFrame("Concert Information");
        JPanel labels_and_text = new JPanel();
        JPanel buttonsField = new JPanel();
        JLabel tour_name = new JLabel("Tour Name: ");
        tour_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField tour_name_input = new JTextField();
        tour_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel date = new JLabel("Date of Concert (in yyyy-mm-dd format):");
        date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField date_input = new JTextField();
        date_input.setFont(new Font("Calibri", Font.PLAIN, 30));

        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                concert_info.dispose();
                goToOrganizerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String tour_name = tour_name_input.getText().trim();
                String date = date_input.getText().trim();
                concert_info.dispose();
                delete_query(tour_name, date);
            }
        });
        labels_and_text.setLayout(new BoxLayout(labels_and_text, BoxLayout.PAGE_AXIS));
        buttonsField.setLayout(new GridLayout());
        labels_and_text.add(tour_name);
        labels_and_text.add(tour_name_input);
        labels_and_text.add(date);
        labels_and_text.add(date_input);
        buttonsField.add(back_home);
        buttonsField.add(submit);
        concert_info.add(labels_and_text, BorderLayout.PAGE_START);
        concert_info.add(buttonsField, BorderLayout.PAGE_END);
        concert_info.setSize(800, 500);
        concert_info.setVisible(true);
    }

    public void delete_query (String tour_name, String date) {
        try {
            Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement delete = connection.prepareCall("{call delete_concert(?, ?)}");
            delete.setString(1, tour_name);
            Date date_date = Date.valueOf(date);
            delete.setDate(2, date_date);
            int rowsDeleted = delete.executeUpdate();
            if (rowsDeleted > 0) {
                confirmation();
            }
            else {
                invalidInformation();
            }
        }
        catch (SQLException s) {
            invalidInformation();
            s.printStackTrace();
        } 
    }



    public static void main (String [] args) {
        UI program = new UI();
        program.customerOrOrganizer();

    }
}
