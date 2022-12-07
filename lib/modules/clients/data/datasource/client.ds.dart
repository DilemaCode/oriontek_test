import 'package:oriontek_flutter/common/dependency_injection.dart';
import 'package:oriontek_flutter/globals/data/repository/local.repository.dart';

class ClientsDS {
  final LocalRepository localRepository = locator();

  Future<List<dynamic>> getClients() async {
    return localRepository.getClients();
  }

  Future<dynamic> addClient(Map client) async {
    return localRepository.addClient(client);
  }

  Future<dynamic> deleteClient(Map client) async {
    return localRepository.deleteClient(client);
  }
  Future<dynamic> updateClientAddress(Map client) async {
    return localRepository.updateClientAddress(client);
  }
}
