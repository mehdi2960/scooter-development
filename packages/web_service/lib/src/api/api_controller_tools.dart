import '/src/constants/api_timeouts.dart';
import '/src/core/web_service_core_api.dart';

abstract class APIControllerTools {
  final WebServiceCoreApi coreAPI = WebServiceCoreApi.getCoreAPI();
  final APITimeouts timeouts = APITimeouts();
}
