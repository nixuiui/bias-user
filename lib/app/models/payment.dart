import 'dart:convert';

List<Payment> paymentFromJson(String str) => List<Payment>.from(json.decode(str).map((x) => Payment.fromJson(x)));

String paymentToJson(List<Payment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payment {
    Payment({
      this.cancelReason,
      this.note,
      this.totalBuy,
      this.id,
      this.transactionCode,
      this.user,
      this.merchant,
      this.statusTransaction,
      this.createdAt,
      this.updatedAt,
      this.v,
    });

    String? cancelReason;
    String? note;
    int? totalBuy;
    String? id;
    String? transactionCode;
    String? user;
    String? merchant;
    String? statusTransaction;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        cancelReason: json["cancelReason"],
        note: json["note"],
        totalBuy: json["totalBuy"],
        id: json["_id"],
        transactionCode: json["transactionCode"],
        user: json["user"],
        merchant: json["merchant"] ,
        statusTransaction: json["statusTransaction"],
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "cancelReason": cancelReason,
        "note": note,
        "totalBuy": totalBuy,
        "_id": id,
        "transactionCode": transactionCode,
        "user": user,
        "merchant": merchant,
        "statusTransaction": statusTransaction,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}