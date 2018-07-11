<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de donn�es
#	Section : Consulter ou modifier une base de donn�es - consulter la base de donn�es
#
# 	Fichier : afficherResultat.jsp
# 	Description : Affiche le contenu de la table livres 
#       JavaBeans : DBConnexion, DBLien (exemplesJSP/WEB-INF/classes/exemple/Ch5)
-->

<!-- Cette page JSP manipule des objets Connection et Statement -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>


<jsp:useBean id="dbcnx" class="exemples.ch5.DBConnexion">
<jsp:setProperty name="dbcnx" property="login" value="root"/>
<jsp:setProperty name="dbcnx" property="password" value="0123456789"/>
<jsp:setProperty name="dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name="dbcnx" property="port" value="3306"/>
<jsp:setProperty name="dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>

<jsp:useBean id="dblien" class="exemples.ch5.DBLien"/>

<html>
<body>
<table width=700><tr><td>
<h1><font face=arial>S�lection sur la table Livres</h1>

<h3><font face=arial>La connexion avec la base de donn�es</h3>

<font face=arial size=2 color=black>1�re �tape : Cr�ation d'une connexion vers la base de donn�es :<br>
<%
  // R�cupation de la connexion
  Connection cnx = dbcnx.getCnx();
  if (cnx == null) {
    out.println("<font color=red>Connexion impossible : " + cnx + "</font>");
  } else {
    out.println("<font color=green>Connexion �tablie : " + cnx + "</font>");
  }
%>
<br><br>
<font face=arial size=2 color=black>2�me �tape : Cr�ation d'un tube de communication :<br>
<%
  // Cr�ation du tube de communication avec la base de donn�es
  Statement lien = dblien.getLien(cnx);
  if (lien == null) {
    out.println("<font color=red>Communication impossible : "+ lien + "</font>");
  } else {
    out.println("<font color=green>Communication �tablie : " + lien + "</font>");
  }
%>
<h3><font face=arial>L'ex�cution des requ�tes</h3>
<font face=arial size=2><b>La requ�te de s�lection des livres : </b><br>
<%
  // Construction de la requ�te
  String commande="select * from livres";
  out.println("Requ�te 1 : <font face=arial size=2 color=green>" + commande + "</font>");

  // Ex�cution de la requ�te
  ResultSet rs;
  rs=lien.executeQuery(commande);
%>
<br>
<br>
<font face=arial size=2><b>La construction d'un objet r�sultat</b><br>
<font face=arial size=2 color=black>Affectation des r�sultats de la requ�te dans un objet ResultSet :<br>
<%
  // On construit le lien vers la base de donn�es
  if (rs==null) {
    out.println("<font color=red>Pas de r�sultat : "+rs+"</font>");
  } else {
    out.println("<font color=green>OK : "+rs+"</font>");
  }
%>
<br><br>

<font face=arial size=2><b>Le tableau r�sultat</b><br>
<font face=arial size=2 color=black>Parcours des r�sultats de la requ�te dans un objet ResultSet :<br>
<table width=700 border=1>
<tr>
  
  <td><font face=arial size=2 color=red><b>Prenom Auteur</b></td>
    <td><font face=arial size=2 color=red><b>Nom Auteur</b></td>  
  <td><font face=arial size=2 color=red><b>Titre</b></td>
  <td><font face=arial size=2 color=red><b>Categorie</b></td>
  <td><font face=arial size=2 color=red><b>ISBN</b></td>
</tr>
<%
  while (rs.next()) {
    out.println("<tr>");    
    
    out.println("  <td><font face=arial size=2>"+ rs.getString("LIV_PrenomAuteur")+"</td>");
    out.println("  <td><font face=arial size=2>"+ rs.getString("LIV_NomAuteur") + "</td>");
    out.println("  <td><font face=arial size=2>"+ rs.getString("LIV_Titre")+ "</td>");
    out.println("  <td><font face=arial size=2>"+ rs.getString("LIV_Categorie") +"</td>");
    out.println("  <td><font face=arial size=2>"+ rs.getString("LIV_ISBN") +"</td>");
    out.println("</tr>");
  }
%>
</td></tr></table>
<br>
<p>
<a href="saisirunlivre.jsp">Enregistrez un livre ? </a>
</p>
<p>
<a href="index.html">Retour � l'index ?</a>    
</p>
</body>
</html>
