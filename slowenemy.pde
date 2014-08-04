class SlowEnemy extends Enemy {



	SlowEnemy(float x, float y){
		super(x, y);
        this.fillColor = color(0, 255, 0);
        // Start position
        // this.x = x;
        // this.y = y;
        this.speed = 100;


    }



     void draw(){
        fill(this.fillColor);
        ellipse(x, y, diameter, diameter);
    }
}

