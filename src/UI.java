import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class UI {
    public void goToHome () {
        // Setting Home Screen
        JFrame home = new JFrame("Home Screen");
        home.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        home.setSize(1000,1000);
        // Buttons to indicate which action the user would like to do on the database
        JButton songinfo = new JButton("Song Info Based on Concert Info");
        songinfo.setFont(new Font("Calibri", Font.PLAIN, 40));
        songinfo.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                inputConcertInfo();
            }
        });
        JButton artist_concerts_info = new JButton("Artists & Concerts Based on Date Range & City");
        artist_concerts_info.setFont(new Font("Calibri", Font.PLAIN, 40));
        artist_concerts_info.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                inputDateRangeAndCity();
            }
        });
        JButton merch_tickets = new JButton("Buying Merchandise & Tickets");
        merch_tickets.setFont(new Font("Calibri", Font.PLAIN, 40));
        merch_tickets.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                inputUserandConcertInfo();
            }
        });
        JButton delete_add_tours = new JButton("Delete or Add Tour");
        delete_add_tours.setFont(new Font("Calibri", Font.PLAIN, 40));
        delete_add_tours.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                input_tour_name();
            }
        });
        JButton add_artist = new JButton("Add new Artist for Concert");
        add_artist.setFont(new Font("Calibri", Font.PLAIN, 40));
        add_artist.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        JButton add_song_setlist = new JButton("Add New Songs to Setlist");
        add_song_setlist.setFont(new Font("Calibri", Font.PLAIN, 40));
        add_song_setlist.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                inputConcert();
            }
        });
        // Add buttons to home screen
        home.add(songinfo);
        home.add(artist_concerts_info);
        home.add(merch_tickets);
        home.add(delete_add_tours);
        home.add(add_artist);
        home.add(add_song_setlist);
        // setting layout
        home.setLayout(new GridLayout(6, 0));
        // Make home screen visible
        home.setVisible(true);
    }
    // query 1
    // inputing concert info to filter a specific conert
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
                goToHome();
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
    // query 2
    // input date range and city
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
                goToHome();
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

    //query 3
    // input user info
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
                goToHome();
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

    //query 4
    public void inputConcertArtistInfo() {
        JFrame concert_artist_info = new JFrame();
        JPanel labels_and_text = new JPanel();
        JPanel buttonsField = new JPanel();
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                concert_artist_info.dispose();
                goToHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
    }

    //query 4
    public void input_tour_name() {
        JFrame input_tour = new JFrame("Tour Information");
        JPanel labels_and_text = new JPanel();
        JPanel buttons = new JPanel();
        JLabel tour_name = new JLabel("Tour name: ");
        tour_name.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField tour_name_input = new JTextField();
        tour_name_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                input_tour.dispose();
                goToHome();
            }
        });
        JButton submit = new JButton("Submit Info");
        submit.setFont(new Font("Calibri", Font.PLAIN, 30));
        submit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String tour_name_text = tour_name_input.getText().trim();
                input_tour.dispose();
                button_add_delete_tour(tour_name_text);
            }
        });

        labels_and_text.setLayout(new BoxLayout(labels_and_text, BoxLayout.PAGE_AXIS));
        buttons.setLayout(new FlowLayout());

        labels_and_text.add(tour_name);
        labels_and_text.add(tour_name_input);
        buttons.add(back_home);
        buttons.add(submit);
        input_tour.add(labels_and_text, BorderLayout.PAGE_START);
        input_tour.add(buttons, BorderLayout.PAGE_END);
        input_tour.setSize(500, 300);
        input_tour.setVisible(true);

    }

    public void button_add_delete_tour (String tour) {
        JFrame two_buttons = new JFrame("Add or Delete Tour");
        JButton add_tour = new JButton("Add Tour");
        add_tour.setFont(new Font("Calibri", Font.PLAIN, 30));
        add_tour.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //add tour
                // add concerts
                // add setlists for the concerts
                // add song for the concert
            }
        });
        JButton delete_tour = new JButton("Add Tour");
        delete_tour.setFont(new Font("Calibri", Font.PLAIN, 30));
        delete_tour.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //delete tour
            }
        });
        two_buttons.add(add_tour);
        two_buttons.add(delete_tour);
        two_buttons.setLayout(new GridLayout(2, 1));
        two_buttons.setSize(200, 200);

    }

    //query 6
    public void inputConcert () {
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
        JTextField artist_input = new JTextField();
        artist_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField city_input = new JTextField();
        city_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField date_input = new JTextField();
        date_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JTextField time_input = new JTextField();
        time_input.setFont(new Font("Calibri", Font.PLAIN, 30));
        JButton back_home = new JButton("Back to Home");
        back_home.setFont(new Font("Calibri", Font.PLAIN, 30));
        back_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                concert_info.dispose();
                goToHome();
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
                concert_info.dispose();
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
        buttons.add(back_home);
        buttons.add(submit);
        concert_info.add(labels_and_text, BorderLayout.PAGE_START);
        concert_info.add(buttons, BorderLayout.PAGE_END);
        concert_info.setSize(500, 500);
        concert_info.setVisible(true);
    }

    public static void main (String [] args) {
        UI program = new UI();
        program.goToHome();

    }
}
