class CrossHair extends GameObject{

	void update(float timeStep){
		position = cam.camToWorld(new PVector(mouseX, mouseY));
	}

	void draw(){
    	noFill();
    	stroke(0, 200, 0);
    	strokeWeight(2);
    	pushMatrix();
    	translate(position.x, position.y);
    	ellipse(0, 0, 20, 20);
    	line(-12,0, 12, 0);
    	line(0, -12, 0, 12);
    	popMatrix();
	}
}
