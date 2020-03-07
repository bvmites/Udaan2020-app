import 'EventDetail.dart';
import 'Tech.dart';
import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

class Event {
  Tech _tech;
  List<EventDetail> _nonTech;
  List<EventDetail> _workshop;
  List<EventDetail> _cultural;
  List<EventDetail> _star;

  Event eventFromJson(String str) => Event.fromJson(json.decode(str));
  Event(this._tech, this._nonTech, this._workshop, this._cultural, this._star);

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        Tech.fromJson(json["tech"]),
        List<EventDetail>.from(
            json["non-tech"].map((x) => EventDetail.fromJson(x))),
        List<EventDetail>.from(json["workshop"].map((x) => x)),
        List<EventDetail>.from(
            json["cultural"].map((x) => EventDetail.fromJson(x))),
        List<EventDetail>.from(
            json["star"].map((x) => EventDetail.fromJson(x))),
      );

  List<EventDetail> get star => _star;

  set star(List<EventDetail> value) {
    _star = value;
  }

  List<EventDetail> get cultural => _cultural;

  set cultural(List<EventDetail> value) {
    _cultural = value;
  }

  List<EventDetail> get workshop => _workshop;

  set workshop(List<EventDetail> value) {
    _workshop = value;
  }

  List<EventDetail> get nonTech => _nonTech;

  set nonTech(List<EventDetail> value) {
    _nonTech = value;
  }

  Tech get tech => _tech;

  set tech(Tech value) {
    _tech = value;
  }
}
