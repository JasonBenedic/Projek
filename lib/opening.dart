import 'package:flutter/material.dart';
import 'package:projek/login.dart';
import 'package:projek/register.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
void main() {
  runApp(const MaterialApp(
      home: Opening()
  ));
}

class Opening extends StatelessWidget {
  const Opening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF536EFF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 25),
               Stack(
                children: [
                  Center(
                    child: Image.asset('assets/bee.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const Text('ALLOSEMATIC',
                style: TextStyle(fontSize: 25,
                fontFamily: 'Orbitron'
                ),
              ),


              const SizedBox(height: 230),

              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset('assets/openn.png',
                  // width: 480,
                  //  height: 480,
                    fit: BoxFit.fitWidth,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(height: 100,),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Register())
                              ,);
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
                        const SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login())
                              ,);
                          },
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
                        SizedBox(height: 40,),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
