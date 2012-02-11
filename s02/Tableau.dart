class Tableau {
  int x;
  int y;
  int hauteur;
  int largeur;
  CanvasRenderingContext2D context;
  Boite boite1;
  Boite boite2;
  Boite boite3;
  
Tableau(CanvasElement canvas){
  x = 0;
  y = 0;
  hauteur = canvas.height;
  largeur = canvas.width;
  context = canvas.getContext('2d');
  bordure();
  initialisation();
  document.window.setInterval(redessine, 1);
}
  
  void bordure(){
  context.beginPath();
  context.rect(0, 0, largeur, hauteur);
  context.stroke();
  context.closePath();
  }
  
  void initialisation(){
    boite1 = new Boite(this, 10, 10, 200, 200);
    boite2 = new Boite(this, 100, 100, 30, 20);
    boite3 = new Boite(this, 200, 200, 50, 50);
  }
      
  void clearRect(){
    context.beginPath();
    context.clearRect(0, 0, largeur, hauteur);
    context.stroke();
    context.closePath();
    bordure();
  }
  
  void redessine(){
    clearRect();
    boite1.dessineBoite();
    boite2.dessineBoite();
    boite3.dessineBoite();
  }
}