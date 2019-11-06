import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ShowSideBarMenu extends When2WithWorld<String, int, FlutterWorld> {
  ShowSideBarMenu()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String input1, int input2) async {
    final locator = find.byValueKey(input1);
    for (var i = 0; i < input2; i ++) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I swipe {string} {int} time");
}