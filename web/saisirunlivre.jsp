<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de données
#	Section : Consulter ou modifier une base de données - modifier la base de données
#
# 	Fichier : saisirUnLivre.jsp
# 	Description : Affiche le formulaire pour saisir les informations nécessaires
#                     à l'enregistrement d'un livre dans la base de données
-->

<html>
<body>
<h1><font face=arial>Enregistrement d'un livre</h1>
<hr>
<form name=enregistrement action="enregistrerunlivre.jsp" method=POST>
<h3><font face=arial>Le livre...</h3>
<table>
<tr>
   <td><font face=arial size=2>Titre : </td>
   <td><input type=texte name=titre size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Catégorie : </td>
   <td><select name=categorie>
      <option value="Policier"><font face=arial size=2>Policier</option>
      <option value="Roman"><font face=arial size=2>Roman</option>
      <option value="Junior"><font face=arial size=2>Junior</option>
      <option value="Philosophie"><font face=arial size=2>Philosophie</option>
      <option value="Science-fiction"><font face=arial size=2>Sciences-fiction</option>
      <option value="Science-fiction"><font face=arial size=2>Document-Guerre</option>
   </select></td>
</tr>
<tr>
   <td><font face=arial size=2>Le numéro ISBN : </td>
   <td><input type=texte name=numero size=20></td>
</tr>
</table>
<h3><font face=arial>L'auteur...</h3>
<table>
<tr>
   <td><font face=arial size=2>Nom : </td>
   <td><input type=texte name=nom size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Prénom : </td>
   <td><input type=texte name=prenom size=20></td>
</tr>
</table>
<input type=submit value=valider>
</form>

</body>
</html>
