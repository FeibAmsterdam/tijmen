class Player extends GameObject {

	float angle=0;

	Player(){
		this.fillColor = color(255, 0, 0);
	}

	void update(){
		vx = 0; // our object won't move
     	vy = 0;

    	if (InputHelper.keysPressed[65]) vx = -1;
    	if (InputHelper.keysPressed[68]) vx = 1;
    	if (InputHelper.keysPressed[87]) vy = -1;
    	if (InputHelper.keysPressed[83]) vy = 1;

    	// Update our position using the velocity
    	x += vx * speed;
    	y += vy * speed;

    	angle = atan2(y - mouseY, x - mouseX) + PI + PI/2;
	}

	void draw(){
		pushMatrix();
		translate(x,y);
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
