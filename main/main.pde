Game g;

void settings() {
  size(Game.WIDTH, Game.HEIGHT);
}

void setup() {
  imageMode(CENTER);
  frameRate(Game.FRAMERATE);
  g = new Game();
}

void draw() {
  background(Game.BACKGROUND);
  g.update();
}
