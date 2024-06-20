import 'package:flutter/cupertino.dart';
import 'package:netflix/presentation/pages/widgets/index.dart';

class ScreenMore extends StatelessWidget {
  const ScreenMore({super.key});

  final List<Map<String, String>> profiles = const [
    {'image': 'images/Emenalo.png', 'name': 'Emenalo'},
    {'image': 'images/Onyeka.png', 'name': 'Onyeka'},
    {'image': 'images/Thelma.png', 'name': 'Thelma'},
    {'image': 'images/Kids.png', 'name': 'Kids'},
    {'image': 'images/add.png', 'name': 'Add'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 80,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(profiles[index]['image']!),
                    ),
                  ),
                );
              },
            ),
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
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Terms&Conditions', style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
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
                        child: const Text(
                          'Copy Link',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Brand(Brands.whatsapp),
                      Container(color: Colors.white, height: 38, width: 0.4),
                      Brand(Brands.facebook),
                      Container(color: Colors.white, height: 38, width: 0.4),
                      Brand(Brands.gmail),
                      Container(color: Colors.white, height: 38, width: 0.4),
                      const Column(
                        children: [
                          Text('...'),
                          Text('More'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text('App Settings', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Account', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Help', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Sign Out', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
