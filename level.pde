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
			{
				strokeWeight(1);
				stroke(200, 220, 255, 150);
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
			translate(-cam.camPos().x, -cam.camPos().y);
			for (int i = 0; i < this.size(); i++) {
				GameObject go = this.get(i);
				go.draw();
			}
			popMatrix();
		}




}
