GameObject player, fastEnemy, slowEnemy, coin, tile;

ArrayList<GameObject> gameObjects;
float timeStep;
int oldMillis;

void setup(){
	size(800, 600, P2D);
	gameObjects = new ArrayList<GameObject>();

	player = new Player();
	//fastEnemy = new FastEnemy(new PVector(100, 100));
	//slowEnemy = new SlowEnemy(new PVector(100, 100));
	//coin = new GameObject();
	//tile = new

	gameObjects.add(player);
	gameObjects.add(new FastEnemy(new PVector(100, 100)));
	//gameObjects.add(new Coin);
	gameObjects.add(new WaterTile(new PVector(300, 300)));
	gameObjects.add(new BasicTile(new PVector(200, 300)));
	gameObjects.add(new SpikeTile(new PVector(100, 300)));
	gameObjects.add(new WallTile(new PVector(0, 300)));

	for (int i = 0; i < 30; ++i) {
		gameObjects.add(new SlowEnemy(new PVector(random(50)+100, random(0, 100)+100)));
	}


}

void draw(){
	background(0);
	timeStep = (millis() - oldMillis)/1000.0;
	oldMillis = millis();

	for (int i = 0; i < gameObjects.size(); i++) {
		GameObject go = gameObjects.get(i);
		go.update(timeStep);
	}

	for (int i = 0; i < gameObjects.size(); i++) {
		GameObject go = gameObjects.get(i);
		go.draw();
	}

}
