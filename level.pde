class Level extends ArrayList<GameObject> {

	Camera cam;


	Level(){
		cam = new Camera(new PVector(width/2, height/2));
		this.add(cam);

		crossHair = new CrossHair();
		this.add(crossHair);

	}

		void update(){
				for (int i = 0; i < this.size(); i++) {
				GameObject go = this.get(i);
				go.update(timeStep);
			}

		}

		void draw(){

			pushMatrix();
			translate(-cam.camPos().x, -cam.camPos().y);
			for (int i = 0; i < this.size(); i++) {
				GameObject go = this.get(i);
				go.draw();
			}
			popMatrix();
		}




}
