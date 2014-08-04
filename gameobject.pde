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

    this.position = new PVector();
    this.position.x = width/2 - dimension.x/2;
    this.position.y = height/2;

    this.velocity = new PVector();
    this.velocity.x = 0;
    this.velocity.y = 0;
  }

  void update() {
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
