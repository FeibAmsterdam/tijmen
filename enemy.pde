class Enemy extends GameObject {

    float damage;

	Enemy(float x, float y){
        // Start position
        this.x = x;
        this.y = y;
        vx = random(-1.0, 1.0);
        vy = random(-1.0, 1.0);

    }

    void update(){

    	// Update our position using the velocity
    	x += vx * speed;
    	y += vy * speed;

         // Detect wether the enemy bounces against the edges of the window
        // and change the direction if they do
        if ((x > width-diameter/2) || (x < diameter/2)) vx = -vx;
        if ((y > height-diameter/2) || (y < diameter/2)) vy = -vy;

    }
     void draw(){
        fill(fillColor);
        ellipse(x, y, diameter, diameter);
    }
}

