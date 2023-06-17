import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Scanner;

public class MainDriver{
    static int custId=1118;
    static String password="121";
    static ArrayList<String> couponList= new ArrayList<>();
    public static void menu() throws Exception {
        Scanner sc = new Scanner(System.in);
        boolean exit = true;
        while (exit) {
            System.out.println("Welcome !! Navigate to: ");
            System.out.println("1. Admin Page ");
            System.out.println("2. Driver Page");
            System.out.println("3. User Page");
            System.out.print("Select: ");
            int ch = sc.nextInt();
            if (ch == 1) {
                System.out.print("Enter admin password: ");
                if (Objects.equals(sc.next(), password)) {
                    openApp();
                }
                else {
                    System.out.println("Failed!! ");
                }
            } else if (ch == 2) {
                DriverPage.Driver();
            }
            else if (ch == 3) {
                JFrame cust = new CustomerLoginPage("login");
                cust.setVisible(true);
                cust.setResizable(false);
            }
        }
    }
    public static void invoke1(){
        try {
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter trip id");
            int tripid =sc.nextInt();
            System.out.println("Enter booking id");
            int bookid =sc.nextInt();
            System.out.println("Enter enddate ");
            String time =sc.next();
            System.out.println("Enter endtime ");
            time=time.concat(" "+sc.next());
            System.out.println("Enter completion %");
            int comp =sc.nextInt();
            System.out.println("Enter payment id");
            int paymentid =sc.nextInt();
            System.out.println("Enter trip rating id");
            int triprate =sc.nextInt();
            System.out.println("Enter net distance id");
            int dist =sc.nextInt();
            try{
                //Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con= DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cab2","root","parveen");
                String sql = "insert into trip values(?,?,?,?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1,tripid);
                pst.setInt(2,bookid);
                pst.setString(3,time);
                pst.setInt(4,comp);
                pst.setString(5,"started");
                pst.setInt(6,paymentid);
                pst.setInt(7,triprate);
                pst.setInt(8,dist);
            if (paymentid==0){
                pst.setString(6,null);
            }

                int count = pst.executeUpdate();
                if (count>0){
                    System.out.println("Success");

                }
                else {
                    System.out.println("Failed");
                }

            }
            catch(Exception e){ System.out.println(e);}
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println("One or more field is empty or Invalid");
        }

    }

    public static void invoke2(){
        try {
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter user id");
            int userid =sc.nextInt();

            try{
                //Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con= DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cab2","root","parveen");
                String sql = "delete from customer where id = ?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1,userid);

                int count = pst.executeUpdate();
                if (count>0){
                    System.out.println("Success");

                }
                else {
                    System.out.println("Failed");
                }

            }
            catch(Exception e){ System.out.println(e);}
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println("One or more field is empty or Invalid");
        }

    }
    public static void olap1() throws Exception {
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            Statement stmt=con.createStatement();
            System.out.println("FORMAT : Type    Status   payment_count   payment_total   Unique_Customer");
            ResultSet rs=stmt.executeQuery("SELECT type,status, COUNT(*) AS payment_count, SUM(amount) AS payment_total, ( SELECT COUNT(DISTINCT id) FROM payment p2 WHERE p2.type = payment.type AND p2.status = payment.status ) AS unique_customers FROM payment GROUP BY type, status WITH ROLLUP;\n");
            while(rs.next())
                System.out.println(rs.getString(1)+"  "+rs.getString(2)+"   "+
                        rs.getString(3)+"   "+rs.getString(4)+"  "+rs.getString(5));
            con.close();
        }catch(Exception e){ System.out.println(e);}
    }
    public static void olap2() throws Exception {
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select type,SUM(Total) as ActualTotal , SUM(PriceT) as Potential, (SUM(PriceT) - SUM(Total)) as NetPotentialLoss \n" +
                    "from (SELECT coalesce(type,'Sub Total 1') as type, SUM(amount) as Total, SUM(price) as PriceT\n" +
                    "FROM  payment p1 inner join booking where booking.id =(Select bookingId from trip where paymentId = p1.id )\n" +
                    "GROUP BY type with rollup\n" +
                    "UNION ALL\n" +
                    "SELECT coalesce(p2.status,'Sub Total 2') as type, SUM(amount) as Total , SUM(price) as PriceT\n" +
                    "FROM payment p2 inner join booking where booking.id =(Select bookingId from trip where paymentId = p2.id ) \n" +
                    "GROUP BY p2.status with rollup)\n" +
                    "as t group by t.type with rollup;");
            System.out.println("FORMAT : Type  ActualTotal   Potential   NetPotentialLoss");
            while(rs.next())
                System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+
                        rs.getString(3)+" "+rs.getString(4));
            con.close();
        }catch(Exception e){ System.out.println(e);}
    }
    public static void olap3() throws Exception {
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select count(*) as NumberOfReports, custId from booking as b\n" +
                    "inner join report as t on b.id = t.bookingId \n" +
                    "group by custId with rollup order by count(*) desc;");
            System.out.println("FORMAT : NumberOfReports  custId ");
            while(rs.next())
                System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  ");
            con.close();
        }catch(Exception e){ System.out.println(e);}
    }
    public static void olap4() throws Exception {
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select count(*) as Count ,tripRating,c.id from customer as c \n" +
                    "inner join (select b.*,t.tripRating from booking as b \n" +
                    "inner join trip as t on b.id = t.bookingId ) as t1 on t1.custId=c.id \n" +
                    "group by tripRating,id with rollup; ");
            System.out.println("FORMAT : Count  tripRating  custId ");
            while(rs.next())
                System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+
                        rs.getString(3)+" ");
            con.close();
        }catch(Exception e){ System.out.println(e);}
    }
    public static void olap5() throws Exception {
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select t.custId, t.maxPrice, customer.firstName \n" +
                    "from customer inner join (select custId, max(price) as maxPrice \n" +
                    "from booking where status = 'success'\n" +
                    "group by (custId) with rollup) as t on customer.id = t.custId;");
            while(rs.next())
                System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+
                        rs.getString(3));
            con.close();
        }catch(Exception e){ System.out.println(e);}
    }

    public static void removeDriver() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Driver id: ");
        int id = sc.nextInt();
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql = "delete from driver where id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Done !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }
    }

    public static void removeCoupon() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Coupon id: ");
        String id = sc.next();
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql = "delete from coupon where id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Done !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }
    }

    public static void addCoupon() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Coupon id: ");
        String id = sc.next();
        System.out.print("Enter Discount %: ");
        int dis = sc.nextInt();
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql = "insert into coupon(id,discount) values (?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id);
            pst.setInt(2, dis);
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Done Added !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }
    }

    public static void addMoney() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Customer id: ");
        int id = sc.nextInt();
        System.out.print("Enter money to add: ");
        int dis = sc.nextInt();
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2", "root", "parveen");
            String sql = "update wallet set money= ( money + ?) where id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(2, id);
            pst.setString(1, String.valueOf(dis));
            int count = pst.executeUpdate();
            if (count>0){
                System.out.println("Done Added !");
            }
        }
        catch (Exception e) {
            System.out.println("Failed !");
        }
    }

    public static void changePass() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter new Password: ");
        String pass = sc.next();
        if (pass!=null){
            password=pass;
        }
    }

    public static void viewRequests() throws Exception {
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cab2","root","parveen");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from booking where status = 'waiting';");
            while(rs.next())
                System.out.println(rs.getString(1)+"  "+
                        rs.getString(2)+"  "+
                        rs.getString(3) +"  "+
                                rs.getString(4) +"  "+
                                rs.getString(5) +"  "+
                                rs.getString(6) +"  "+
                                rs.getString(7) +"  "+
                                rs.getString(8) +"  "+
                                rs.getString(9) +"  "+
                                rs.getString(10) +"  ");
            con.close();
        }catch(Exception e){ System.out.println(e);}
    }

    public static void openApp() throws Exception {
        Scanner sc = new Scanner(System.in);
        boolean exit = true;
        while (exit) {
            System.out.println("Welcome Admin");
            System.out.println("1. Insert Trip Details");
            System.out.println("2. Remove user account");
            System.out.println("3. Analyse payment details with customer count");
            System.out.println("4. Analyse overall Financial Status");
            System.out.println("5. Analyse user complaints");
            System.out.println("6. Analyse user trip rating feedbacks");
            System.out.println("7. Analyse users with maximum fare paid");
            System.out.println("8. Remove Driver");
            System.out.println("9. View pending requests");
            System.out.println("10. Add coupons");
            System.out.println("11. Remove Coupons");
            System.out.println("12. Add money to user wallet");
            System.out.println("13. Change Admin Password");
            System.out.println("14. Exit");
            System.out.print("Select: ");

            int ch = sc.nextInt();
            if (ch == 1) {
                invoke1();
            } else if (ch == 2) {
                invoke2();
            }
            else if (ch == 3) {
                olap1();
            }
            else if (ch == 4) {
                olap2();
            }
            else if (ch == 5) {
                olap3();
            }
            else if (ch == 6) {
                olap4();
            }
            else if (ch == 7) {
                olap5();
            }
            else if (ch == 8) {
                removeDriver();
            }
            else if (ch == 9) {
                viewRequests();
            }
            else if (ch == 10) {
                addCoupon();
            }
            else if (ch == 11) {
                removeCoupon();
            }
            else if (ch == 12) {
                addMoney();
            }
            else if (ch == 13) {
                changePass();
            }
            else if (ch == 14) {
                break;
            }
        }
    }

    public static void main(String args[]) throws Exception {
        menu();
    }
}
