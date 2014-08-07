class Level extends ArrayList<GameObject> {

	Camera cam;
	int integrationSteps = 2;

	Level(){
		cam = new Camera(new PVector(width/2, height/2));
		this.add(cam);

		crosshair = new Crosshair();
		this.add(crosshair);
	}

	void resolveCollisions(){
		for (GameObject go : this){
			for(GameObject other : this) {
				if (go != other && (go.initiatesCollision || other.initiatesCollision)){
					PVector collisionVector = getCollisionResolveVector(go, other);
					if(collisionVector != null) {
						if(go.collidesWith(other) && other.collidesWith(go)) {
							go.collision(other, collisionVector);
							if(!other.unyielding) {
								other.position.sub(PVector.mult(collisionVector, 1.10f));
							}
						} else {
							go.overlaps(other);
						}
					}
				}
			}
		}
	}

	void update(){
		for (int i = 0; i < this.size(); i++) {
			GameObject go = this.get(i);
			go.update(timeStep);
				if(go.destroyed) {
					this.remove(go);
					i--;
				}
		}

		for (int i=0; i<integrationSteps; i++){
			for (GameObject go : this){
				go.integrate(timeStep/integrationSteps);
			}

			resolveCollisions();
		}


	}

	void draw(){

		pushMatrix();
		{
			strokeWeight(1);
			stroke(200, 220, 255);
			translate(-cam.camPos().x%32, -cam.camPos().y%32);
			for(int x = -16; x < width+32; x += 32) {
				line(x, -32, x, height+32);
			}
			for(int y = -16; y < height+32; y += 32) {
				line(-32, y, width+32, y);
			}
		}
		popMatrix();


		pushMatrix();
		{
			translate(-cam.camPos().x, -cam.camPos().y);
			for (int i = 0; i < this.size(); i++) {
				GameObject go = this.get(i);
				go.draw();
			}
		}
		popMatrix();
	}

}
