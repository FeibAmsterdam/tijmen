
class GrapplePickup extends GameObject
{
	boolean pickedUp = false;
	boolean doPickup = false;

	Pencil pencil;

	GrapplePickup() {
    	this.fillColor = color(0xed, 0xaa, 9);
    	pencil = new Pencil();
    	dimension = new PVector(48, 48);
    	redraw();
	}


	boolean collidesWith( GameObject other ) {
		return false;
	}

	void update(float timeStep) {
		if(!pickedUp && player.grapple != null) {
			if(((Grapple)player.grapple).hook!=null) {
				((Grapple)player.grapple).hook.destroyed = true;
			}
			player.grapple.destroyed = true;
			player.grapple = null;
		}
		if(doPickup){
			player.grapple = new Grapple();
			currentLevel.add(player.grapple);
			this.pickedUp = true;
			this.doPickup = false;
			this.destroyed = true;
		}
		super.update(timeStep);
	}

	void overlaps( GameObject other ) {
		if(other == player && !this.pickedUp) {
			doPickup = true;
		}
	}

    void draw(){
    	pushMatrix();
    	{
	    	translate(this.position.x-25, this.position.y-25);
	    	fill(0);
	    	image(pencil.context, 0, 0);
	    }
	    popMatrix();
    }

    void redraw(){
        pencil.context = createGraphics(50, 50);
		pencil.context.beginDraw();
 		pencil.context.background(0,0);
		pencil.context.smooth();
		pencil.context.pushMatrix();
		pencil.context.translate(25, 25);
		pencil.fillColor = this.fillColor;
        pencil.pfillrect(new PVector(0,0), PVector.mult(dimension, .47f));

		pencil.strokeColor = this.fillColor;
        pencil.prect(new PVector(0,0), PVector.mult(dimension, .5f));
		pencil.context.popMatrix();
		pencil.context.endDraw();
    }
}
