class ProfileModel {
    String? message;
    ProfileBody? body;
    int? statusCode;

    ProfileModel({
        this.message,
        this.body,
        this.statusCode,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        body: json["body"] == null ? null : ProfileBody.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
    };
}

class ProfileBody {
    int? id;
    String? username;
    String? email;
    String? name;
    String? avatar;
    String? countryCode;
    String? phone;
    String? referralCode;
    String? distributorCode;
    String? address;
    String? city;
    String? state;
    String? country;
    String? zipCode;
    String? gst;
    String? wallet;
    String? cardLimit;
    dynamic expiryDate;
    String? paid;
    dynamic paymentId;
    int? referralCount;

    ProfileBody({
        this.id,
        this.username,
        this.email,
        this.name,
        this.avatar,
        this.countryCode,
        this.phone,
        this.referralCode,
        this.distributorCode,
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
        this.referralCount,
    });

    factory ProfileBody.fromJson(Map<String, dynamic> json) => ProfileBody(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        countryCode: json["country_code"],
        phone: json["phone"],
        referralCode: json["referral_code"],
        distributorCode: json["distributor_code"],
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
        referralCount: json["referral_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "name": name,
        "avatar": avatar,
        "country_code": countryCode,
        "phone": phone,
        "referral_code": referralCode,
        "distributor_code": distributorCode,
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
        "referral_count": referralCount,
    };
}
