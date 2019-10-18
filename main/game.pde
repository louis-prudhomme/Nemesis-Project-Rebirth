import java.util.Map;

class Game {
    private static final int STARTING_GAME_STATE = 0;

    private main mein;
    private int currentState;
    private HashMap<Integer, IPanel> panels;
    private HashMap<Integer, Class<? extends IPanel>> desiredPanels;

    public Game(main m, HashMap<Integer, Class<? extends IPanel>> d) {
        this.currentState = STARTING_GAME_STATE;
        this.mein = m;
        this.desiredPanels = d;
        this.panels = new HashMap<Integer, IPanel>();

        this.initializePanels(m, desiredPanels);
    }

    public void display() {
        this.currentState = panels.get(currentState).display();
    }

    private void initializePanels(main m, HashMap<Integer, Class<? extends IPanel>> desiredPanels) {
        for (Integer state : desiredPanels.keySet()) {
            try {
                this.panels.put(state, desiredPanels.get(state).getConstructor(this.mein.getClass()).newInstance(mein));
            } catch (Exception e) {
                println("SQLALALA");
            }
        }
    }
}