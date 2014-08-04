GameObject player, fastEnemy, slowEnemy, coin;

void setup(){
	size(800, 600, P2D);

	player = new Player();
	fastEnemy = new FastEnemy(100, 100);
	slowEnemy = new SlowEnemy(100, 100);
	coin = new GameObject();
}

void draw(){
	background(0);

	player.update();
	fastEnemy.update();
	slowEnemy.update();
	coin.update();

	player.draw();
	fastEnemy.draw();
	slowEnemy.draw();
	coin.draw();
}
