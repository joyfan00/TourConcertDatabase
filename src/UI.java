import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class UI {
    public void goToHome () {
        // Setting Home Screen
        JFrame home = new JFrame("Home Screen");
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
                inputUserInfo();
            }
        });
        JButton delete_add_tours = new JButton("Delete or Add Tour");
        delete_add_tours.setFont(new Font("Calibri", Font.PLAIN, 40));
        JButton add_artist = new JButton("Add new Artist for Concert");
        add_artist.setFont(new Font("Calibri", Font.PLAIN, 40));
        JButton add_song_setlist = new JButton("Add New Songs to Setlist");
        add_song_setlist.setFont(new Font("Calibri", Font.PLAIN, 40));
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
        JFrame concertinfo = new JFrame("Concert Info");
        JPanel concert_artist_info = new JPanel();
        JPanel buttons_field = new JPanel();
        JLabel artist = new JLabel("Artist Name: ");
        JTextField artist_input = new JTextField();
        JLabel time = new JLabel("Time of Concert:");
        JTextField time_input = new JTextField();
        JLabel venue = new JLabel("City of Concert:");
        JTextField venue_input = new JTextField();
        JButton back_to_home = new JButton("Back to Home");
        back_to_home.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                goToHome();
            }
        });
        JButton submit = new JButton("Submit Concert Info");

        concert_artist_info.setLayout(new BoxLayout(concert_artist_info, BoxLayout.PAGE_AXIS));
        buttons_field.setLayout(new FlowLayout());

        concert_artist_info.add(artist);
        concert_artist_info.add(artist_input);
        concert_artist_info.add(time);
        concert_artist_info.add(time_input);
        concert_artist_info.add(venue);
        concert_artist_info.add(venue_input);
        buttons_field.add(back_to_home);
        buttons_field.add(submit);
        concertinfo.add(concert_artist_info, BorderLayout.PAGE_START);
        concertinfo.add(buttons_field, BorderLayout.PAGE_END);

        concertinfo.add(artist);
        concertinfo.add(artist_input);
        concertinfo.setSize(500, 500);
        concertinfo.setVisible(true);
    }
    // query 2
    // input date range and city
    public void inputDateRangeAndCity() {

    }

    //query 3
    // input user info
    public void inputUserInfo() {

    }
    public static void main (String [] args) {
        UI program = new UI();
        program.goToHome();

    }
}
