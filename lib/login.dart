import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek/changepassword.dart';
import 'package:projek/controllers/authC.dart';
import 'package:projek/controllers/loginC.dart';
import 'package:projek/forgetpassword.dart';
import 'package:projek/register.dart';
import 'package:get/get.dart';

import 'homepage.dart';


class Login extends StatelessWidget {
  var passcheck = false.obs;
  final userdata = GetStorage();
  final c = Get.find<LoginC>();
  final auth = Get.find<AuthC>();
  final username = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  var isAuth = false.obs;

  void dialogError(String msg){
    Get.defaultDialog(
      title: 'terjadi kesalahan',
      middleText: msg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDE805F),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/atasbiru.png',
                    ),
                    const Text('Login',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 175,),

            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/wave.png'),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('username'),
                          const SizedBox(height: 5,),
                          TextField(
                            controller: username,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Masukan username',
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('password'),
                          const SizedBox(height: 5,),
                          Obx(
                            ()=> TextField(
                              obscureText: c.hidden.value,
                              controller: pass,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: ()=>c.hidden.toggle(),
                                    icon: c.hidden.isTrue
                                    ? const Icon(Icons.remove_red_eye)
                                    : const Icon(Icons.remove_red_eye_outlined)),
                                filled: true,
                                border: const OutlineInputBorder(),
                                hintText: 'masukan password',
                                fillColor: Colors.white,
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Forget())
                                    ,);
                                },
                                child: const Text('lupa password?',
                                style: TextStyle(fontSize: 12),
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Change())
                                    ,);
                                },
                                child: const Text('reset password',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              // SizedBox(height: 5, ),
                            ],
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),


                    ElevatedButton(
                      onPressed: () {
                        userdata.write('isLogged', true);
                        String user = username.text;
                        String password = pass.text;
                        if (user != '' && password != ''){
                          if(GetUtils.isUsername(user)){
                            if(user == userdata.read('user') && password == userdata.read('pass')){
                              isAuth.value = true;
                              Get.off(Homepage());
                            }else{
                              dialogError('data user tidak valid, coba akun lain');
                            }
                            } else{
                              dialogError('email atau password admintidak valid');
                            }
                            }else{
                              dialogError('semua data harus diisi');
                            }
                        print(userdata.read('user'));
                        print(userdata.read('pass'));
                        print(userdata.read('emailC'));
                      },
                      // auth.login(userdata.read('user') , userdata.read('pass')),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 45),
                          backgroundColor: const Color(0xFFE1341E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),
                      child: const Text('LOGIN',
                        style: TextStyle(color:Colors.white,),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Register())
                          ,);
                      },
                      child: Text('Belum punya akun? Register'),
                    )
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


