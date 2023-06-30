import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek/homepage.dart';
import 'package:projek/login.dart';
import 'package:email_validator/email_validator.dart';
import 'controllers/authC.dart';
import 'controllers/constants.dart';
import 'controllers/loginC.dart';
// import 'controllers/loginC.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() async{
  await GetStorage.init();
}

bool validateStructure(String value){
  String  pattern = r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final c = Get.find<LoginC>();
  final auth = Get.find<AuthC>();
  final username = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final userdata = GetStorage();
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
                    const Text('Register',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 75,),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/wavetall.png'),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('username'),
                          SizedBox(height: 5,),
                          TextField(
                            controller: username,
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
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('email'),
                          const SizedBox(height: 5,),
                          TextField(
                            controller: email,
                            decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Masukan email',
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('password'),
                          const SizedBox(height: 5,),
                          Obx(() =>
                          TextField(
                            controller: pass,
                            obscureText: c.hidden.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: ()=>c.hidden.toggle(),
                                  icon: c.hidden.isTrue
                                      ? const Icon(Icons.remove_red_eye)
                                      : const Icon(Icons.remove_red_eye_outlined)),
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'masukan password',
                              fillColor: Colors.white,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),

                    
                    ElevatedButton(
                      onPressed: () {
                        bool passtrue = false;
                        String user = username.text;
                        String password = pass.text;
                        String emailC = email.text;
                        userdata.write('isLogged', true);
                        userdata.write('user', user);
                        userdata.write('email', emailC);
                        userdata.write('pass', password);
                        // validate

                        if(user != '' && password != '' && emailC != ''){
                          if(double.tryParse(userdata.read('user')) != null){
                            if(!validateStructure(pass.text,)){
                              print(pass.text);
                              print('error');
                              dialogError('password harus berisi angka dan huruf, minimal 8 digit');
                              return;
                            }else{
                              passtrue = true;
                              print(passtrue);
                              print('benar');
                              if(passtrue = true){
                                print('sucsses');
                                Get.off(Homepage());
                              } else{

                              }
                              return;
                            }

                          } else{
                            dialogError('user harus berisi angka');
                          }
                          // userdata.listen(() {print(box.read('user'));});
                        } else{
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 45),
                          backgroundColor: const Color(0xFFE1341E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),
                      child: const Text('REGISTER',
                        style: TextStyle(color:Colors.white,),
                      ),
                    ),

                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login())
                          ,);
                      },
                      child: const Text('Sudah punya akun? Login'),
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


