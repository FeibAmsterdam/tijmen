class FastEnemy extends Enemy {



	FastEnemy(float x, float y){

        super(x, y);
		this.fillColor = color(0, 0, 255);
        // Start position
        // this.x = x;
        // this.y = y;
        this.speed = 10;


    }




     void draw(){
        fill(fillColor);
        ellipse(x, y, diameter, diameter);
    }
}

