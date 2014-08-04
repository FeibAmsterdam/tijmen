class FastEnemy extends Enemy {



	FastEnemy(PVector position){

        super(position);
		this.fillColor = color(0, 0, 255);
        // Start position
        // this.x = x;
        // this.y = y;
        this.speed = 30;


    }




     void draw(){
        fill(fillColor);
        ellipse(position.x, position.y, diameter, diameter);
    }
}

