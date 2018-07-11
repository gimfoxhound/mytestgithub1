
package exemples.ch5.messervlets;


public class MesUtiliitairesDB {
private static final String   MONURLDB = "jdbc:mysql://localhost:3306/sakila";
private static final String   USERNAMEDB= "root";
private static final String   PASSWORDDB="0123456789";
private static final String   DRIVERDBMYSQL="com.mysql.jdbc.Driver";


    public static String getUSERNAMEDB() {
        return USERNAMEDB;
    }

    public static String getPASSWORDDB() {
        return PASSWORDDB;
    }

    public static String getDRIVERDBMYSQL() {
        return DRIVERDBMYSQL;
    }

    public static String getMONURLDB() {
        return MONURLDB;
    }




    
}
