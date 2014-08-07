GameObject crosshair;
Player player;
LevelLoader levelLoader;
Level currentLevel;
float timeStep;
int oldMillis;
String switchLevel = null;

void setup(){
	size(1280, 720, P2D);
	frameRate(120);

	frame.setTitle("Missing Impassable");
	textFont(loadFont("./assets/pencilgrid.vlw"));

	Level level1 = new Level();
	currentLevel = level1;

	levelLoader = new LevelLoader();
	levelLoader.loadLevel("./levels/level01", level1);
}

void draw(){
	timeStep = (millis() - oldMillis)/1000.0;
	oldMillis = millis();
	background(255,250,250);

	stroke(0);


	InputHelper.update();
	currentLevel.update();
	currentLevel.draw();

	if(switchLevel!= null) {
		Level level1 = new Level();
		levelLoader = new LevelLoader();
		levelLoader.loadLevel(switchLevel, level1);
		currentLevel = level1;
		switchLevel = null;
	}
}
