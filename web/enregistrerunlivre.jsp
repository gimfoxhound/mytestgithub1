<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de donn�es
#	Section : Consulter ou modifier une base de donn�es - modifier la base de donn�es
#
# 	Fichier : enregistrerUnLivre.jsp
# 	Description : Se connecte et cr�e un tube de communication 
#	              avec la base de donn�es livrejsp, et enregistre un livre 
#	              dont les attributs sont valid�s par le composant Livre.java
#	              nom de login et mot de passe par d�faut : jspuser 
# 	JavaBeans : DBConnexion, DBLien, Livre (exemplesJSP/WEB-INF/classes/exemple/Ch5)
-->


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<jsp:useBean id="dbcnx" class="exemples.ch5.DBConnexion">
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
<h1><font face=arial>S�lection sur la table Livres</h1>
<h3><font face=arial>La connexion avec la base de donn�es</h3>

<font face=arial size=2 color=black>1�re �tape : Cr�ation d'une connexion vers la base de donn�es :<br>
<%
  // R�cup�ration de la connexion
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

<!--R�cuperer les donn�es saisies dans le formulaire -->
<!--et les transmettre au composant Livre.java -->
<jsp:useBean id="livre" class="exemples.ch5.Livres"/>
<jsp:setProperty name="livre" property="titre"/>
<jsp:setProperty name="livre" property="categorie"/>
<jsp:setProperty name="livre" property="isbn" param="numero"/>
<jsp:setProperty name="livre" property="nomAuteur" param="nom"/>
<jsp:setProperty name="livre" property="prenomAuteur" param="prenom"/>
<html>
<body>
<!--et valider les donn�es � l'aide du composant Livre.java -->
<h1><font face=arial>Validation d'un livre</h1>
<hr>

<h3><font face=arial>Le livre...</h3>
<table>
<tr>
   <td><font face=arial size=2>Titre : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="titre"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Cat�gorie : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="categorie"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Le num�ro ISBN : </td>
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
   <td><font face=arial size=2>Pr�nom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name="livre" property="prenomAuteur"/></td>
</tr>
</table>
<!--Enregistrer les donn�es dans la base de donn�es -->
<%
  // Pr�paration de la requete
  String commande = "insert into livres (`LIV_NomAuteur`,`LIV_PrenomAuteur`,`LIV_Titre`, `LIV_Categorie`, `LIV_ISBN`) values('"+livre.getNomAuteur()+"','"+livre.getPrenomAuteur()+"','"+livre.getTitre()+"','"+livre.getCategorie()+"','"+livre.getIsbn()+"')";
  lien.executeUpdate(commande);
%>

<br>
<a href="afficherresultats.jsp">Retour � l'affichage</a>
<p>
<a href="index.html">Retour � l'index ?</a>    
</p>
</body>
</html>
