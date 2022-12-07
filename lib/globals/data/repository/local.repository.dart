import 'package:oriontek_flutter/globals/data/datasource/local.datasource.dart';

abstract class LocalRepository {
  Future<List> getClients();
  Future<dynamic> updateClients(List clients);
  Future<dynamic> addClient(Map client);
  Future<dynamic> deleteClient(Map client);
  Future<dynamic> updateClientAddress(Map client);
}

class LocalRepositoryImpl implements LocalRepository {
  LocalDataSource localDataSource;

  LocalRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<List> getClients() => localDataSource.getClients();

  @override
  Future<dynamic> updateClients(List clients) =>
      localDataSource.updateClients(clients);

  @override
  Future<dynamic> addClient(Map client) => localDataSource.addClient(client);

  @override
  Future<dynamic> updateClientAddress(Map client) =>
      localDataSource.updateClientAddress(client);

  @override
  Future<dynamic> deleteClient(Map client) =>
      localDataSource.deleteClient(client);
}
