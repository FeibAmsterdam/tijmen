class Weapon extends GameObject {

	PVector direction;


	Weapon(){

	}

	void update(float timeStep){
		this.direction = PVector.sub(crosshair.position, this.position);
		this.direction.normalize();
	}

	void draw(){
		pushMatrix();
		translate(position.x, position.y);
		fill(0);
		text("weapon", 0, 0);
		popMatrix();

	}

	void fire(){

	}

	boolean collidesWith(GameObject other){
		return false;
	}
}

public class Gun extends Weapon{

	public Gun () {
	}

	void fire(){
		currentLevel.add(new SlowEnemy());
	}
}

public class Grapple extends Weapon{

	Hook hook = new Hook();
	float thrust = 1000.0f;
	Pencil pencil;

	public Grapple () {
		currentLevel.add(hook);
		pencil = new Pencil();
	}

	void fire(){
		hook.position = this.position.get();
		hook.velocity = PVector.mult(this.direction, thrust);
	}

	public void draw(){
		pencil.pline(position, hook.position);
	}

}

public class Hook extends GameObject{

	public Hook(){
	}

	public void update(float timeStep){
		position.add(PVector.mult(velocity, timeStep));
	}

	public void draw(){
		pushMatrix();
		translate(position.x, position.y);
		text("hook", 0, 0);
		popMatrix();
	}

boolean collidesWith(GameObject other){
		return false;
	}

}
