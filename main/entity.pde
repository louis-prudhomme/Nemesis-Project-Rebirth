/**
Base class for every in-game entity
*/
public abstract class Entity {
  float xpos, ypos;
  int radius;
  PImage sprite;
  // color of the visible hitbox 
  color hitboxColor;
  // overall speed of the entity (higher is faster)
  float swiftness;
  
  // constructor
  Entity(float x, float y, int r, PImage s, color hbColor, float sw){
    this.xpos = x;
    this.ypos = y;
    this.radius = r;
    this.sprite = s;
    this.hitboxColor = hbColor;
    this.swiftness = sw;
  }
  
  // tests if the present entity collides with another
  boolean isCollidingWith(Entity e) {
    return this.calculateRealDistance(e) < 0;
  }
  
  // calculates the distance between two entities
  float calculateDistance(Entity e){
    float distX = xpos - e.getX();
    float distY = ypos - e.getY();
    return sqrt(pow(distX, 2) + pow(distY, 2));
  }

  float calculateRealDistance(Entity e) {
    return this.calculateDistance(e) - radius / 2 - e.getRadius() / 2;
  }
  
  // draws the entity
  void sketch() {
    image(sprite, xpos, ypos);
    fill(hitboxColor);
    ellipse(xpos, ypos, radius, radius);
  }
  
  // forces all derived class to implement a method to update their state
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
