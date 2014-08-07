class WaterTile extends Tile {

	WaterTile(){

       	this.fillColor = color(10, 30, 150);
        pencil.context = createGraphics(40, 40);
        pencil.context.beginDraw();
        pencil.context.background(0,0);
        pencil.context.smooth();
        pencil.context.pushMatrix();
        pencil.context.translate(20, 20);
        this.redraw();
        pencil.context.popMatrix();
        pencil.context.endDraw();
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

    @Override
    boolean collidesWith( GameObject other ) {
        if( other == player ) {
            return !(player.grapple!=null&&player.grapple.hook!=null&player.grapple.hook.isHooked);
        }
        return true;
    }

    void redraw(){
		pencil.fillColor = this.fillColor;
        pencil.pfillrect(new PVector(0,0), PVector.mult(dimension, .47f));

		pencil.strokeColor = this.fillColor;
        pencil.prect(new PVector(0,0), PVector.mult(dimension, .5f));
    }

}

