class Ray {
  Vector3 origin;
  Vector3 direction;

  Ray(Vector3 origin, Vector3 direction) {
    this.origin = origin;
    this.direction = direction;
  }

  String toString() {
    return this.origin.toString() + " + t" + this.direction.toString();
  }
}