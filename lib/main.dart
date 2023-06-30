import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek/controllers/authC.dart';
import 'package:projek/controllers/loginC.dart';
import 'package:projek/homepage.dart';
import 'package:projek/login.dart';
import 'package:projek/register.dart';
import 'package:projek/routes/app_pages.dart';
import 'opening.dart';
import 'package:get/get.dart';


void main() async {
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  final loginC = Get.put(LoginC());
  final authC = Get.put(AuthC());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Homepage(),
      home: Opening(),
      getPages: AppPage.pages,

    );

  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final userdata = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userdata.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero,() async{
      checkiflogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
  void checkiflogged() {
    userdata.read('isLogged') ? Get.offAll(Homepage()) : Get.offAll(Login());
  }
}








