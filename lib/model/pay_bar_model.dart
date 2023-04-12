// To parse this JSON data, do
//
//     final payBarModel = payBarModelFromJson(jsonString);

import 'dart:convert';

PayBarModel payBarModelFromJson(String str) => PayBarModel.fromJson(json.decode(str));

String payBarModelToJson(PayBarModel data) => json.encode(data.toJson());

class PayBarModel {
  PayBarModel({
    required this.ticket,
  });

  Ticket ticket;

  factory PayBarModel.fromJson(Map<String, dynamic> json) => PayBarModel(
    ticket: Ticket.fromJson(json["ticket"]),
  );

  Map<String, dynamic> toJson() => {
    "ticket": ticket.toJson(),
  };
}

class Ticket {
  Ticket({
    required this.scaninfo,
    required this.notpaid,
    required this.notpaidtext,
    required this.status,
  });

  bool scaninfo;
  bool notpaid;
  String notpaidtext;
  Status status;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    scaninfo: json["scaninfo"],
    notpaid: json["notpaid"],
    notpaidtext: json["notpaidtext"],
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "scaninfo": scaninfo,
    "notpaid": notpaid,
    "notpaidtext": notpaidtext,
    "status": status.toJson(),
  };
}

class Status {
  Status({
    required this.text,
    required this.success,
  });

  String text;
  bool success;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    text: json["text"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "success": success,
  };
}
