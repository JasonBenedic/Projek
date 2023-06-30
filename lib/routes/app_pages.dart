import 'package:get/get.dart';
import 'package:projek/homepage.dart';
import 'package:projek/login.dart';
import 'package:projek/opening.dart';
import 'package:projek/routes/route_name.dart';

class AppPage{
  static final pages = [
    GetPage(name: RouteName.home, page: ()=> Homepage(),),
    GetPage(name: RouteName.login, page: ()=> Login(),),
    GetPage(name: RouteName.opening, page: ()=> Opening(),),
  ];
}