
class LoginModel {
    String? message;
    LoginBody? body;
    int? statusCode;

    LoginModel({
        this.message,
        this.body,
        this.statusCode,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        body: json["body"] == null ? null : LoginBody.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
    };
}

class LoginBody {
    int? id;
    String? username;
    String? token;

    LoginBody({
        this.id,
        this.username,
        this.token,
    });

    factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
        id: json["id"],
        username: json["username"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "token": token,
    };
}
