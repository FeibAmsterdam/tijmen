class Button extends GameObject {

	Button(){
		this.position = new PVector();
		this.dimension = new PVector(50, 50);
        this.fillColor = color(0, 210, 0);
	}

	void update(float timeStep){
		//MOOIER MAKEN DOOR pos en dim te verwerken in de statement
 		if ((mouseX > position.x) && (mouseY > position.y) && (InputHelper.leftMouseClicked)) println("woei knop");
	}


	void draw(){
		fill(fillColor);
		rect(position.x, position.y, dimension.x, dimension.y);
	}
}
