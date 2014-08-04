GameObject player, enemy, coin;

void setup(){
	size(800, 600);

	player = new GameObject();
	enemy = new GameObject();
	coin = new GameObject();


}

void draw(){
	background(0);
	player.draw();
	enemy.draw();
	coin.draw();
}