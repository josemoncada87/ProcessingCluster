public class Cluster {

  HashSet<PVector> puntos;
  PVector promedio;
  color tono;
  int id;

  public Cluster(PVector inicial, int id) {
    puntos = new HashSet<PVector>();
    promedio = new PVector(inicial.x, inicial.y);
    puntos.add(inicial);
    tono = color(255);
    switch(id) {
    case 0 :
      tono = color (100, 255, 80);
      break;
    case 1 :
      tono = color (255, 0, 0);
      break;
    case 2 :
      tono = color (255, 0, 255);
      break;
    case 3 :
      tono = color (255, 255, 0);
      break;
    case 4 :
      tono = color (0, 255, 255);
      break;
    case 5 :
      tono = color (255, 100, 50);
      break;
    }
    this.id = id;
  }

  public boolean add(PVector nuevo) {      
    if ( promedio.dist(nuevo) < 210  ) {      
      if ( puntos.add(nuevo)) {
        int x = 0;
        int y = 0;    
        int cant = 0;
        Iterator<PVector> iter = puntos.iterator();
        while (iter.hasNext ()) {
          PVector t = iter.next();
          x+= t.x;
          y+= t.y;
          cant++;
        }
        promedio.x = x/cant;
        promedio.y = y/cant;
        return true;
      }
      else {
        puntos.remove(nuevo);
      }
    }    
    return false;
  }

  public void pintar() {
    /**/
    /*Iterator iter = puntos.iterator();
    fill(tono);
    while (iter.hasNext ()) {
      PVector t = (PVector)iter.next();      
      ellipse(t.x, t.y, 2, 2);
    }  */
    stroke(tono);
    noFill();
    ellipse(promedio.x, promedio.y, constrain(puntos.size(), 0, width/4), constrain(puntos.size(), 0, width/4));
    noStroke();
     fill(255);
     rect(promedio.x, promedio.y, 10, 10);
    fill(255, 255, 0);
    text(""+id, promedio.x-5, promedio.y+5 );
  }
} // clase

