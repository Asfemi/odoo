import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';
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
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradient(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OdooCard(
                radius: 32,
                height: 192.0,
                width: 192.0,
                child: Image.asset(
                  'lib/assets/icons/d1_1 1 2.png',
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Odoo',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Time management without obstacles',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
