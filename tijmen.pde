GameObject player, crosshair;
LevelLoader levelLoader;
Level level1, level2, currentLevel;
float timeStep;
int oldMillis;

void setup(){
	size(1280, 720, P2D);
	frameRate(120);

	frame.setTitle("Tijmen");

	Level level1 = new Level();
	currentLevel = level1;

	levelLoader = new LevelLoader();
	levelLoader.loadLevel("./levels/level01", level1);


}

void draw(){
	timeStep = (millis() - oldMillis)/1000.0;
	oldMillis = millis();
	background(255,250,250);

	InputHelper.update();
	currentLevel.update();
	currentLevel.draw();
}
