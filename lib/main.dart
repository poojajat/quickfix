
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_screen.dart';
import 'package:flutter_app/pages/electrician.dart';
import 'package:flutter_app/pages/electrician.dart';
import 'package:flutter_app/pages/logIn.dart';
import 'package:flutter_app/pages/profile_page.dart';
import 'package:flutter_app/pages/signUp.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();(
  options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter App',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return SignUpScreen(); // Show login screen if user is not logged in
            }
            // Navigate to HomeScreen or WorkerScreen based on user type
            // Here you could also fetch user data from Firestore or Realtime Database to check the type
            return HomeScreen(); // Default to HomeScreen, modify as needed
          }
          return CircularProgressIndicator(); // Show a loading indicator while checking auth state
        },
      ),
    );
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter App',
    //   home: Scaffold(
    //
    //     // body: Address(),
    //     // body: Address1(),
    //     // body: EditProfile(),
    //     // body: HomeScreen(),
    //     // body: HomeScreen1(),
    //     // body: HomeScreen2(),
    //     // body: HomeScreen3(),
    //     // body: HomeScreen4(),
    //     // body: HomeScreen5(),
    //     // body: HomeScreen6(),
    //     // body: PopularServices(),
    //     // body: Profile(),
    //     // body: Profile1(),
    //     // body: ProviderProfile(),
    //     // body: Search(),
    //     // body: Services(),
    //     body: SignUpScreen(),

    //   ),
    // );
  }
}
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // Check if user is logged in
    if (user != null) {
      // If logged in, navigate to ProfilePage
      return ProfilePage();
    } else {
      // If not logged in, navigate to LoginScreen
      return LoginScreen();
    }
  }
}
