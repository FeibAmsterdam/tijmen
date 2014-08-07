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
		hook.pencil.seed = (int)random(0,100);
	}

	public void draw(){
		pencil.pline(position, hook.position);
	}

	boolean collidesWith(GameObject other){
		return false;
	}
}

public class Hook extends GameObject{

	boolean isFlying, isHooked;

	Pencil pencil;
	float angle;

	public Hook(){
		isFlying = false;
		isHooked = false;
		initiatesCollision = true;
		unyielding = true;

		this.pencil = new Pencil();
	}

	void update(float timeStep) {
		if(this.velocity.mag() > 1) {
			angle = atan2(this.velocity.y, this.velocity.x);
		}
	}

	public void draw(){
		pushMatrix();
		{
			translate(position.x, position.y);
			rotate(angle);

			//text("hook", 0, 0);
			pencil.strokeColor = color(100);
			pencil.pline(-20, -10, 10, 0);
			pencil.pline(-20,  10, 10, 0);
			pencil.pline(0,  3, 10, 0);
			pencil.pline(0,  0, 10, 0);
			pencil.pline(0,  -3, 10, 0);
			pencil.pline(0,  3, 10, 0);
			pencil.pline(0,  0, 10, 0);
			pencil.pline(0,  -3, 10, 0);


			pencil.pline(-20, 10, -15, 5);
			pencil.pline(-15, 5,  -20, 0);
			pencil.pline(-20, 0 , -15, -5);
			pencil.pline(-15, -5, -20, -10);

		}
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
