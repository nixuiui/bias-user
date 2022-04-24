import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
      this.id,
      this.fullName,
      this.userName,
      this.password,
      this.phoneNumber,
      this.balance,
      this.role,
      this.token,
      this.division,
    });

    String? id;
    String? fullName;
    String? userName;
    String? password;
    String? phoneNumber;
    String? role;
    int? balance;
    String? token;
    String? division;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        userName: json["userName"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        division: json["division"],
        balance: json["balance"],
        role: json["role"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "userName": userName,
        "password": password,
        "phoneNumber": phoneNumber,
        "balance": balance,
        "division": division,
        "role": role,
        "token": token,
    };
}
