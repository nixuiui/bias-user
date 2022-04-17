import 'dart:convert';

import 'package:bias_user/app/models/merchant.dart';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
    Order({
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
    Merchant? merchant;
    String? statusTransaction;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        cancelReason: json["cancelReason"],
        note: json["note"],
        totalBuy: json["totalBuy"],
        id: json["_id"],
        transactionCode: json["transactionCode"],
        user: json["user"],
        merchant: json["merchant"] != null ? Merchant.fromJson(json["merchant"]) : null,
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
        "merchant": merchant?.toJson(),
        "statusTransaction": statusTransaction,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}