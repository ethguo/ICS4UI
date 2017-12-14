/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:874154:
  appc.background(230);
} //_CODE_:window1:874154:

public void pauseButtonClicked(GButton source, GEvent event) { //_CODE_:pauseButton:575659:
  paused = !paused;
} //_CODE_:pauseButton:575659:

public void clearButtonClicked(GButton source, GEvent event) { //_CODE_:clearButton:665081:
  clearScreen();
} //_CODE_:clearButton:665081:

public void motionTypeMenuChanged(GDropList source, GEvent event) { //_CODE_:motionTypeMenu:536394:
  myMarker.motionType = motionTypeMenu.getSelectedText();
} //_CODE_:motionTypeMenu:536394:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 300, 300, JAVA2D);
  window1.noLoop();
  window1.addDrawHandler(this, "win_draw1");
  pauseButton = new GButton(window1, 13, 15, 80, 30);
  pauseButton.setText("Pause");
  pauseButton.addEventHandler(this, "pauseButtonClicked");
  clearButton = new GButton(window1, 10, 60, 80, 30);
  clearButton.setText("Clear screen");
  clearButton.addEventHandler(this, "clearButtonClicked");
  motionTypeMenu = new GDropList(window1, 10, 110, 90, 100, 4);
  motionTypeMenu.setItems(loadStrings("list_536394"), 0);
  motionTypeMenu.addEventHandler(this, "motionTypeMenuChanged");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton pauseButton; 
GButton clearButton; 
GDropList motionTypeMenu; 