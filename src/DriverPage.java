import javax.swing.*;
import java.sql.*;
import java.util.Scanner;

public class DriverPage {
    public static int driverId;
    public static boolean markTrue;
    public static int bookingId;
    public static void Driver(){
        Scanner sc = new Scanner(System.in);
        boolean exit = true;
        while (exit) {
            System.out.println("Welcome !!: ");
            System.out.println("1. Login ");
            System.out.println("2. Create Account ");
            System.out.println("3. exit ");
            System.out.print("Select: ");
            int ch = sc.nextInt();
            if (ch == 1) {
                login();
            } else if (ch == 2) {
                newAccount();
            }
            else if (ch == 3) {
                break;
            }
    }}
    public static void login(){
        Scanner sc = new Scanner(System.in);
        try {
            System.out.print("Enter DL Number: ");
            String usernameStr = sc.next();
            System.out.print("Enter Password: ");
            String passStr= sc.next();

            try{
                Connection con= DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cab2","root","parveen");
                String sql = "select id from driver where DLNumber = ? and password =?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1,usernameStr);
                pst.setString(2,passStr);
                ResultSet rs= pst.executeQuery();
                if (rs.next()){
                    driverId=rs.getInt(1);
                    DriverHome();
                }
                else {
                    System.out.println("Login failed!!");
                }
            }
            catch(Exception e){ System.out.println(e);}
        }
        catch (Exception e){
            System.out.println("One or more field is invalid!");
        }
    }
    public static void newAccount(){
        Scanner sc = new Scanner(System.in);
        try {
            System.out.print("Enter DL Number: ");
            String DLNumberStr = sc.next();
            System.out.print("Enter email: ");
            String emailStr = sc.next();
            System.out.print("Enter password: ");
            String passStr = sc.next();
            System.out.print("Enter Phone Number: ");
            int phoneStr = sc.nextInt();
            System.out.print("Enter First Name: ");
            String firstNameStr = sc.next();
            System.out.print("Enter Last Name: ");
            String lastNameStr = sc.next();
            System.out.print("Enter RC Number: ");
            int RCStr = sc.nextInt();
            System.out.print("Enter Car capacity: ");
            int capStr = sc.nextInt();
            System.out.print("Enter Car Name: ");
            String carNameStr = sc.next();
            System.out.print("Enter Car type (Sedan/SUV/Micro): ");
            String carTypeStr = sc.next();
            System.out.print("Enter Current Car Location: ");
            String carLocationStr = sc.next();

            try {
                //Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
                String sql = "insert into car(name,capacity,type,location,id)values(?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, carNameStr);
                pst.setInt(2, capStr);
                pst.setString(3, carTypeStr);
                pst.setString(4, carLocationStr);
                pst.setInt(5, RCStr);
                int count = pst.executeUpdate();
                if (count > 0) {
                    sql = "insert into driver(firstName,lastName,password,DLNumber,email,phoneNumber,RC)values(?,?,?,?,?,?,?)";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, firstNameStr);
                    pst.setString(2, lastNameStr);
                    pst.setString(3, passStr);
                    pst.setString(4, DLNumberStr);
                    pst.setString(5, emailStr);
                    pst.setInt(6, phoneStr);
                    pst.setInt(7, RCStr);
                    count = pst.executeUpdate();
                    if (count > 0) {
                        System.out.println("Success");
                    } else {
                        System.out.println("failed");
                        rollBack(RCStr);
                    }
                } else {
                    System.out.println("failed");
                }
            } catch (Exception e) {
                System.out.println("One or more field is invalid!");
                rollBack(RCStr);
            }
        }
        catch (Exception e) {
            System.out.println("One or more field is invalid!");
        }
    }
    public static void rollBack(int rc ){
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql = "delete from car where id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, rc);
            int count = pst.executeUpdate();
    }
        catch (Exception e) {
            System.out.println(" ");
        }}

    public static void act(){
        try {
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            String sql = "update driver set status=? where id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, "active");
            pst.setInt(2, driverId);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Updated !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }}

    public static void dect(){
        try {
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            String sql = "update driver set status=? where id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, "notActive");
            pst.setInt(2, driverId);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Updated !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }}

    public static void genBook(){
        try{
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            String sql = "select id from booking where driverId = ? and status =? order by id desc limit 1";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1,driverId);
            pst.setString(2,"waiting");
            ResultSet rs= pst.executeQuery();
            if (rs.next()){
                bookingId=rs.getInt(1);
            }
            else {
                System.out.println("ID gen failed!!");
            }
        }
        catch(Exception e){ System.out.println(e);}
    }
    public static void moneyEarned(){
        try{
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            String sql = "select sum(price) from booking where driverId=? group by status having status = 'success' ;";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1,driverId);
            ResultSet rs= pst.executeQuery();
            if (rs.next()){
                System.out.println("Net Amount: "+ rs.getInt(1));
            }
            else {
                System.out.println("failed!!");
            }
        }
        catch(Exception e){ System.out.println(e);}
    }

    public static void updatePass(){
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql;
            PreparedStatement pst;
            System.out.println("Trip Started !");
            sql = "update driver set password =? where id = ?";
            pst = con.prepareStatement(sql);
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter New Password: ");
            String pp =sc.next();
            if (pp==null){
                System.out.println("Failed !");
                return;
            }
            pst.setString(1, pp);
            pst.setInt(2, driverId);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Done changed !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }}

    public static void updatePhone(){
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql;
            PreparedStatement pst;
            System.out.println("Trip Started !");
            sql = "update driver set phoneNumber =? where id = ?";
            pst = con.prepareStatement(sql);
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter New phoneNumber: ");
            String pp =sc.next();
            if (pp==null){
                System.out.println("Failed !");
                return;
            }
            pst.setInt(1, Integer.parseInt(pp));
            pst.setInt(2, driverId);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Done changed !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }}

    public static void start(){
        if (markTrue){
            System.out.println("Already started !!");
            return;
        }
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql = "insert into trip(bookingId,completion,status,netDistance)values(?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            genBook();
            pst.setInt(1, bookingId);
            pst.setInt(2, 2);
            pst.setString(3, "started");
            pst.setInt(4, 100);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Trip Started !");
                sql = "update booking set status =? where id =?";
                pst = con.prepareStatement(sql);
                pst.setString(1, "ongoing");
                pst.setInt(2, bookingId);
                pst.executeUpdate();
                markTrue=true;
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }}

    public static void DriverHome(){
        Scanner sc = new Scanner(System.in);
        boolean exit = true;
        while (exit) {
            System.out.println("Welcome !!: ");
            tripDetails();
            System.out.println("1. Activate Status ");
            System.out.println("2. Deactivate Status ");
            System.out.println("3. Start Trip");
            System.out.println("4. Update Password");
            System.out.println("5. Update Phone Number");
            System.out.println("6. View Money earned");
            System.out.println("7. exit ");
            System.out.print("Select: ");
            int ch = sc.nextInt();
            if (ch == 1) {
                act();
            } else if (ch == 2) {
                dect();
            }
            else if (ch == 3) {
                start();
            }
            else if (ch == 4) {
                updatePass();
            }
            else if (ch == 5) {
                updatePhone();
            }
            else if (ch == 6) {
                moneyEarned();
            }
            else if (ch == 7) {
                break;
            }
        }
    }
    public static void tripDetails(){
        try{
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            String sql = "select id,custId,pickupStreet,destinationCity,price from booking where driverId = ? and status =? order by id desc limit 1";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1,driverId);
            pst.setString(2,"waiting");
            ResultSet rs= pst.executeQuery();
            if (rs.next()){
                System.out.println("New ride has been allocated to you: ");
                String row =
                        "customer Id: "+rs.getInt(2) +"\n"+
                        "Pickup Location: "+rs.getString(3) +"\n"+
                        "Destination Location: "+rs.getString(4) +"\n"+
                        "Trip Fare: "+rs.getString(5);
                System.out.println(row);
            }
            else {
                System.out.println("Currently No Ride allocated!");
                //update status to not busy
            }
        }
        catch(Exception e){ System.out.println(e);}
    }
}
