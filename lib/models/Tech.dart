import 'EventDetail.dart';

class Tech {
  List<EventDetail> ce;
  List<EventDetail> cpit;
  List<EventDetail> mepr;
  List<EventDetail> ecel;
  List<EventDetail> ee;

  Tech(this.ce, this.cpit, this.mepr, this.ecel, this.ee);

  factory Tech.fromJson(Map<String, dynamic> json) => Tech(
        List<EventDetail>.from(json["ce"].map((x) => EventDetail.fromJson(x))),
        List<EventDetail>.from(
            json["cpit"].map((x) => EventDetail.fromJson(x))),
        List<EventDetail>.from(
            json["mepr"].map((x) => EventDetail.fromJson(x))),
        List<EventDetail>.from(
            json["ecel"].map((x) => EventDetail.fromJson(x))),
        List<EventDetail>.from(json["ee"].map((x) => EventDetail.fromJson(x))),
      );
}
