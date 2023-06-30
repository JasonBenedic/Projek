import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek/login.dart';
import 'package:projek/register.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

void main() async{
  await GetStorage.init();
}

class Forget extends StatelessWidget {
  final userdata = GetStorage();
  final username = TextEditingController();
  final email = TextEditingController();



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
                    const Text('Forgot',
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

                    ElevatedButton(
                      onPressed: () {
                        var emaill = userdata.read('email') ;
                        Email emailsend = Email(
                          body: 'Berikut merupakan password dari account anda',
                          subject: 'Forget Password',
                          recipients: [emaill],
                          cc: ['cc@example.com'],
                          bcc: ['bcc@example.com'],
                          attachmentPaths: ['/path/to/attachment.zip'],
                          isHTML: false,
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login()),);
                        // print(emaill);
                        FlutterEmailSender.send(emailsend);

                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 45),
                          backgroundColor: const Color(0xFFE1341E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),
                      child: const Text('SEND',
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
                      child: Text('Kembali Ke Login'),
                    ),
                    SizedBox(height: 125,),

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


