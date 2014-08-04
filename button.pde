class Button extends GameObject {




	Button(PVector position){
		this.dimension = new PVector(50, 50);
        this.position = position.get();
        this.fillColor = color(0, 210, 0);
	}

	void update(float timeStep){
		//MOOIER MAKEN DOOR
 		if ((mouseX > position.x && < dimension.x) && (mouseY > position.y) && (InputHelper.leftMouseClicked)) println("woei knop");
	}


	void draw(){
		fill(fillColor);
		rect(position.x, position.y, dimension.x, dimension.y);
	}
}
