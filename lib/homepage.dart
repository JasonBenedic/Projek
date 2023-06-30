import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek/login.dart';
import 'package:projek/register.dart';

// void main() async{
//   await GetStorage.init();
// }

class Homepage extends StatelessWidget {
  // Homepage({super.key});
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME PAGE',
                style: TextStyle( fontSize: 25),),
            SizedBox(height: 100,),
            Text('username: ${userdata.read('user')}') ,
            Text('email: ${userdata.read('email')}') ,
            Text('password: ${userdata.read('pass')}') ,
            SizedBox(height: 25,),
            // Text(userdata.read('isLogged')),
            ElevatedButton(
              onPressed: () {
                  Get.off(Login());
                },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 45),
                  backgroundColor: const Color(0xFFE1341E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
              child: const Text('LogOut',
                style: TextStyle(color:Colors.white,),
              ),
            ),
            SizedBox(height: 10,),

            ElevatedButton(
              onPressed: () {
                userdata.write('isLogged', true);
                userdata.remove('user');
                userdata.remove('email');
                userdata.remove('pass');
                Get.off(Register());
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 45),
                  backgroundColor: const Color(0xFFE1341E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
              child: const Text('Delete User',
                style: TextStyle(color:Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
