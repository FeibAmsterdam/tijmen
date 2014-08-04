class SlowEnemy extends Enemy {



	SlowEnemy(PVector position){
		super(position);
        this.fillColor = color(0, 255, 0);
        // Start position
        // this.x = x;
        // this.y = y;
        this.speed = 10;


    }



     void draw(){
        fill(this.fillColor);
        ellipse(position.x, position.y, diameter, diameter);
    }


}
