import 'package:flutter/material.dart';
import 'package:to_win/app/config/flavors.dart';
import 'package:to_win/app/main_app/view/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const App(
      // set default flavor here
      flavor: Flavors.prod,
    ),
  );
}
