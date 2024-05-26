import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constant_values.dart';
import 'package:icons_plus/icons_plus.dart';
class ScreenMore extends StatelessWidget {
  const ScreenMore({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/Emenalo.png'))),
            )),
            Expanded(
                child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/Onyeka.png'))),
            )),
            Expanded(
                child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/Thelma.png'))),
            )),
            Expanded(
                child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/Kids.png'))),
            )),
            Expanded(
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/add.png'))))),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit),
            SizedBox(
              width: 10,
            ),
            Text('Manage Profiles'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 260,
          width: MediaQuery.of(context).size.width,
          color: const Color(0XFF1A1A1A),
          child: Column(
            children: [
              const Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(CupertinoIcons.bubble_right_fill),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Tell friends about Netflix.')
                  ],
                ),
              ),
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface.',
                  textAlign: TextAlign.justify,
                ),
              )),
              const Row(children:[Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Terms&Conditions', style: TextStyle(color: grey,decoration: TextDecoration.underline)),
              )]),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.5,
                      
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      child: const Text('Copy Link',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Brand(Brands.whatsapp),
                  Container(color: white,height: 38,width: 0.4,),
                  Brand(Brands.facebook),
                  Container(color: white,height: 38,width: 0.4,),
                  Brand(Brands.gmail),
                  Container(color: white,height: 38,width: 0.4,),
                  Column(children: [
                    Text('...'),
                    Text('More')
                  ],)
                ],),
              ),
              
            ],
          ),
        ),
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(Icons.check,size: 30,),
          ),
          SizedBox(width: 10,),
          Text("MyList",style: TextStyle(fontSize: 20),)
        ],),
        Divider(),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('App Settings',style: TextStyle(fontSize: 20)),
                Text('Account',style: TextStyle(fontSize: 20)),
                Text('Help',style: TextStyle(fontSize: 20)),
                Text('Sign Out',style: TextStyle(fontSize: 20))
              ],
            ),
          ),
        ) 
      ],
    ));
  }
}
