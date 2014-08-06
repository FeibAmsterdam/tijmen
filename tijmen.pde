GameObject player, crossHair;
LevelLoader levelLoader;
Level level1, level2, currentLevel;
float timeStep;
int oldMillis;

void setup(){
	size(1280, 720, P2D);
	frameRate(120);
	frame.setTitle("Tijmen");

	Level level1 = new Level();


	levelLoader = new LevelLoader();
	levelLoader.loadLevel("./levels/level01", level1);

	currentLevel = level1;

	// player = new Player();
	// currentLevel.add(player);
	// player.position.add(new PVector(100, 100));
	// currentLevel.add(new WallTile());
}

void draw(){
	timeStep = (millis() - oldMillis)/1000.0;
	oldMillis = millis();
	background(255,250,250);

	InputHelper.update();
	currentLevel.update();
	currentLevel.draw();
}
