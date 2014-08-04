GameObject player, enemy, coin;

void setup(){
	size(800, 600, P2D);

	player = new Player();
	enemy = new GameObject();
	coin = new GameObject();
}

void draw(){
	background(0);

	player.update();
	enemy.update();
	coin.update();

	player.draw();
	enemy.draw();
	coin.draw();
}
