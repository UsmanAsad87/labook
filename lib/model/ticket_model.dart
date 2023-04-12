// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) => TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  TicketModel({
    required this.ticket,
    required this.success,
  });

  Ticket ticket;
  bool success;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    ticket: Ticket.fromJson(json["ticket"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "ticket": ticket.toJson(),
    "success": success,
  };
}

class Ticket {
  Ticket({
    required this.status,
    required this.tId,
    required this.rNummer,
    required this.name,
    required this.veranstaltung,
    required this.event,
    required this.isAddon,
    required this.preis,
    required this.notpaid,
    required this.notpaidtext,
    required this.scaninfo,
  });

  Status status;
  String tId;
  String rNummer;
  String name;
  String veranstaltung;
  String event;
  bool isAddon;
  String preis;
  bool notpaid;
  String notpaidtext;
  String scaninfo;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    status: Status.fromJson(json["status"]),
    tId: json["tID"]??"",
    rNummer: json["RNummer"]??"",
    name: json["name"]??"",
    veranstaltung: json["veranstaltung"]??"",
    event: json["event"]??"",
    isAddon: json["isAddon"]??false,
    preis: json["preis"]??"",
    notpaid: json["notpaid"]??false,
    notpaidtext: json["notpaidtext"]??"",
    scaninfo: json["scaninfo"]??"",
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "tID": tId,
    "RNummer": rNummer,
    "name": name,
    "veranstaltung": veranstaltung,
    "event": event,
    "isAddon": isAddon,
    "preis": preis,
    "notpaid": notpaid,
    "notpaidtext": notpaidtext,
    "scaninfo": scaninfo,
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
