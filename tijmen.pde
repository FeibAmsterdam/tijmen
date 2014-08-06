

GameObject player, crossHair;
LevelLoader levelLoader;
Level level1, level2, currentLevel;
float timeStep;
int oldMillis;

void setup(){
	size(1280, 720, P2D);
	frameRate(120);


	Level level1 = new Level();
	//Level level2 = new Level();
	levelLoader = new LevelLoader();
	levelLoader.loadLevel("./levels/test01.png", level1);
	//levelLoader.loadLevel("./levels/test02.png", level2);

	player = new Player();
	currentLevel = level1;




}

void draw(){
	timeStep = (millis() - oldMillis)/1000.0;
	oldMillis = millis();
	background(255,250,250);

	InputHelper.update();
	currentLevel.update();
	currentLevel.draw();



}



