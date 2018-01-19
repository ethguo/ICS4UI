abstract class Light extends JSONSerializable {
  public Vector3 colour;

  Light(color colour) {
    this.colour = new Vector3(colour);
  }

  Light(JSONObject j) {
    this.colour = new Vector3(j.getJSONObject("colour"));
  }

  abstract Vector3 getDirection(Vector3 point);
  abstract float getIntensity(Vector3 point);
}