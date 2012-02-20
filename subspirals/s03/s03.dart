#import('dart:html');
#source('Boite.dart');
#source('Tableau.dart');

void main() {
  CanvasElement canvas = document.query('canvas');
  Tableau tableau = new Tableau(canvas);
}