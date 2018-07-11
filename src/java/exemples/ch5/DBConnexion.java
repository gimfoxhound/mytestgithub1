package exemples.ch5;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnexion implements java.io.Serializable{

    private String login;
    private String password;
    private String hostname;
    private String port;
    private String nomDeLaBase;
    private Connection cnx;
    private String driverjdbc;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getNomDeLaBase() {
        return nomDeLaBase;
    }

    public void setNomDeLaBase(String nomDeLaBase) {
        this.nomDeLaBase = nomDeLaBase;
    }

    public Connection getCnx() {
        if(etablirConnection()){
        return cnx;
        }else{
            return null;
        }
    }

    public String getDriverjdbc() {
        return driverjdbc;
    }

    public void setDriverjdbc(String driverjdbc) {
        this.driverjdbc = driverjdbc;
    }

    
    
    
    
    private String construireUrlJdbc(){
        String urlJdbc;
        urlJdbc = "jdbc:mysql://"+hostname+":"+port+"/"+nomDeLaBase;
        urlJdbc+="?user="+login+"&password="+password;
        return urlJdbc;
        
    }
    
    private boolean etablirConnection(){
        
        boolean statusConnection=false;
        String myUrl ="";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            myUrl = construireUrlJdbc();
            cnx=DriverManager.getConnection(myUrl);
            statusConnection=true;
            
        }catch(Exception exop){
            exop.printStackTrace();
        }
        
        
        return statusConnection;
    }
    
    

}
