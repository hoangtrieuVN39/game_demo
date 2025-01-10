import 'package:app/core/commons.dart';
import 'package:get/get.dart';

abstract class BaseViewModel extends GetxController {
  final _initialized = false.obs;

  bool get initialized => _initialized.value;
  final AppNavigation navigation = Get.find();

  void initViewModel() {
    if (!_initialized.value) {
      onInit();
      _initialized.value = true;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _initialized.value = false;
  }

  T getOrCreateViewModel<T extends GetxController>(
      String tag, T Function() creator) {
    return Get.isRegistered<T>(tag: tag)
        ? Get.find<T>(tag: tag)
        : Get.put(creator(), tag: tag);
  }

  T? getViewModel<T extends GetxController>(String tag) {
    if (Get.isRegistered<T>(tag: tag)) {
      return Get.find<T>(tag: tag);
    }
    return null;
  }
}
