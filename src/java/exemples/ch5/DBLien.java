
package exemples.ch5;

import exemples.ch5.messervlets.MesUtiliitairesDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class DBLien implements java.io.Serializable{
private Statement lien=null;

    public Statement getLien(Connection cnx) {
        if(construireStatement(cnx)){
            return lien;
        }else{
            return null;
        }
        
        //return lien;
    }
    
private boolean construireStatement(Connection cnx){
    boolean statusStatement =false;
    
    try{
        lien= cnx.createStatement();
        statusStatement=true;
        
    }catch(Exception exop){
        exop.printStackTrace();
    }
    
    
    return statusStatement;
}


public static Connection createConnection(){
     Connection con=null;
     String url = MesUtiliitairesDB.getMONURLDB();
     String username= MesUtiliitairesDB.getUSERNAMEDB();
     String password=MesUtiliitairesDB.getPASSWORDDB();
     try{
         try{
             Class.forName(MesUtiliitairesDB.getDRIVERDBMYSQL());
         }catch(ClassNotFoundException cnfe){
             cnfe.printStackTrace();
         }
         con= DriverManager.getConnection(url,username,password);
         System.out.println("Printing Connection Objet: "+con);
         
         
     }catch(Exception exop){
         exop.printStackTrace();
     }
     if(con!=null){
         System.out.println("Connection avec succés");
     }else{
         System.out.println("Pas de Connection a la DB");
     }
     return con;
        
        
    }

}
