class SlowEnemy extends Enemy {



	SlowEnemy(PVector position){
		super(position);
        this.fillColor = color(0, 255, 0);
        this.velocity = new PVector(random(0.0, 10.0), random(0.0, 10.0));
    }

    void draw(){
        fill(this.fillColor);
        ellipse(position.x, position.y, diameter, diameter);
    }


}
