Engine e;

void settings() {
  size(Parameters.WIDTH, Parameters.HEIGHT);
}

void setup() {
  imageMode(CENTER);
  frameRate(Parameters.FRAMERATE);
  noCursor();
  
  e = new Engine();
}

void draw() {
  background(Parameters.BACKGROUND);
  e.update();
}