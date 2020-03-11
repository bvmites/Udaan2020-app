import 'Manager.dart';

class EventDetail {
  var _id;
  List _participants;
  var _prizeMoney;
  var _entryFee;
  var _eventName;
  List _managers;
  List _rounds;
  var _tagline;
  var _teamSize;
  var _objective;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  EventDetail(
      this._id,
      this._participants,
      this._prizeMoney,
      this._entryFee,
      this._eventName,
      this._managers,
      this._rounds,
      this._tagline,
      this._teamSize,
      this._objective);

  factory EventDetail.fromJson(Map<String, dynamic> json) => EventDetail(
        json["id"],
        List<String>.from(json["participants"].map((x) => x)),
        json["prizeMoney"],
        json["entryFee"],
        json["eventName"],
        List<Manager>.from(json["managers"].map((x) => Manager.fromJson(x))),
        List<String>.from(json["rounds"].map((x) => x)),
        json["tagline"],
        json["teamSize"],
        json["outcome"],
      );

  List<String> get participants => _participants;

  String get objective => _objective;

  set objective(String value) {
    _objective = value;
  }

  int get teamSize => _teamSize;

  set teamSize(int value) {
    _teamSize = value;
  }

  String get tagline => _tagline;

  set tagline(String value) {
    _tagline = value;
  }

  List<String> get rounds => _rounds;

  set rounds(List<String> value) {
    _rounds = value;
  }

  List<Manager> get managers => _managers;

  set managers(List<Manager> value) {
    _managers = value;
  }

  String get eventName => _eventName;

  set eventName(String value) {
    _eventName = value;
  }

  int get entryFee => _entryFee;

  set entryFee(int value) {
    _entryFee = value;
  }

  int get prizeMoney => _prizeMoney;

  set prizeMoney(int value) {
    _prizeMoney = value;
  }

  set participants(List<String> value) {
    _participants = value;
  }
}
