class Player extends GameObject {

	float angle=0;
    float thrust = 50.0;
	Pencil pencil;
    float blinkTimer;
    float wobbleTimer;

	Player(){
        this.dimension = new PVector(25, 25);
		this.fillColor = color(255, 0, 0);

        blinkTimer = random(1,4);

        this.pencil = new Pencil(23);
	}

	void update(float timeStep){
        PVector dir = new PVector();

    	if (InputHelper.keysPressed[65]) dir.x += -1;
    	if (InputHelper.keysPressed[68]) dir.x += 1;
    	if (InputHelper.keysPressed[87]) dir.y += -1;
    	if (InputHelper.keysPressed[83]) dir.y += 1;

        dir.normalize();
        dir.mult(thrust);
        velocity.add(dir);
        position.add(PVector.mult(velocity, timeStep));
        velocity.mult(.85f);

        angle = atan2(this.velocity.y, this.velocity.x);

        blinkTimer -= timeStep;
        if(blinkTimer < 0) {
            if(random(0,1) < .5f) {
                blinkTimer = .45f;
            } else {
                blinkTimer = random(2, 4);
            }
        }

        wobbleTimer += timeStep * this.velocity.mag() * 0.01f;
	}

	void draw(){
		pushMatrix();
        {
    		translate(position.x,position.y);
            float speed = this.velocity.mag();
    		rotate(angle + (sin(wobbleTimer*4)*0.15f));
        	noFill();

    		stroke(150,70);

            PVector topleft = PVector.mult(this.dimension, -.5f);
            PVector bottomright = PVector.mult(this.dimension, .5f);
            PVector topright = topleft.get();
            topright.x *= -1f;
            PVector bottomleft = PVector.mult(topright, -1f);

            this.pencil.pline(topleft, topright);
            this.pencil.pline(topright, bottomright);
            this.pencil.pline(bottomright, bottomleft);
            this.pencil.pline(bottomleft, topleft);
            if(blinkTimer < .3f) {
                this.pencil.pline(new PVector(1, -5), new PVector(9, -5));
            } else {
                this.pencil.circle(new PVector(5, -5), 8);
            }
        }
    	popMatrix();
	}
}
