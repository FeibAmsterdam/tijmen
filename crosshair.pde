class Crosshair extends GameObject{

    Pencil pencil;

    Crosshair() {
        this.pencil = new Pencil();
        pencil.context = createGraphics(40, 40);
        pencil.context.beginDraw();
        pencil.context.background(0,0);
        pencil.context.smooth();
        pencil.context.pushMatrix();
        pencil.context.translate(20, 20);
        this.redraw();
        pencil.context.popMatrix();
        pencil.context.endDraw();

        noCursor();
    }

	void update(float timeStep){
		position = currentLevel.cam.camToWorld(new PVector(mouseX, mouseY));
	}

    @Override
    boolean collidesWith(GameObject other) {
        return false;
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
    	pushMatrix();
        {
            pencil.strokeColor = color(160);
            pencil.circle(new PVector(0,0), 20);
            pencil.pline(new PVector(0,-15), new PVector(0,15));
            pencil.pline(new PVector(-15,0), new PVector(15, 0));
            pencil.context.stroke(155, 150);
            pencil.context.line(0, -15, 0, 15);
            pencil.context.line(-15, 0, 15, 0);
        }
    	popMatrix();
	}
}
