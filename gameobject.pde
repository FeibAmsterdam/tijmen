class GameObject {

  boolean destroyed = false;
  float health = 100;

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector dimension;

  float diameter;
  float mass;
  color fillColor;

  float speed;

  boolean initiatesCollision = false;
  boolean unyielding = false;

  GameObject(){
    this.dimension = new PVector(20, 20);
    this.diameter = this.dimension.mag();
    this.fillColor = color(255, 255, 255);

    this.position = new PVector(width/2 - dimension.x/2, height/2);
    this.velocity = new PVector();

  }

  void parseArgs(String args) {
  }

  boolean collidesWith( GameObject other ) {
    return true;
  }

  void overlaps( GameObject other ) {
  }

  void collision( GameObject other, PVector interpenetration ) {
  }

  void update(float timeStep) {
    if(health <= 0) {
      this.died();
    }
  }

  void draw() {
    pushMatrix();

    translate(this.position.x, this.position.y);
    fill(0);
    text(getClass().getSimpleName(), 0, 0);
    noStroke();
    fill(fillColor);

    triangle(-diameter/2, diameter/2,
             0, -diameter/2,
             diameter/2, diameter/2);

    popMatrix();
  }

  void died() {
    destroyed = true;
  }
}
