

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

<<<<<<< HEAD
class NetworkInfoImpl extends NetworkInfo{
  final DataConnectionChecker? dataConnectionChecker;
=======
class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker? dataConnectionChecker;
>>>>>>> 613264c3aff01521f7117c0ddd7f0ed98adfebfa

  NetworkInfoImpl(this.dataConnectionChecker);
  @override
  Future<bool> get isConnected => dataConnectionChecker!.hasConnection;

}