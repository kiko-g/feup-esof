import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class DrawerStepWhen extends When2WithWorld<String, int, FlutterWorld> {
  DrawerStepWhen()
    : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String direction, int numberOfSwipes) async {

    final pv = find.byValueKey('pageview');
    await world.driver.waitFor(pv, timeout: timeout);

    double scrollValue = 0;
    if(direction == 'right')
      scrollValue = -400;
    else if(direction == 'left')
      scrollValue = 400;

    for(int i = 0; i < numberOfSwipes; i++) {
      await world.driver.scroll(pv, scrollValue, 0, Duration(milliseconds: 500));
    }
  }

  @override
  RegExp get pattern => RegExp(r"I scroll to the (right|left) for {int} times");
}



class DrawerStepAnd extends And2WithWorld<String, int, FlutterWorld> {
  DrawerStepAnd()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String direction, int numberOfSwipes) async {

    final pv = find.byValueKey('pageview');
    await world.driver.waitFor(pv, timeout: timeout);

    double scrollValue = 0;
    if(direction == 'right')
      scrollValue = -400;
    else if(direction == 'left')
      scrollValue = 400;

    for(int i = 0; i < numberOfSwipes; i++) {
      await world.driver.scroll(pv, scrollValue, 0, Duration(milliseconds: 500));
    }
  }

  @override
  RegExp get pattern => RegExp(r"I scroll to the (right|left) for {int} times");
}