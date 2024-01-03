

class LoginModel {
    String? message;
    LoginBody? body;

    LoginModel({
        this.message,
        this.body,
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
    String? token;
    User? user;

    LoginBody({
        this.token,
        this.user,
    });

    factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    dynamic email;
    dynamic name;
    String? avatar;
    String? countryCode;
    String? phone;
    String? referralCode;
    dynamic address;
    dynamic city;
    dynamic state;
    dynamic country;
    dynamic zipCode;
    dynamic gst;
    String? wallet;
    String? cardLimit;
    dynamic expiryDate;
    String? paid;
    dynamic paymentId;
    String? referralText;
    int? referralCount;

    User({
        this.id,
        this.email,
        this.name,
        this.avatar,
        this.countryCode,
        this.phone,
        this.referralCode,
        this.address,
        this.city,
        this.state,
        this.country,
        this.zipCode,
        this.gst,
        this.wallet,
        this.cardLimit,
        this.expiryDate,
        this.paid,
        this.paymentId,
        this.referralText,
        this.referralCount,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        countryCode: json["country_code"],
        phone: json["phone"],
        referralCode: json["referral_code"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
        gst: json["gst"],
        wallet: json["wallet"],
        cardLimit: json["card_limit"],
        expiryDate: json["expiry_date"],
        paid: json["paid"],
        paymentId: json["payment_id"],
        referralText: json["referral_text"],
        referralCount: json["referral_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "avatar": avatar,
        "country_code": countryCode,
        "phone": phone,
        "referral_code": referralCode,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "gst": gst,
        "wallet": wallet,
        "card_limit": cardLimit,
        "expiry_date": expiryDate,
        "paid": paid,
        "payment_id": paymentId,
        "referral_text": referralText,
        "referral_count": referralCount,
    };
}
