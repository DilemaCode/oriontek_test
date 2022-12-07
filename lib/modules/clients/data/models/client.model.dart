import 'package:oriontek_flutter/modules/client_detail/data/models/client.detail.model.dart';

List<ClientModel> clientModelFromJsonList(List data) {
  List<ClientModel> _data = data.map((e) => ClientModel.fromJson(e)).toList();
  return _data;
}

class ClientModel {
  String? clientId;
  String? name;
  String? photo;
  String? description;
  List<ClientAddressModel>? addresses;

  ClientModel({
    this.clientId,
    this.name,
    this.photo,
    this.description,
    this.addresses,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    try {
      clientId = json['clientId'] ?? 0;
      name = json['name'] ?? '';
      photo = json['photo'] ?? '';
      description = json['description'] ?? '';
      addresses = clientAddressModelFromJsonList(json['addresses']);
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['name'] = name;
    data['photo'] = photo;
    data['description'] = description;
    data['addresses'] = addresses?.map((e) => e.toJson()).toList();
    return data;
  }
}
