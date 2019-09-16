// attacks from the ennemies (boss…)
class Shot extends Projectile {
  float initialX;
  int type;
    
  Shot(float x, float y, Class t, PImage s, int sw, int ty) {
    super(x, y, s, t, sw);
    this.initialX = x;
    this.type = ty;
  }
  
  void update() {
    float dy = 0;
    switch(this.type) {
      case ShotTypes.STRAIGHT:
        dy = this.swiftness;
        break;
      case ShotTypes.WAVVY:
        dy = this.swiftness;
        this.xpos = this.initialX + cos(ypos * 5) * 20;
        break;
      default:
        text("SQALALA!", Parameters.WIDTH / 2, Parameters.HEIGHT / 2);
    }
    this.ypos += dy * (this.target == IPlayer.class ? Parameters.GAME_SPEED : -Parameters.GAME_SPEED);
  }
  
  void hit(Target t) {
    t.gotHit();
  }
  
  
  // draws the entity
  void sketch() {
    image(sprite, xpos, ypos);
    fill(hitboxColor);
    ellipse(xpos, ypos, radius, radius);
  }
}
