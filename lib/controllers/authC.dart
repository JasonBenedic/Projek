import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';

class AuthC extends GetxController{
  var isAuth = false.obs;
  var passcheck = false.obs;
  final dataUser = GetStorage();
  // Map<String, String> _dataUser = {
  //   'user': '',
  //   'email': '',
  //   'password': '',
  // } ;

  void dialogError(String msg){
    Get.defaultDialog(
      title: 'terjadi kesalahan',
      middleText: msg,
    );
  }


  void login(String user, String password){
    if (user != '' && password != ''){
      if(GetUtils.isUsername(user)){
        if(user == dataUser.read('user') && password == dataUser.read('pass')){
          isAuth.value = true;
        }else{
          dialogError('data user tidak valid, coba akun lain');
        }
      } else{
        dialogError('email tidak valid');
      }
    }else{
      dialogError('semua data harus diisi');
    }

  }
}