class FastEnemy extends Enemy {

	FastEnemy(){
		this.fillColor = color(0, 0, 255);
        this.velocity = new PVector(random(20.0, 30.0), random(20.0, 30.0));
    }

    void draw(){
        fill(fillColor);
        ellipse(position.x, position.y, diameter, diameter);
    }
}

