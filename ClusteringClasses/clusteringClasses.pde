import java.util.HashSet;
import java.util.Iterator;

/// clustering
ArrayList<PVector> elementos;
ArrayList<Cluster> grupos;
int cantidad = 48000;

void setup() {  
  size(800, 800);
  rectMode(CENTER);
  elementos = new ArrayList<PVector>();  
  for (int i = 0 ; i < cantidad ; i++) {   
    elementos.add( new PVector(random(50, width-50), random(50, height-50)) );    
    /*elementos.add( new PVector(random(50,300), random(100, 300)));
     elementos.add( new PVector(random(50,300), random(450, 750))); 
     elementos.add( new PVector(random(450,700), random(50, 300)));
     elementos.add( new PVector(random(450,700), random(450, 750))); */
  }
  grupos = new ArrayList<Cluster>();  
  noStroke();
}

void draw() {
  background(0);     
  Cluster grupoInicial = new Cluster(elementos.get(0), 0); 
  grupos.add(grupoInicial);  
  for (int i = 1 ; i < elementos.size() ; i+=25) {     
    PVector actual = elementos.get(i);    
    boolean presente = false;
    for (int grupo = 0 ; grupo < grupos.size() ; grupo++ ) {
      Cluster grupoActual = grupos.get(grupo);      
      if (grupoActual.add(actual)) {
        presente = true;
        break;
      }
    }
    if (!presente) {
      Cluster nuevoGrupo = new Cluster(actual, grupos.size()); 
      grupos.add(nuevoGrupo);
    }
  }
  for (int grupo = 0 ; grupo < grupos.size() ; grupo++ ) {     
    Cluster grupoActual = grupos.get(grupo);
    grupoActual.pintar();
  }  

  //int tFinal = millis() - tini;
  //println("en un total de: "+tFinal+" ms");
  grupos.clear();
  fill(255);
  text("FPS: " + (int)frameRate +" | Cantidad de puntos: " + elementos.size(), 10, 25);
 //mousePressed();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    //println("0");
    elementos.clear();
    for (int i = 0 ; i < cantidad ; i++) {   
      elementos.add( new PVector(random(50, width-50), random(50, height-50)) );
    }
  }
  else {
    //println("1");
    elementos.clear();
    for (int i = 0 ; i < cantidad/4 ; i++) {   
      elementos.add( new PVector(random(50, 300), random(100, 300)));
      elementos.add( new PVector(random(50, 300), random(450, 750))); 
      elementos.add( new PVector(random(450, 700), random(100, 300)));
      elementos.add( new PVector(random(450, 700), random(450, 750)));
    }
  }
}

