// Calculate the overlap of two objects in 1 dimensipn
float calculate1DOverlap(float x0, float x1, float w0, float w1) {
  float dl = x0+w0-x1, dr = x1+w1-x0;
  return (dr<0 || dl<0) ? 0 : (dr >= dl) ? -dl : dr;
}

// Determine whethertwo circles overlap
// NOTE: fast version: no sqrt() needed
boolean circleCircleOverlap(PVector p0, float r0, PVector p1, float r1) {
  float a = p0.x-p1.x, // horizontal distance between player and enemy
  		b = p0.y-p1.y, // vertical distance between player and enemy
  		c = a*a + b*b; // diagonal distance between player and enemy

  // if distance < radii combined, they overlap
  return c < (r0 + r1)*(r0 +r1);
}

PVector getObjectOverlap(GameObject go0, GameObject go1){

	return new PVector(calculate1DOverlap(go0.position.x, go1.position.x, go0.dimension.x, go1.dimension.x),
		  calculate1DOverlap(go0.position.y, go1.position.y, go0.dimension.y, go1.dimension.y));

}

PVector getCollisionResolveVector(GameObject go0, GameObject go1){
  PVector vector = getObjectOverlap(go0, go1);

  if ((abs(vector.x) > 0) && (abs(vector.y) > 0))
  {
    if (abs(vector.x) < abs(vector.y))
      vector.y = 0;
    else
      vector.x = 0;
  }
  else
    vector.set(0, 0);

  return vector;
}
