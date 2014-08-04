<<<<<<< HEAD
GameObject player, fastEnemy, slowEnemy, coin, tile;
=======

Camera cam;
GameObject player, fastEnemy, slowEnemy, coin;
>>>>>>> Adds Tile and sub Tile classes. Adds Tiles in Main array list

ArrayList<GameObject> gameObjects;
float timeStep;
int oldMillis;

void setup(){
	size(800, 600, P2D);
	gameObjects = new ArrayList<GameObject>();

	player = new Player();

	gameObjects.add(player);
	gameObjects.add(new FastEnemy(new PVector(100, 100)));
	gameObjects.add(new WaterTile(new PVector(300, 300)));
	gameObjects.add(new BasicTile(new PVector(200, 300)));
	gameObjects.add(new SpikeTile(new PVector(100, 300)));
	gameObjects.add(new WallTile(new PVector(0, 300)));

	for (int i = 0; i < 5; ++i) {
		gameObjects.add(new SlowEnemy(new PVector(random(50)+100, random(0, 100)+100)));
	}

	cam = new Camera(new PVector(width/2, height/2));
	gameObjects.add(cam);


}

void draw(){
	timeStep = (millis() - oldMillis)/1000.0;
	oldMillis = millis();
	background(255,250,250);

	for (int i = 0; i < gameObjects.size(); i++) {
		GameObject go = gameObjects.get(i);
		go.update(timeStep);
	}

	pushMatrix();
	translate(-cam.camPos().x, -cam.camPos().y);
	for (int i = 0; i < gameObjects.size(); i++) {
		GameObject go = gameObjects.get(i);
		go.draw();
	}
	popMatrix();

}
