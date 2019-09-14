public abstract class Entity {
  float xpos, ypos;
  int radius;
  PImage sprite;
  color hitboxColor;
  
  Entity(float x, float y, int r, PImage s, color hbColor){
    xpos = x;
    ypos = y;
    radius = r;
    sprite = s;
    hitboxColor = hbColor;
  }
  
  boolean isCollidingWith(Entity e){
     float distReal = calculateDistance(e.getX(), e.getY()) - radius - e.getRadius();
     if(distReal < 0) {
       return true;
     } else {
       return false;
     }
  }
  
  float calculateDistance(float x, float y){
     float distX = xpos - x;
     float distY = ypos - y;
     return sqrt(pow(distX, 2) + pow(distY, 2));
  }
  
  void sketch() {
    image(sprite, xpos, ypos);
    fill(hitboxColor);
    ellipse(xpos, ypos, radius, radius);
  }
  
  abstract void update();
  
  float getX() {return xpos;}
  float getY() {return ypos;}
  int getRadius() {return radius;}
    
  void setX(float x) {xpos = x;}
  void setY(float y) {ypos = y;}
  void setRadius(int r) {radius = r;}
  void setSprite(PImage s) {sprite = s;}
  void setHitboxColor(color hbColor) {hitboxColor = hbColor;}
}
