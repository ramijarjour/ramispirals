class Boite {
  int x;
  int y;
  int hauteur;
  int largeur;
  Tableau tableau;
  
  Boite(this.tableau, this.x, this.y, this.largeur, this.hauteur){
    dessineBoite();
    document.on.mouseMove.add(mouseMove);
  }
  void dessineBoite(){
    tableau.context.beginPath();
    tableau.context.rect(x, y, largeur, hauteur);
    tableau.context.stroke();
    tableau.context.closePath();
  }
  
  void mouseMove(MouseEvent evenement){
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
  
  bool sourisDansBoite(int px, int py){
    if (((px > x && px < (x + largeur)) && ((py > y) && py < y + hauteur))){
      return true;
    }
      
  }

}
