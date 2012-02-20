class Boite {
  static final TPC = 6; //TPC = Tout Petit Carre // static = devient static a tous les objets (versus dynamique) et final et une constante.
  int x;
  int y;
  int hauteur;
  int largeur;
  Tableau tableau;
  bool carreSelectionne = false;
  
  Boite(this.tableau, this.x, this.y, this.largeur, this.hauteur){
    dessineBoite();
    document.on.mouseMove.add(mouseMove);
    document.on.mouseDown.add(mouseDown);
  }
  
  void dessineBoite(){
    tableau.context.beginPath();
    if(carreSelectionne){
      dessineTPC();//Tout Petit Carre
    }
    tableau.context.rect(x, y, largeur, hauteur);
    tableau.context.stroke();
    tableau.context.closePath();
  }

  void dessineTPC(){
    tableau.context.beginPath();
    tableau.context.rect(x, y, TPC, TPC);
    tableau.context.rect(x+largeur-TPC, y, TPC, TPC);
    tableau.context.rect(x, y+hauteur-TPC, TPC, TPC);
    tableau.context.rect(x+largeur-TPC, y+hauteur-TPC, TPC, TPC);
    tableau.context.stroke();
    tableau.context.closePath();
  }
  
  void mouseDown(MouseEvent evenement){
    if(sourisDansBoite(evenement.offsetX,evenement.offsetY)){
      carreSelectionne = !carreSelectionne; //inverse la valeur
    }
  }
  
  void mouseMove(MouseEvent evenement){
    if(carreSelectionne){
      if (sourisDansBoite(evenement.offsetX, evenement.offsetY)){
        x = evenement.offsetX - largeur/2;
        if (x < 0){
          x = 1;
        }
        if (x > tableau.largeur - largeur){
          x = tableau.largeur - largeur - 1;
        }
        y = evenement.offsetY - hauteur/2;
        if (y < 0){
          y = 1;
        }
        if (y > tableau.hauteur - hauteur){
          y = tableau.hauteur - hauteur - 1;
        }
      }
    }
  }
  
  bool sourisDansBoite(int px, int py){
    if (((px > x && px < (x + largeur)) && ((py > y) && py < y + hauteur))){
      return true;
    }
      
  }

}
