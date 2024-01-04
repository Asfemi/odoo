import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/background.dart';

// class SplashPage extends StatefulWidget {
//   SplashPage({Key? key}) : super(key: key);

//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   Widget build(BuildContext context) {
//     return EasySplashScreen(
//       logo: Image.asset('lib/assets/icons/d1_1 1 2.png'),
//       title: const Text(
//         "Odoo",
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       backgroundColor: Colors.grey.shade400,
//       showLoader: true,
//       loadingText: const Text("Loading..."),
//       navigator: 'home',
//       durationInSeconds: 1,
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 8));
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradient(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/icons/d1_1 1 2.png', // Make sure to put your image in the assets folder
                  width: 150.0,
                  height: 150.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Odoo',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Time management without obstacles',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
