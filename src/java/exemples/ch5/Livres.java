
package exemples.ch5;

import java.io.Serializable;


public class Livres implements Serializable{

private String titre;
private String categorie;
private String isbn;
private String nomAuteur;
private String prenomAuteur;
private String img;

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getNomAuteur() {
        return nomAuteur;
    }

    public void setNomAuteur(String nomAuteur) {
        this.nomAuteur = nomAuteur;
    }

    public String getPrenomAuteur() {
        return prenomAuteur;
    }

    public void setPrenomAuteur(String prenomAuteur) {
        this.prenomAuteur = prenomAuteur;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
  
  




}
