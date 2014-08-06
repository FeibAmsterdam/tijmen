class WallTile extends Tile {

	WallTile(){
		this.fillColor = color(150);
		this.redraw();
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

class BreakableWall extends WallTile {
	BreakableWall() {
		this.fillColor = color(180, 170, 150);
		this.redraw();
	}
}
