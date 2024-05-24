import 'package:flutter/material.dart';
import 'package:netflix/core/constant_values.dart';

class ScreenUser extends StatelessWidget {
  const ScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/9,),
                Expanded(child: Image.asset('images/netflix.png')),
                IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
              ],
            ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 60),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(child: Column(
                          children: [
                            Image.asset('images/Emenalo.png'),
                            const Text('Emenalo')
                          ],
                        )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(child: Column(
                          children: [
                            Image.asset('images/Onyeka.png'),
                            const Text('Onyeka')
                          ],
                        )),
                      ),
                    ),
                  ],),
                  const SizedBox(height: height50,),
                  Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(child: Column(
                          children: [
                            Image.asset('images/Thelma.png'),
                            const Text('Thelma')
                          ],
                        )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(child: Column(
                          children: [
                            Image.asset('images/Kids.png'),
                            const Text('Kids')
                          ],
                        )),
                      ),
                    ),
                  ],),
                  const SizedBox(height: height50,),
                  Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Column(
                          children: [
                            addIcon,
                            const SizedBox(height: height20,),
                            const Text('Add Profile')
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],)
                ],
               ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}