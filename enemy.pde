class Enemy extends GameObject {

    float damage;

	Enemy(){
        // Start position
        this.position = new PVector();

        this.velocity.x = random(-1.0, 1.0);
        this.velocity.y = random(-1.0, 1.0);
    }

    void update(float timeStep){

        position.add(PVector.mult(velocity, timeStep));

        // Detect wether the enemy bounces against the edges of the window
        // and change the direction if they do
        if ((position.x > width-diameter/2) || (position.x < diameter/2)) velocity.x = -velocity.x;
        if ((position.y > height-diameter/2) || (position.y < diameter/2)) velocity.y = -velocity.y;

    }

    void draw(){
        fill(fillColor);
        ellipse(position.x, position.y, diameter, diameter);
    }
}
