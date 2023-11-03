import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_gantt/gantt/gantt_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: GanttModule()),
      ];
}
