class WallTile extends Tile {



	WallTile(PVector position){
        super(position);
		this.fillColor = color(150, 150, 150 );
    }


    void draw(){
		pencil.fillColor = color(150, 150, 150);
        pencil.pfillrect(position, PVector.mult(dimension, .47f));

		pencil.strokeColor = color(150);
        pencil.prect(position, PVector.mult(dimension, .5f));

    }
}

