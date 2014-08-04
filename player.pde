class Player extends GameObject {

	float angle=0;
    float thrust = 100.0;
	Pencil pencil;

	Player(){
		this.fillColor = color(255, 0, 0);
        speed = 5;

        this.pencil = new Pencil(23);
	}

	void update(float timeStep){
        PVector dir = new PVector();

        velocity.set(0,0);

    	if (InputHelper.keysPressed[65]) dir.x += -1;
    	if (InputHelper.keysPressed[68]) dir.x += 1;
    	if (InputHelper.keysPressed[87]) dir.y += -1;
    	if (InputHelper.keysPressed[83]) dir.y += 1;

        dir.normalize();
        dir.mult(thrust);
        velocity.add(dir);
        position.add(PVector.mult(velocity, timeStep));

    	angle = atan2(position.y - crossHair.position.y, position.x - crossHair.position.x) + PI + PI/2;
	}

	void draw(){
		pushMatrix();
		translate(position.x,position.y);
		rotate(angle);
    	noFill();

		stroke(150,70);
		this.pencil.pline(new PVector(-diameter/2, diameter/2),
    		new PVector(0, -diameter/2), 2);
		this.pencil.pline(new PVector(0, -diameter/2),
    		new PVector(+diameter/2, diameter/2), 2);
		this.pencil.pline(new PVector(+diameter/2, diameter/2),
    		new PVector(-diameter/2, diameter/2), 2);

    	popMatrix();
	}
}
