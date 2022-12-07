import 'package:oriontek_flutter/modules/clients/data/datasource/client.ds.dart';
import 'package:oriontek_flutter/modules/clients/data/models/client.model.dart';

class ClientsRepository {
  ClientsDS clientsDS = ClientsDS();

  Future<List<ClientModel>> getClients() async {
    return (await clientsDS.getClients()).map((e) => ClientModel.fromJson(e)).toList();
  }

  Future<bool> addClient(Map client) async {
    final result = await clientsDS.addClient(client);
    if (result == true) {
      return result;
    } else {
      return false;
    }
  }

  Future<bool> updateClientAddress(Map client) async {
    final result = await clientsDS.updateClientAddress(client);
    if (result == true) {
      return result;
    } else {
      return false;
    }
  }
  Future<bool> deleteCliennt(Map client) async {
    final result = await clientsDS.deleteClient(client);
    if (result == true) {
      return result;
    } else {
      return false;
    }
  }
  
}
