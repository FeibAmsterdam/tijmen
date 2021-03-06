class Camera extends GameObject{

	PVector camOffset;


	Camera(PVector camOffset){
		this.camOffset = camOffset;
	}

	void update(float timeStep){
		if(player == null)
			return;
        position = PVector.add(PVector.mult(position, 0.8f), PVector.mult(player.position, .2f));

	    float hw = width*.5f;
	    float hh = height*.5f;

	   	float xfactor = (mouseX - hw) / hw;
	   	float yfactor = (mouseY - hh) / hh;
	   	position.x += 20*xfactor;
	   	position.y += 20*yfactor;
	}

    @Override
    boolean collidesWith(GameObject other) {
        return false;
    }

	PVector camPos(){
		return PVector.sub(position, camOffset);
	}

	void draw(){
	}

	PVector camToWorld(PVector v){
		return PVector.add(v, PVector.sub(position, camOffset));
	}

}
