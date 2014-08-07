class Player extends GameObject {

	float angle=0;
    float thrust = 50.0;
	Pencil pencil;
    float blinkTimer;
    float wobbleTimer;
    float flipTimer;
    PVector direction = new PVector(1,0);
    boolean flipped = false;

    Grapple grapple;

	Player(){
        this.dimension = new PVector(25, 25);
		this.fillColor = color(255, 0, 0);
        initiatesCollision = true;

        blinkTimer = random(1,4);

        this.pencil = new Pencil(23);

        this.grapple = new Grapple();
        currentLevel.add(grapple);
	}

	void update(float timeStep){
        PVector dir = new PVector();

        if (grapple != null){
            grapple.position = this.position.get();
            if (InputHelper.leftMouseClicked)
                grapple.fire();
        }

    	if (InputHelper.keysPressed[65]) dir.x += -1;
    	if (InputHelper.keysPressed[68]) dir.x += 1;
    	if (InputHelper.keysPressed[87]) dir.y += -1;
    	if (InputHelper.keysPressed[83]) dir.y += 1;

        dir.normalize();
        dir.mult(thrust);
        velocity.add(dir);
        //position.add(PVector.mult(velocity, timeStep));
        velocity.mult(.85f);

        direction.mult(0.8f);
        dir = velocity.get();
        dir.normalize();
        direction.add(PVector.mult(dir, 0.2f));
        angle = atan2(this.direction.y, this.direction.x);

        boolean was = flipped;
        if(angle <- PI/2 || angle > PI/2 ) {
            flipped = true;
        } else {
            flipped = false;
        }
        if(was != flipped) {
            flipTimer = .3f;
        }
        flipTimer -= timeStep;

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

            float a = angle;
            boolean flipped = false;
            if(a<-PI/2) {
                flipped = true;
                a += PI;
            } else if(a>PI/2) {
                flipped = true;
                a -= PI;
            }
            a = max(-.6f, min(a, .6f));

    		rotate(a + (sin(wobbleTimer*4)*0.15f));
        	noFill();

    		stroke(150,70);

            float flipScale = 1;
            if(flipTimer >0) {
                flipScale = abs(flipTimer - 0.15f)/0.15f;
            }
            if(flipped)
                flipScale *= -1;
            PVector halfSize = PVector.mult(this.dimension, .5f);
            halfSize.x *= abs(flipScale);
            this.pencil.prect(new PVector(0,0), halfSize);
            if(blinkTimer < .3f) {
                this.pencil.pline(new PVector(1*flipScale, -5), new PVector(9*flipScale, -5));
            } else {
                this.pencil.circle(new PVector(5*flipScale, -5), 8);
            }
        }
    	popMatrix();
	}
}
