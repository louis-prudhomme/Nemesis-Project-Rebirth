class Shield extends Target implements IPlayer {
  static final int SHIELD_RADIUS = 70;
  static final color SHIELD_COLOR = #15317E;
  static final int SHIELD_LIFES = 5;

  Faust subject;
  
  Shield(Faust f) {
    super(f.getX(), f.getY(), SHIELD_RADIUS, null, SHIELD_COLOR, 
      SHIELD_LIFES, 0, 0);
      
    this.subject = f;
  }
  
  void update() {
     this.xpos = this.subject.getX();
     this.ypos = this.subject.getY();
  }
  
  @Override
  void sketch() {
    strokeWeight(this.lifes);
    noFill();
    stroke(this.hitboxColor);
    
    ellipse(xpos, ypos, radius, radius);
    strokeWeight(1);    
  }
}
