import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List> getClients();
  Future<dynamic> updateClients(List clients);
  Future<dynamic> addClient(Map client);
  Future<dynamic> deleteClient(Map client);
  Future<dynamic> updateClientAddress(Map client);
}

class LocalDataSourceImpl implements LocalDataSource {
  SharedPreferences storage;

  LocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<List> getClients() async {
    try {
      final result = storage.getString('clients') ?? '';
      if (result.isEmpty) {
        return [];
      } else {
        return json.decode(result) as List;
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<dynamic> updateClients(List clients) async {
    final result = storage.setString('clients', json.encode(clients));
    return result;
  }

  @override
  Future<dynamic> updateClientAddress(Map client) async {
    List clients = await getClients();

    int index =
        clients.indexWhere((e) => e['clientId'] == client['clientId']);

    clients[index] = client;

    return await updateClients(clients);
  }

  @override
  Future<dynamic> addClient(Map client) async {
    List clients = await getClients();
    clients.add(client);
    return await updateClients(clients);
  }

  @override
  Future<dynamic> deleteClient(Map client) async {
    List clients = await getClients();
    clients.removeWhere((c) => c['clientId'] == client["clientId"]);
    return await updateClients(clients);
  }
}
