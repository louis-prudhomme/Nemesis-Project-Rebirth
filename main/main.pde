Game g;
int timer;

void settings() {
  size(Game.WIDTH, Game.HEIGHT);
}

void setup() {
  imageMode(CENTER);
  frameRate(Game.FRAMERATE);
  noCursor();
  
  g = new Game();
  timer = 0;
}

void draw() {
  background(Game.BACKGROUND);
  g.update();
}
