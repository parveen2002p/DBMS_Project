import javax.swing.*;
import java.awt.event.ComponentAdapter;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class menu extends JFrame{
    private JButton myProfileButton;
    private JButton yourRidesButton;
    private JButton walletButton;
    private JButton aboutButton;
    private JPanel menuPanel;
    private JPanel MyProfilePanel;
    private JTextField firstNameTextField;
    private JButton updateProfileButton;
    private JTextField lastNameTextField;
    private JTextField midNameTextField;
    private JTextField phoneTextField;
    private JTextField emailTextField;
    private JTextField altPhoneTextField;
    private JTextField ageTextField;
    private JLabel firstNameLabel;
    private JLabel lastNameLabel;
    private JLabel middleNameLabel;
    private JLabel phoneNumberLabel;
    private JLabel emailLabel;
    private JLabel alternatePhoneNumberLabel;
    private JLabel ageLabel;
    private JButton backToMenuButton;
    private JButton homecreenButton;
    private JLabel passwordLabel;
    private JTextField enterNewPasswordTextField;

    public menu(String title){
        super(title);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setContentPane(menuPanel);
        MyProfilePanel.setVisible(false);
        this.pack();
        this.setVisible(true);
        this.setResizable(false);
        //frameInit();
        myProfileButton.addComponentListener(new ComponentAdapter() {
        });
        myProfileButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                setPro();
                MyProfilePanel.setVisible(true);
            }
        });
        walletButton.addComponentListener(new ComponentAdapter() {
        });
        walletButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                wallet();
            }
        });

        backToMenuButton.addComponentListener(new ComponentAdapter() {
        });
        backToMenuButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                MyProfilePanel.setVisible(false);
            }
        });
        yourRidesButton.addComponentListener(new ComponentAdapter() {
        });
        yourRidesButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                JFrame  userRideHistoryPage= new UserRideHistoryPage("menu");
                dispose();
            }
        });

        updateProfileButton.addComponentListener(new ComponentAdapter() {
        });
        updateProfileButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                updateMyProfile();
            }
        });
        homecreenButton.addComponentListener(new ComponentAdapter() {
        });
        homecreenButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                JFrame  mainScreen= new mainScreen("mainscreen");
                dispose();
            }
        });
    }
    public void wallet(){
        try {
        Connection con= DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cab2","root","parveen");
        String sql;
        PreparedStatement pst;
        ResultSet rs;
        sql = "select money from wallet where id= "+MainDriver.custId;
        pst = con.prepareStatement(sql);
        rs= pst.executeQuery();
        if (rs.next()){
            System.out.println("Your Wallet Amount: " +rs.getString(1));
        }
    }
        catch(Exception e){ System.out.println(e);}
    }

    public void setPro(){
        String firstnameStr="";
        String MnameStr ="";
        String LnameStr ="";

        String emailStr ="";
        String passwordStr="";
        String phoneStr ="";
        String AltphoneStr="";
        String ageStr ="";

        try{
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            String sql = "select * from customer where id = ?;";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1,MainDriver.custId);
            ResultSet rs= pst.executeQuery();
            if (rs.next()){
               firstnameStr = rs.getString(2);
                MnameStr = rs.getString(3);
                LnameStr = rs.getString(4);
                passwordStr = rs.getString(5);
                ageStr = rs.getString(7);
                emailStr = rs.getString(8);
                phoneStr = rs.getString(9);
                AltphoneStr = rs.getString(10);
            }
        }
        catch(Exception e){ System.out.println(e);}

        firstNameTextField.setText(firstnameStr);
        midNameTextField.setText(MnameStr);
        lastNameTextField.setText(LnameStr);
        emailTextField.setText(emailStr);
        enterNewPasswordTextField.setText(passwordStr);
        phoneTextField.setText(phoneStr);
        altPhoneTextField.setText(AltphoneStr);
        ageTextField.setText(ageStr);
    }

    public void updateMyProfile(){
        try {
            String firstnameStr = firstNameTextField.getText();
            String MnameStr = midNameTextField.getText();
            String LnameStr = lastNameTextField.getText();

            String emailStr = emailTextField.getText();
            String passwordStr = enterNewPasswordTextField.getText();
            int phoneStr = Integer.parseInt(phoneTextField.getText());
            int AltphoneStr = Integer.parseInt(altPhoneTextField.getText());
            int ageStr = Integer.parseInt(ageTextField.getText());

            try{
                //Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con= DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cab2","root","parveen");
                String sql = "update customer set firstName=?,midName=?,lastName=?,age=?,email=?,phoneNumber=?,altPhoneNumber =?,password=? where id=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1,firstnameStr);
                pst.setString(2, MnameStr);
                pst.setString(3,LnameStr);
                pst.setInt(4,ageStr);
                pst.setString(5,emailStr);
                pst.setInt(6,phoneStr);
                pst.setInt(7,AltphoneStr);
                pst.setInt(9,MainDriver.custId);
                pst.setString(8,passwordStr);
                System.out.println(pst);
                int count = pst.executeUpdate();

                if (count>0){
                    JOptionPane.showMessageDialog(this,"Success");
                }
                else {
                    JOptionPane.showMessageDialog(this,"failed");
                }

            }
            catch(Exception e){ System.out.println(e);}
        }
        catch (Exception e){
            System.out.println("One or more field is empty or Invalid");
            JOptionPane.showMessageDialog(this,"One or more field is empty or Invalid");
        }

    }

    public static void main(String[] args) {
        JFrame menu = new menu("menu");
        menu.setVisible(true);
        menu.setResizable(false);
    }
}
