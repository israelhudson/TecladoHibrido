import 'package:keyboard_cursive_writing/features/customize/datasource/config_datasource.dart';

class Controller {
  final ConfigDataSource configDataSource;

  Controller(this.configDataSource);

  void add() async {
    configDataSource.add();
  }

  Future<void> update({required String color}) async {
    await configDataSource.update(color: color);
  }
}
