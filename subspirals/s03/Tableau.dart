class Tableau {
  int x;
  int y;
  int hauteur;
  int largeur;
  CanvasRenderingContext2D context;
  List<Boite> boites;
  
  Tableau(CanvasElement canvas){
  x = 0;
  y = 0;
  hauteur = canvas.height;
  largeur = canvas.width;
  context = canvas.getContext('2d');
  boites = new List();
  bordure();
  document.on.mouseDown.add(onMouseDown);
  document.window.setInterval(redessine, 1);//la base de temps est en ms;
  }
  
  void bordure(){
  context.beginPath();
  context.rect(0, 0, largeur, hauteur);
  context.stroke();
  context.closePath();
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
    for(Boite boitetemp in boites){
      boitetemp.dessineBoite();
    }
      
  }
  
  void onMouseDown(MouseEvent evenement){
    Boite boite = new Boite(this,evenement.offsetX,evenement.offsetY,50,50);
    bool nePasCreerBoite = false;
    if(evenement.offsetX > largeur - boite.largeur){
      boite.x = largeur - boite.largeur - 1;
    }
    if(evenement.offsetY > hauteur - boite.hauteur){
      boite.y = hauteur - boite.hauteur - 1;
    }
    for(Boite boitetemp in boites){
      if(boitetemp.sourisDansBoite(evenement.offsetX, evenement.offsetY)){
        nePasCreerBoite = true;
        break;
      }
    }
    if(!nePasCreerBoite){
      boites.add(boite);
    }
    
  }
}