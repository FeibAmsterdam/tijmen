
class GrapplePickup extends GameObject
{
	boolean pickedUp = false;
	boolean doPickup = false;

	GrapplePickup() {
    	this.fillColor = color(0, 255, 255);
	}


	boolean collidesWith( GameObject other ) {
		return false;
	}

	void update(float timeStep) {
		if(!pickedUp && player.grapple != null) {
			((Grapple)player.grapple).hook.destroyed = true;
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

	void draw() {
		super.draw();
	}

}
