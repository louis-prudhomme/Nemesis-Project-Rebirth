import java.util.Map;

Game game;

void settings() {
  size(Parameters.WIDTH, Parameters.HEIGHT);
}

void setup() {
  imageMode(CENTER);
  frameRate(Parameters.FRAMERATE);
  noCursor();
  
  HashMap<Integer, Class<? extends IPanel>> panels = new HashMap<Integer, Class<? extends IPanel>>();
  panels.put(GameState.PLAYING, Engine.class);
  game = new Game(this, panels);
}

void draw() {
  background(Parameters.BACKGROUND);
  game.display();
}