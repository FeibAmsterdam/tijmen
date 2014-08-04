GameObject player, fastEnemy, slowEnemy, coin;

ArrayList<GameObject> gameObjects;


void setup(){
	size(800, 600, P2D);


	gameObjects = new ArrayList<GameObject>();

	player = new Player();
	fastEnemy = new FastEnemy(new PVector(100, 100));
	slowEnemy = new SlowEnemy(new PVector(100, 100));
	coin = new GameObject();

	gameObjects.add(player);
	gameObjects.add(fastEnemy);
	gameObjects.add(coin);

	for (int i = 0; i < 30; ++i) {
		gameObjects.add(new SlowEnemy(new PVector(random(50)+100, random(0, 100)+100)));
	}


}

void draw(){
	background(0);

	for (int i = 0; i < gameObjects.size(); i++) {
		GameObject go = gameObjects.get(i);
		go.update();
		go.draw();
	}


}
