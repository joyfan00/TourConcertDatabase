import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UI {
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
        JButton merch_tickets = new JButton("Purchase Merchandise or Tickets");
        merch_tickets.setFont(new Font("Calibri", Font.PLAIN, 40));
        merch_tickets.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputUserandConcertInfo();
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
        home.add(merch_tickets);
        home.add(customer_organizer);
        // setting layout
        home.setLayout(new GridLayout(5, 1));
        // Make home screen visible
        home.setVisible(true);
    }

    // QUERY #1:
    // NEW OR EXISTING USER ACCESSING INFORMATION
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

    // EXISTING USER INFORMATION
    public void existing_user_info () {
        JFrame existing_user = new JFrame("Existing User Info");
        JPanel labels_and_text = new JPanel();
        JPanel buttons = new JPanel();
        JLabel user_id = new JLabel("User ID: ");
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
                // TODO: add function to provide user data
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

    // QUERY #2
    // FIND MY SETLIST
    // FILTER USING CONCERT INFO
    public void inputConcertInfo () {
        // set up objects (JFrame, buttons, panels, textfields)
        JFrame concertinfo = new JFrame("Concert Info");
        JPanel concert_artist_info = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel artist = new JLabel("Artist Name: ");
        artist.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField artist_input = new JTextField();
        artist_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel time = new JLabel("Time of Concert:");
        time.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField time_input = new JTextField();
        time_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel city = new JLabel("City of Concert:");
        city.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField city_input = new JTextField();
        city_input.setFont(new Font("Calibri", Font.PLAIN, 30));
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
                String artist_name = artist_input.getText().trim();
                String time_text = time_input.getText().trim();
                String city_text = city_input.getText().trim();
                concertinfo.dispose();
                //TODO: print out song info
            }
        });

        concert_artist_info.setLayout(new BoxLayout(concert_artist_info, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new FlowLayout());

        concert_artist_info.add(artist);
        concert_artist_info.add(artist_input);
        concert_artist_info.add(time);
        concert_artist_info.add(time_input);
        concert_artist_info.add(city);
        concert_artist_info.add(city_input);
        buttons_field.add(back_to_home);
        buttons_field.add(submit);
        concertinfo.add(concert_artist_info, BorderLayout.PAGE_START);
        concertinfo.add(buttons_field, BorderLayout.PAGE_END);
        concertinfo.setSize(800, 500);
        concertinfo.setVisible(true);
    }

    // QUERY #3
    // ARTISTS TOURING NEAR ME
    public void inputDateRangeAndCity() {
        // initialization of JFrames, buttons, panels, and defining characteristics regarding smaller attributes
        JFrame concertinfo = new JFrame("Concert Info");
        JPanel date_city_info = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel start_date = new JLabel("Start Date: ");
        start_date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField start_date_input = new JTextField();
        start_date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel end_date = new JLabel("End Date: ");
        end_date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField end_date_input = new JTextField();
        end_date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel city = new JLabel("City: ");
        city.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField city_input = new JTextField();
        city_input.setFont(new Font("Calibri", Font.PLAIN, 30));
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
                concertinfo.dispose();
                //TODO: print out artists, dates, number of available tickets
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
        buttons_field.add(back_to_home);
        buttons_field.add(submit);
        concertinfo.add(date_city_info, BorderLayout.PAGE_START);
        concertinfo.add(buttons_field, BorderLayout.PAGE_END);
        concertinfo.setSize(800, 500);
        concertinfo.setVisible(true);
    }

    // QUERY #4
    // PURCHASE MERCHANDISE OR TICKETS
    // GET USER AND CONCERT INFO
    public void inputUserandConcertInfo() {
        // define objects (JFrame, panels, buttons, labels, textfields)
        JFrame user_concert_info = new JFrame("User and Concert Info");
        JPanel label_and_text = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel name = new JLabel("User Name:");
        name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField name_input = new JTextField();
        name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel artist = new JLabel("Concert Artist:");
        artist.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField artist_input = new JTextField();
        artist_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel city = new JLabel("Concert City:");
        city.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField city_input = new JTextField();
        city_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel day = new JLabel("Concert Date (in mm:dd:yyyy format):");
        day.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField day_input = new JTextField();
        day_input.setFont(new Font("Calibri", Font.PLAIN, 30));
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
                String user_name = name_input.getText().trim();
                String artist_name = artist_input.getText().trim();
                String city_name = city_input.getText().trim();
                String date = day_input.getText().trim();
                user_concert_info.dispose();
                merchandise_or_tickets();
            }
        });

        label_and_text.setLayout(new BoxLayout(label_and_text, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new FlowLayout());

        label_and_text.add(name);
        label_and_text.add(name_input);
        label_and_text.add(artist);
        label_and_text.add(artist_input);
        label_and_text.add(city);
        label_and_text.add(city_input);
        label_and_text.add(day);
        label_and_text.add(day_input);
        buttons_field.add(back_home);
        buttons_field.add(submit);
        user_concert_info.add(label_and_text, BorderLayout.PAGE_START);
        user_concert_info.add(buttons_field, BorderLayout.PAGE_END);
        user_concert_info.setSize(800, 600);
        user_concert_info.setVisible(true);
    }

    // MERCHANDISE OR TICKETS SCREEN
    public void merchandise_or_tickets () {
        JFrame merch_tickets = new JFrame("Merchandise or Tickets");
        JButton merchandise = new JButton("Buying Merchandise");
        merchandise.setFont(new Font("Calibri", Font.PLAIN, 30));
        merchandise.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                merch_tickets.dispose();
                merchandise_order();
            }
        });
        JButton tickets = new JButton("Buying Tickets");
        tickets.setFont(new Font("Calibri", Font.PLAIN, 30));
        tickets.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                merch_tickets.dispose();
                ticket_order();
            }
        });
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                merch_tickets.dispose();
                goToCustomerHome();
            }
        });

        merch_tickets.add(merchandise);
        merch_tickets.add(tickets);
        merch_tickets.add(back_home);
        merch_tickets.setLayout(new GridLayout(3, 1));
        merch_tickets.setSize(500, 500);
        merch_tickets.setVisible(true);
    }

    // MERCHANDISE ORDER FORM
    public void merchandise_order () {
        JFrame merch_order = new JFrame("Merchandise Order");
        JPanel labels_text = new JPanel();
        JPanel buttons = new JPanel();
        JLabel merch_name = new JLabel("Merchandise Item Name:");
        merch_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField merch_name_input = new JTextField();
        merch_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                merch_order.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                merch_order.dispose();
                //TODO:add confirmation status, tell how much charged to user account
            }
        });

        labels_text.setLayout(new BoxLayout(labels_text, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new GridLayout());
        labels_text.add(merch_name);
        labels_text.add(merch_name_input);
        buttons.add(back_home);
        buttons.add(submit);
        merch_order.add(labels_text, BorderLayout.PAGE_START);
        merch_order.add(buttons, BorderLayout.PAGE_END);
        merch_order.setSize(500, 500);
        merch_order.setVisible(true);
    }

    // TICKET ORDER FORM
    public void ticket_order () {
        JFrame ticket_order = new JFrame("Ticket Order");
        JPanel labels_text = new JPanel();
        JPanel buttons = new JPanel();
        JLabel ticket_name = new JLabel("Ticket Type:");
        ticket_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField ticket_name_input = new JTextField();
        ticket_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ticket_order.dispose();
                goToCustomerHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String ticket_type = ticket_name_input.getText().trim();
                ticket_order.dispose();
                //TODO:add confirmation status, tell how much charged to user account (if worked)
            }
        });

        labels_text.setLayout(new BoxLayout(labels_text, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new GridLayout());
        labels_text.add(ticket_name);
        labels_text.add(ticket_name_input);
        buttons.add(back_home);
        buttons.add(submit);
        ticket_order.add(labels_text, BorderLayout.PAGE_START);
        ticket_order.add(buttons, BorderLayout.PAGE_END);
        ticket_order.setSize(500, 500);
        ticket_order.setVisible(true);
    }

    //ORGANIZER HOME PAGE
    public void goToOrganizerHome () {
        // Setting Home Screen
        JFrame home = new JFrame("Customer Home Screen");
        home.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        home.setSize(1000,800);
        // Buttons to indicate which action the user would like to do on the database
        JButton add_artist = new JButton("Add New Artist for Concert");
        add_artist.setFont(new Font("Calibri", Font.PLAIN, 30));
        add_artist.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputConcertArtistInfo();
            }
        });
        JButton add_song_setlist = new JButton("Mark Up / Down Prices for Tickets & Merchandise Based on Concert");
        add_song_setlist.setFont(new Font("Calibri", Font.PLAIN, 30));
        add_song_setlist.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                inputConcertandPercentage();
            }
        });
        JButton customer_organizer = new JButton("Back to Customer/Organizer Screen");
        customer_organizer.setFont(new Font("Calibri", Font.PLAIN, 30));
        customer_organizer.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                home.dispose();
                customerOrOrganizer();
            }
        });
        // Add buttons to home screen
        home.add(add_artist);
        home.add(add_song_setlist);
        home.add(customer_organizer);
        // setting layout
        home.setLayout(new GridLayout(3, 1));
        // Make home screen visible
        home.setVisible(true);
    }

    // QUERY #5
    // ADD NEW ARTIST TO CONCERT
    public void inputConcertArtistInfo() {
        JFrame concert_artist_info = new JFrame();
        JPanel labels_and_text = new JPanel();
        JPanel buttonsField = new JPanel();
        JLabel artist = new JLabel("Concert Artist: ");
        artist.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel city = new JLabel("Concert City: ");
        city.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel time = new JLabel("Concert Time: ");
        time.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel new_artist = new JLabel("New Artist: ");
        new_artist.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField artist_input = new JTextField();
        artist_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField city_input = new JTextField();
        city_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField time_input = new JTextField();
        time_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField new_artist_input = new JTextField();
        new_artist_input.setFont(new Font("Calibri", Font.PLAIN, 30));
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
                concert_artist_info.dispose();
                //TODO: add confirmation that artist has been added to the concert, print out concert details
            }
        });
        labels_and_text.setLayout(new BoxLayout(labels_and_text, BoxLayout.PAGE_AXIS));
        buttonsField.setLayout(new GridLayout());
        labels_and_text.add(artist);
        labels_and_text.add(artist_input);
        labels_and_text.add(artist_input);
        labels_and_text.add(city);
        labels_and_text.add(city_input);
        labels_and_text.add(time);
        labels_and_text.add(time_input);
        labels_and_text.add(new_artist);
        labels_and_text.add(new_artist_input);
        buttonsField.add(back_home);
        buttonsField.add(submit);
        concert_artist_info.add(labels_and_text, BorderLayout.PAGE_START);
        concert_artist_info.add(buttonsField, BorderLayout.PAGE_END);
        concert_artist_info.setSize(500, 500);
        concert_artist_info.setVisible(true);
    }

    // QUERY #6
    // MARK UP OR MARK DOWN PURCHASED ITEMS
    // INPUT CONCERT INFORMATION
    public void inputConcertandPercentage () {
        JFrame concert_info = new JFrame();
        JPanel labels_and_text = new JPanel();
        JPanel buttons = new JPanel();
        JLabel artist = new JLabel("Artist Name:");
        artist.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel city = new JLabel("Concert City:");
        city.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel date = new JLabel("Concert Date:");
        date.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel time = new JLabel("Time of Concert (military time):");
        time.setFont(new Font("Calibri", Font.PLAIN, 30));
        JLabel percentage = new JLabel("Percentage (just the number):");
        percentage.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField artist_input = new JTextField();
        artist_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField city_input = new JTextField();
        city_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField date_input = new JTextField();
        date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField time_input = new JTextField();
        time_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField percentage_input = new JTextField();
        percentage_input.setFont(new Font("Calibri", Font.PLAIN, 30));
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
                String artist_name = artist_input.getText().trim();
                String city_name = city_input.getText().trim();
                String date_text = date_input.getText().trim();
                String time_text = time_input.getText().trim();
                int percentage_text = Integer.parseInt(percentage_input.getText().trim());
                concert_info.dispose();
                //TODO: get confirmation if the concert is valid
            }
        });

        labels_and_text.setLayout(new BoxLayout(labels_and_text, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new GridLayout());

        labels_and_text.add(artist);
        labels_and_text.add(artist_input);
        labels_and_text.add(city);
        labels_and_text.add(city_input);
        labels_and_text.add(date);
        labels_and_text.add(date_input);
        labels_and_text.add(time);
        labels_and_text.add(time_input);
        labels_and_text.add(percentage);
        labels_and_text.add(percentage_input);
        buttons.add(back_home);
        buttons.add(submit);
        concert_info.add(labels_and_text, BorderLayout.PAGE_START);
        concert_info.add(buttons, BorderLayout.PAGE_END);
        concert_info.setSize(500, 500);
        concert_info.setVisible(true);
    }



    public static void main (String [] args) {
        UI program = new UI();
        program.customerOrOrganizer();

    }
}
