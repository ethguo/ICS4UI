abstract class SceneObject extends JSONSerializable {
  public float albedo;

  SceneObject(float albedo) {
    this.albedo = albedo;
  }

  SceneObject(JSONObject j) {
    this.albedo = j.getFloat("albedo");
  }

  abstract float rayIntersect(Ray ray);
  abstract Vector3 getNormal(Vector3 point);
}