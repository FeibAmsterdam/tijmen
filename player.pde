class Player extends GameObject {

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
	}
}
