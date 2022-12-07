List<ClientAddressModel> clientAddressModelFromJsonList(List data) {
  List<ClientAddressModel> _data = data.map((e) => ClientAddressModel.fromJson(e)).toList();
  return _data;
}

class ClientAddressModel {
  String? createdAt;
  String? address;
  String? city;
  String? country;
  String? zipCode;

  ClientAddressModel({
    this.createdAt,
    this.address,
    this.city,
    this.country,
    this.zipCode,
  });

  ClientAddressModel.fromJson(Map<String, dynamic> json) {
    try {
      createdAt = json['createdAt'] ?? 0;
      address = json['address'] ?? 0;
      city = json['city'] ?? 0;
      country = json['country'] ?? 0;
      zipCode = json['zipCode'] ?? 0;
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['address'] = address;
    data['city'] = city;
    data['country'] = country;
    data['zipCode'] = zipCode;
    return data;
  }
}
