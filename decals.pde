
class Text extends GameObject {
	String text;
	color fillcolor;
	int size;
	float offset;
	Text() {
		this.fillcolor = color(150);
		this.size = 42;
		this.offset = 13;
	}

	boolean collidesWith( GameObject other ) {
		return false;
	}

	void parseArgs(String args) {
		this.text = args;
	}

	void draw() {
		if(this.text == null ) {
			return;
		}
		pushMatrix();
		{
			translate(this.position.x, this.position.y+this.offset);
			textSize(this.size);
			fill(this.fillcolor, 180);
			text(this.text, 0, 0);
		}
		popMatrix();
	}
}

class TextRed extends Text {
	TextRed() {
		this.fillcolor = color(150, 0, 0);
	}
}
class TextSmall extends Text {
	TextSmall() {
		this.size = 32;
		this.offset = 10;
	}
}

class Arrow extends GameObject {

	Pencil pencil;
	float angle;
	Arrow() {
       	this.fillColor = color(140);
        pencil = new Pencil();
		this.redraw();
	}

	void parseArgs(String args) {
		try {
			this.angle = Float.parseFloat(args);
			this.redraw();
		} catch(Exception e) {
		}
	}

	boolean collidesWith( GameObject other ) {
		return false;
	}

    void draw() {
    	pushMatrix();
    	{
	    	translate(this.position.x-50, this.position.y-50);
	    	fill(0);
	    	image(pencil.context, 0, 0);
	    }
	    popMatrix();
    }

    void redraw(){
        pencil.context = createGraphics(100, 100);
		pencil.context.beginDraw();
 		pencil.context.background(0,0);
		pencil.context.smooth();
		pencil.context.pushMatrix();
		pencil.context.translate(50, 50);
		pencil.context.rotate(this.angle);
		pencil.fillColor = this.fillColor;
		pencil.strokeColor = this.fillColor;

        pencil.pfillrect(new PVector(5,0), new PVector(35, 10));

        pencil.pline(new PVector(-30,13), new PVector(30,12));
        pencil.pline(new PVector(-30,-13), new PVector(30,-12));
        pencil.pline(new PVector(10,-30), new PVector(50,0));
        pencil.pline(new PVector(10,30), new PVector(50,0));
        pencil.pline(new PVector(10,-30), new PVector(50,0));
        pencil.pline(new PVector(10,30), new PVector(50,0));
		pencil.context.popMatrix();
		pencil.context.endDraw();
    }

}
