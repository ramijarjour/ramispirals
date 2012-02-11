#import('dart:html');
#source('Tableau.dart');
#source('Boite.dart');

void main() {
  CanvasElement canvas = document.query('canvas');
  Tableau tableau = new Tableau(canvas);
}
