<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de données
#	Section : Un composant JavaBean communique avec MySql 
#	          Transmission de requêtes entre un JSP et une base de données
#
# 	Fichier : connexionLien.jsp
# 	Description : Se connecte et crée un tube de communication 
#	              avec la base de données livrejsp
#	              nom de login et mot de passe par défaut : jspuser 
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
</td></tr></table>
</body>
</html>
