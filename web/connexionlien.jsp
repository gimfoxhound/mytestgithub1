<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de donn�es
#	Section : Un composant JavaBean communique avec MySql 
#	          Transmission de requ�tes entre un JSP et une base de donn�es
#
# 	Fichier : connexionLien.jsp
# 	Description : Se connecte et cr�e un tube de communication 
#	              avec la base de donn�es livrejsp
#	              nom de login et mot de passe par d�faut : jspuser 
#       JavaBeans : DBConnexion, DBLien (exemplesJSP/WEB-INF/classes/exemple/Ch5)
-->

<!-- La page JSP manipule des objets de type Connection et Statement -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<!--// DBConnexion Bean-->
<jsp:useBean id="dbcnx" class="exemples.ch5.DBConnexion">
<!--// Code d'initialisation //-->
<jsp:setProperty name= "dbcnx" property="login" value="root"/>
<jsp:setProperty name= "dbcnx" property="password" value="0123456789"/>
<jsp:setProperty name= "dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name= "dbcnx" property="port" value="3306"/>
<jsp:setProperty name= "dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>

<!--// DBLien Bean -->
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
</td></tr></table>
</body>
</html>
