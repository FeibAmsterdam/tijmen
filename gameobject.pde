class GameObject {

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector dimension;

  float diameter;
  float mass;
  color fillColor;

  float speed;

  GameObject(){
    this.dimension = new PVector(20, 20);
    this.diameter = this.dimension.mag();
    this.fillColor = color(255, 255, 255);

    this.position = new PVector(width/2 - dimension.x/2, height/2);
    this.velocity = new PVector();

  }

  void update(float timeStep) {
  }

  void draw() {
    noStroke();
    fill(fillColor);

    pushMatrix();
    translate(this.position.x, this.position.y);

    triangle(-diameter/2, diameter/2,
             0, -diameter/2,
             diameter/2, diameter/2);

    popMatrix();
  }
}
