import 'package:app/core/commons.dart';
import 'package:app/core/constants.dart';

class SplashViewModel extends BaseViewModel {

  @override
  void onInit() {
    super.onInit();
    _navigateToRoot();
  }

  Future<void> _navigateToRoot() async {
    await Future.delayed(const Duration(seconds: 2));
    await navigation.pushRemoveUntil(RouteConstants.rootRoute);
  }
}
