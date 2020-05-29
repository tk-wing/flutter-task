abstract class BaseEntity {
  int _id;
  int get id => _id;
  set id(int id) => _id = id;

  BaseEntity({id}):
    this._id = id;
}
