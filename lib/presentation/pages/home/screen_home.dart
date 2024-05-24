import 'package:flutter/material.dart';
import 'package:netflix/core/constant_values.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: Image.asset('images/del.png',
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height/6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/n.png'),
                const SizedBox(width: width20,),
                const Text('Tv Shows',style: TextStyle(fontSize: size20),),
                 const SizedBox(width: width20,),
                const Text('Movies',style: TextStyle(fontSize: size20),),
                 const SizedBox(width: width20,),
                const Text('My List',style: TextStyle(fontSize: size20),),
                SizedBox(width: MediaQuery.of(context).size.width/10,)
              ],
            ),
          )
        ],
      );
    
  }
}
