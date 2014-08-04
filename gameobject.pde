class GameObject {
 
  float x, y; 
  float vx, vy;
  float diameter;
  float h;
  float w;
  float mass;
  color fillColor;
  
  float speed = 5;
  
  GameObject(){
    this.diameter = 20;
    this.fillColor = color(255, 255, 255);
    this.x = width/2 - w/2; 
    this.y = height/2;

    this.vx = 0;
    this.vy = 0;
  }

  void update() {
  }

  
  void draw() {
    fill(fillColor);

    triangle(x-diameter/2, y+diameter/2, 
    x, y-diameter/2, 
    x+diameter/2, y+diameter/2);
  }
}
