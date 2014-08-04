class Tile extends GameObject {


	Tile(PVector position){
        // Start position
        this.position = position;
        this.dimension = new PVector(32, 32);

    }
     void draw(){
        fill(fillColor);
        rect(position.x, position.y, dimension.x, dimension.y);
    }
}
