class WaterTile extends Tile {



	WaterTile(PVector position){

        super(position);
       	this.fillColor = color(150, 150, 150 );
    }
    void draw(){
		pencil.fillColor = color(10, 30, 150);
        pencil.pfillrect(position, PVector.mult(dimension, .47f));

		pencil.strokeColor = color(10, 30, 150);
        pencil.prect(position, PVector.mult(dimension, .5f));
    }
}

