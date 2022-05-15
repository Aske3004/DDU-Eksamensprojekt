class Rectangle {
  PVector position;
  PVector size;
  PVector velocity;
  int id;
  String type;

  Rectangle(PVector pos, PVector siz, PVector vel, int id_, String typ) {
    position=pos;
    size=siz;
    velocity=vel;
    id=id_;
    type=typ;
  }
}
