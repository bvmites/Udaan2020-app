class Manager {
  String _name;
  String _phone;

  Manager(
    this._name,
    this._phone,
  );

  factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        json["name"],
        json["phone"],
      );

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
