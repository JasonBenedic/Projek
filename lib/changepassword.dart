import 'package:flutter/material.dart';
import 'package:projek/login.dart';
import 'package:projek/register.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MaterialApp(
      home: Change()
  ));
}
class Change extends StatelessWidget {
  const Change({Key? key}) : super(key: key);

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
                    const Text('Change',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 75,),

            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/wavetall.png'),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 75,),
                          Text('Password Lama'),
                          SizedBox(height: 5,),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Password Lama',
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password Baru'),
                          SizedBox(height: 5,),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Password Baru',
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Konfirmasi Password Lama'),
                          SizedBox(height: 5,),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Konfirmasi Password Baru',
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),




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
                      child: const Text('UBAH',
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


