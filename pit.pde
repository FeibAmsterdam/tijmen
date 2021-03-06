class Pit extends Tile {

	Pit(){
       	this.fillColor = color(200, 10, 0);
		this.redraw();
    }

    @Override
    boolean collidesWith( GameObject other ) {
        if( other == player ) {
            return !player.isFlying;
        }
        return true;
    }

    void collision( GameObject other, PVector interpenetration ) {
    	if(other == player) {
    		player.health -= 1e10;
    	}
    }

    void draw(){
    	pushMatrix();
    	{
	    	translate(this.position.x-20, this.position.y-20);
	    	fill(0);
	    	image(pencil.context, 0, 0);
	    }
	    popMatrix();
    }

    void redraw(){
        pencil.context = createGraphics(40, 40);
		pencil.context.beginDraw();
 		pencil.context.background(0,0);
		pencil.context.smooth();
		pencil.context.pushMatrix();
		pencil.context.translate(20, 20);
		pencil.fillColor = this.fillColor;
        pencil.pfillrect(new PVector(0,0), PVector.mult(dimension, .47f));

		pencil.strokeColor = this.fillColor;
        pencil.prect(new PVector(0,0), PVector.mult(dimension, .5f));
		pencil.context.popMatrix();
		pencil.context.endDraw();
    }
}
