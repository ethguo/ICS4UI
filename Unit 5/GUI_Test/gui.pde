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

public void stick2_change1(GStick source, GEvent event) { //_CODE_:stick2:586330:
  xSpeed = source.getStickX();
  ySpeed = source.getStickY();
} //_CODE_:stick2:586330:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  stick2 = new GStick(this, 300, 300, 80, 80);
  stick2.setMode(G4P.X8);
  stick2.setOpaque(false);
  stick2.addEventHandler(this, "stick2_change1");
}

// Variable declarations 
// autogenerated do not edit
GStick stick2; 