class Camera extends GameObject{

	PVector camOffset;
	float thrust = 100;

	Camera(PVector camOffset){
		this.camOffset = camOffset;
	}

	void update(float timeStep){
		PVector dir = new PVector();
		velocity.set(0,0);

    	if (InputHelper.keysPressed[LEFT]) dir.x += -1;
    	if (InputHelper.keysPressed[RIGHT]) dir.x += 1;
    	if (InputHelper.keysPressed[UP]) dir.y += -1;
    	if (InputHelper.keysPressed[DOWN]) dir.y += 1;

        dir.normalize();
        dir.mult(thrust);
        velocity.add(dir);
        position.add(PVector.mult(velocity, timeStep));
	}

	PVector camPos(){
		return PVector.sub(position, camOffset);
	}

	void draw(){
		fillColor = color(30);
		ellipse(position.x, position.y, 5, 5);
	}

	PVector camToWorld(PVector v){
		return PVector.add(v, PVector.sub(position, camOffset));
	}

}
