class SlowEnemy extends Enemy {

    Pencil pencil;

	SlowEnemy(PVector position){
		super(position);
        this.fillColor = color(0, 255, 0);
        this.velocity = new PVector(random(0.0, 10.0), random(0.0, 10.0));
        this.pencil = new Pencil((int)(position.x*position.y));
    }

     void draw(){
        stroke(150,70);
        pencil.circle(new PVector(position.x, position.y), diameter);
    }


}
