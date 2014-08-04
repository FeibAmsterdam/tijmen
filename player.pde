class Player extends GameObject {

	float angle=0;

	Player(){
		this.fillColor = color(255, 0, 0);
	}

	void update(){
		vx = 0; // our object won't move
     	vy = 0;

    	if (keysPressed[LEFT]) vx = -1;
    	if (keysPressed[RIGHT]) vx = 1;
    	if (keysPressed[UP]) vy = -1;
    	if (keysPressed[DOWN]) vy = 1;


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
	}
}
