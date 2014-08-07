static class InputHelper {
  // Arrays of booleans. One for each key code
  static public boolean [] lastFrameKeysPressed = new boolean[256];
  static public boolean [] keysPressed = new boolean[256];

  static public boolean leftMousePressed = false;
  static public boolean centerMousePressed = false;
  static public boolean rightMousePressed = false;

  static public boolean lastLeftMousePressed = false;
  static public boolean lastCenterMousePressed = false;
  static public boolean lastRightMousePressed = false;

  static public boolean leftMouseClicked = false;
  static public boolean centerMouseClicked = false;
  static public boolean rightMouseClicked = false;

  static public boolean leftMouseReleased = false;
  static public boolean centerMouseReleased = false;
  static public boolean rightMouseReleased = false;

  // Call this method after each update in order to remember
  // which keys were pressed in the last frame
  static public void update() {

    for (int iKey=0; iKey<keysPressed.length; iKey++)
      lastFrameKeysPressed[iKey] = keysPressed[iKey];


    leftMouseClicked = !lastLeftMousePressed && leftMousePressed;
    rightMouseClicked = !lastRightMousePressed && rightMousePressed;
    centerMouseClicked = !lastCenterMousePressed && centerMousePressed;

    leftMouseReleased= lastLeftMousePressed && !leftMousePressed;
    rightMouseReleased = lastRightMousePressed && !rightMousePressed;
    centerMouseReleased = lastCenterMousePressed && !centerMousePressed;

    lastLeftMousePressed = leftMousePressed;
    lastRightMousePressed = rightMousePressed;
    lastCenterMousePressed = centerMousePressed;
  }
}

// keyPressed is a Processing specific "callback" method
// that gets called when a key is pressed
// Set the boolean at the index of "keyCode" to true
void keyPressed() {
  InputHelper.keysPressed[(keyCode == 0) ? key : keyCode] = true;
}

// keyPressed is a Processing specific "callback" method
// that gets called when a key is released
// Set the boolean at the index of "keyCode" to true
void keyReleased() {
  InputHelper.keysPressed[(keyCode == 0) ? key : keyCode] = false;
}

void mousePressed(){
  if (mouseButton == LEFT) InputHelper.leftMousePressed = true;
  if (mouseButton == CENTER) InputHelper.centerMousePressed = true;
  if (mouseButton == RIGHT) InputHelper.rightMousePressed = true;
}

void mouseReleased(){
  if (mouseButton == LEFT) InputHelper.leftMousePressed = false;
  if (mouseButton == CENTER) InputHelper.centerMousePressed = false;
  if (mouseButton == RIGHT) InputHelper.rightMousePressed = false;
}
