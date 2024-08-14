import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_exemple/infra/services/i_dio_client_service.dart';

import '../../infra/services/client_http_service.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.add<IDioClientService>(DioClientService.new);
    super.binds(i);
  }
}
