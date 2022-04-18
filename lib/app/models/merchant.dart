import 'dart:convert';

Merchant merchantFromJson(String str) => Merchant.fromJson(json.decode(str));

String merchantToJson(Merchant data) => json.encode(data.toJson());
List<Merchant> listMerchantFromJson(String str) => List<Merchant>.from(json.decode(str).map((x) => Merchant.fromJson(x)));
class Merchant {
    Merchant({
        this.password,
        this.address,
        this.phoneNumber,
        this.images,
        this.sold,
        this.isDeleted,
        this.balance,
        this.id,
        this.userName,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.token,
    });

    String? password;
    String? address;
    String? phoneNumber;
    List<dynamic>? images;
    int? sold;
    bool? isDeleted;
    int? balance;
    String? id;
    String? userName;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? token;

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        password: json["password"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        images: json["images"] != null 
            ? List<dynamic>.from(json["images"].map((x) => x))
            : [],
        sold: json["sold"],
        isDeleted: json["isDeleted"],
        balance: json["balance"],
        id: json["_id"],
        userName: json["userName"],
        name: json["name"] ?? json["fullName"],
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
        v: json["__v"],
        token: json["token"],
    );

  
    Map<String, dynamic> toJson() => {
        "password": password,
        "address": address,
        "phoneNumber": phoneNumber,
        "images": images != null ? List<dynamic>.from(images!.map((x) => x)) : [],
        "sold": sold,
        "isDeleted": isDeleted,
        "balance": balance,
        "_id": id,
        "userName": userName,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
    };
}
