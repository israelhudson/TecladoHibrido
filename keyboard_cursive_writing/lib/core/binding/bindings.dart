import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:keyboard_cursive_writing/controller.dart';

import '../../features/customize/datasource/config_datasource.dart';

class Bindings {
  static void initilizeBinding() {
    final firebaseFirestore = FirebaseFirestore.instance;
    final configDatasource = ConfigDataSource(firebaseFirestore);
    final controller = Controller(configDatasource);

    GetIt.I.registerSingleton<FirebaseFirestore>(firebaseFirestore);
    GetIt.I.registerSingleton<ConfigDataSource>(configDatasource);
    GetIt.I.registerSingleton<Controller>(controller);
  }
}
