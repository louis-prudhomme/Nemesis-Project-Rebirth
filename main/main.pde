Engine e;

void settings() {
  size(Parameters.WIDTH, Parameters.HEIGHT);
}

float x1, y1;
float x2, y2;
float radius;
void setup() {
  imageMode(CENTER);
  frameRate(Parameters.FRAMERATE);
  noCursor();
  
  e = new Engine();
  x1 = 30;
  x2 = 30;
  y1 = 30;
  y2 = 50;
  
  radius = 50;
}

void draw() {
  background(Parameters.BACKGROUND);
  //e.update();
  
  ellipse(x1, y1, radius, radius);
  ellipse(x2, y2, radius, radius);
  
  
   float distX = x1 - x2;
   float distY = y1 - y2;
   text(sqrt(pow(distX, 2) + pow(distY, 2)), width / 2, height / 2);
   text(sqrt(pow(distX, 2) + pow(distY, 2)) - radius * 2, width / 2, height / 2 + 30);
   text(radius, width / 2, height / 2 + 60);
   
   if(keyPressed) {
    x1 = random(width);
    x2 = random(width);
    y1 = random(height);
    y2 = random(height);
   }
   
   if(mousePressed) {
     
      radius = random(30);
   }
}
