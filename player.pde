class Player extends GameObject {

	float angle=0;
    float thrust = 100.0;

	Player(){
		this.fillColor = color(255, 0, 0);
        speed = 5;
	}

	void update(float timeStep){
        PVector dir = new PVector();

		velocity.x = 0; // our object won't move
     	velocity.y = 0;

    	if (InputHelper.keysPressed[65]) dir.x += -1;
    	if (InputHelper.keysPressed[68]) dir.x += 1;
    	if (InputHelper.keysPressed[87]) dir.y += -1;
    	if (InputHelper.keysPressed[83]) dir.y += 1;

        dir.normalize();
        dir.mult(thrust);
        velocity.add(dir);
        position.add(PVector.mult(velocity, timeStep));

    	angle = atan2(position.y - mouseY, position.x - mouseX) + PI + PI/2;
	}

	void draw(){
		pushMatrix();
		translate(position.x,position.y);
		pushMatrix();
		rotate(angle);
		fill(fillColor);

    	triangle(-diameter/2, diameter/2,
    		0, -diameter/2,
    		+diameter/2, diameter/2);

    	popMatrix();
    	popMatrix();

    	noFill();
    	stroke(0, 200, 0);
    	strokeWeight(2);
    	pushMatrix();
    	translate(mouseX, mouseY);
    	ellipse(0, 0, 20, 20);
    	line(-12,0, 12, 0);
    	line(0, -12, 0, 12);
    	popMatrix();

	}
}
