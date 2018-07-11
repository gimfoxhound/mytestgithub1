/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exemples.ch5.messervlets;

import exemples.ch5.DBConnexion;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author moustac
 */
@WebServlet(name = "EnregistrementLivres", urlPatterns = {"/EnregistrementLivres"})
public class EnregistrementLivres extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DBConnexion dbcnx = new DBConnexion();
        Connection cnx = dbcnx.getCnx();
  <jsp:useBean id="dbcnx" class="exemples.ch5.DBConnexion">
  
  dbcnx.setDriverjdbc(driverjdbc);
<jsp:setProperty name= "dbcnx" property="login" value="root"/>
<jsp:setProperty name= "dbcnx" property="password" value="0123456789"/>
<jsp:setProperty name= "dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name= "dbcnx" property="port" value="3306"/>
<jsp:setProperty name= "dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>

<jsp:useBean id="dblien" class="exemples.ch5.DBLien"/>

<html>
<body>
<table width=700><tr><td>
<h1><font face=arial>Sélection sur la table Livres</h1>
<h3><font face=arial>La connexion avec la base de données</h3>

<font face=arial size=2 color=black>1ère étape : Création d'une connexion vers la base de données :<br>
<%
  // Récupération de la connexion
  Connection cnx = dbcnx.getCnx();
  if (cnx == null) {
    out.println("<font color=red>Connexion impossible : " + cnx + "</font>");
  } else {
    out.println("<font color=green>Connexion établie : " + cnx + "</font>");
  }
%>
<br><br>
<font face=arial size=2 color=black>2ème étape : Création d'un tube de communication :<br>
<%
  // Création du tube de communication avec la base de données
  Statement lien = dblien.getLien(cnx);
  if (lien == null) {
    out.println("<font color=red>Communication impossible : "+ lien + "</font>");
  } else {
    out.println("<font color=green>Communication établie : " + lien + "</font>");
  }
%>

<!--Récuperer les données saisies dans le formulaire -->
<!--et les transmettre au composant Livre.java -->
<jsp:useBean id="livre" class="exemples.ch5.Livres"/>
<jsp:setProperty name="livre" property="titre"/>
<jsp:setProperty name="livre" property="categorie"/>
<jsp:setProperty name="livre" property="isbn" param="numero"/>
<jsp:setProperty name="livre" property="nomAuteur" param="nom"/>
<jsp:setProperty name="livre" property="prenomAuteur" param="prenom"/>
<html>
<body>
<!--et valider les données à l'aide du composant Livre.java -->
<h1><font face=arial>Validation d'un livre</h1>
<hr>

<h3><font face=arial>Le livre...</h3>
<table>
<tr>
   <td><font face=arial size=2>Titre : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="titre"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Catégorie : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="categorie"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Le numéro ISBN : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="isbn"/></td>
</tr>
<!--<tr>
   <td><font face=arial size=2 color=red>Le code d'enregistrement : </td>
   <td><font face=arial size=2 color=red>< jsp:getProperty name="livre" property="code" /></td>
</tr> --->
</table>
<h3><font face=arial>L'auteur...</h3>
<table>
<tr>
   <td><font face=arial size=2>Nom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="nomAuteur"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Prénom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="prenomAuteur"/></td>
</tr>
</table>
<!--Enregistrer les données dans la base de données -->
<%
  // Préparation de la requete
  String commande = "insert into livres (`LIV_NomAuteur`,`LIV_PrenomAuteur`,`LIV_Titre`, `LIV_Categorie`, `LIV_ISBN`) values('"+livre.getNomAuteur()+"','"+livre.getPrenomAuteur()+"','"+livre.getTitre()+"','"+livre.getCategorie()+"','"+livre.getIsbn()+"')";
  lien.executeUpdate(commande);
%>

<br>
<a href="afficherresultats.jsp">Retour à l'affichage</a>
<p>
<a href="index.html">Retour à l'index ?</a>    
</p>     
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
