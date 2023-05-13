import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'src/modules/run/start.dart' show StartApp;

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: StartApp())));
}
