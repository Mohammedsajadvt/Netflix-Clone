import 'package:netflix/presentation/pages/widgets/index.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true, // Adjust ListView height to its contents
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Smart Downloads',
                      style: TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Introducing Downloads For You',
                      style: TextStyle(color: white, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
                      style: TextStyle(color: white, fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 80,
                  child: const Icon(
                    Icons.download_rounded,
                    color: Colors.black,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('SETUP'),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlack,
                      foregroundColor: white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Find Something to Download'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
