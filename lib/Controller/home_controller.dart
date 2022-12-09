import 'package:logger/logger.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../model/home_model.dart';
import '../utills/FlushBarMixin.dart';

class HomeController extends ControllerMVC with FlushBarMixin {
  factory HomeController([StateMVC? state]) =>
      _this ??= HomeController._(state);
  final logger = Logger();

  HomeController._(StateMVC? state)
      : model = HomeModel(),
        super(state);
  static HomeController? _this;

  final HomeModel model;



}