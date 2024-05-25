import 'package:flutter/material.dart';
import 'package:netflix/core/constant_values.dart';

class MainCardSearch extends StatelessWidget {
  const MainCardSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: lightBlack,
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('images/del.png',fit: BoxFit.fill,)
                    ),
                  ),
                   SizedBox(width: MediaQuery.of(context).size.width/20),
                  Expanded(
                    child: Text(
                      'Title $index',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  
                   const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 90),
                      child: Icon(Icons.play_circle_outlined),
                    )
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
