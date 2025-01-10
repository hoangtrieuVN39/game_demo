import 'package:app/features/home/data/home_repository.dart';
import 'package:app/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(repository: HomeRepository()));
  }
}
