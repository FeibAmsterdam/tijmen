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

    this.position = new PVector();
    this.velocity = new PVector();
    this.acceleration = new PVector();
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

  void integrate(float timeStep){
    this.velocity.add(PVector.mult(this.acceleration, timeStep));
    this.position.add(PVector.mult(this.velocity, timeStep));
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
