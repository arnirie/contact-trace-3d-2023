import 'package:contact_tracing_3d/firebase_options.dart';
import 'package:contact_tracing_3d/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

//!!! CONTACT TRACING APP
//TODO
//!1. Registration of a) clients/ users b) Establishments
//2. Login a) clients/users b) esbtablishments
//3. Generate QR codes
//4. Scan QR codes
//5. Trace

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ContactTrace());
}

class ContactTrace extends StatelessWidget {
  const ContactTrace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
              fontSize: 14,
              // fontWeight: FontWeight.bold,
              color: Colors.black38),
          displayMedium: TextStyle(
            fontSize: 18,
            // fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200],
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
