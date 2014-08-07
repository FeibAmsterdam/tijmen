public class Grapple extends GameObject {

	Hook hook = new Hook();
	float thrust = 1000.0f;
	Pencil pencil;
	PVector direction;

	public Grapple () {
		currentLevel.add(hook);
		pencil = new Pencil();
		this.direction = new PVector(1,0);
	}

	void fire(){
		this.direction = PVector.sub(crosshair.position, this.position);
		this.direction.normalize();

		hook.initiatesCollision = true;
		hook.isHooked = false;
		hook.position = this.position.get();
		hook.velocity = PVector.mult(this.direction, thrust);
	}

	public void draw(){
		pushMatrix();
		translate(position.x, position.y);
		fill(0);
		text("weapon", 0, 0);
		popMatrix();

		pencil.pline(position, hook.position);
	}

	boolean collidesWith(GameObject other){
		return false;
	}
}

public class Hook extends GameObject{

	boolean isFlying, isHooked;

	public Hook(){
		isFlying = false;
		isHooked = false;
		initiatesCollision = true;
		unyielding = true;
	}

	public void draw(){
		pushMatrix();
		translate(position.x, position.y);

		text("hook", 0, 0);
		fill(0, 0, 0, 100);
		rect(0, 0, dimension.x, dimension.y);

		popMatrix();
	}

	boolean collidesWith(GameObject other){
		if (!isHooked)
			if (other instanceof WallTile) return true;

		return false;
	}

	void collision(GameObject other, PVector interpenetration){
		this.velocity.set(0,0);
		this.initiatesCollision = false;
		isHooked = true;

	}

	void died(){
	}
}
