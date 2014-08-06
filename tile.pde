class Tile extends GameObject {

	Pencil pencil;

	Tile(){
        // Start position
        this.dimension = new PVector(32, 32);
        pencil = new Pencil();
    }

    void draw(){
        fill(fillColor);
        stroke(255,0,0);
        rect(position.x, position.y, dimension.x, dimension.y);
    }
}

