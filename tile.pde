class Tile extends GameObject {

	Pencil pencil;
    int nTilesX = 1, nTilesY = 1;
    int tileSize = 32;

	Tile(){
        // Start position
        this.dimension = new PVector(tileSize, tileSize);
        pencil = new Pencil();
        unyielding = true;
    }

    void draw(){
        fill(fillColor);
        stroke(255,0,0);

        rect(position.x, position.y, dimension.x, dimension.y);
    }
}

