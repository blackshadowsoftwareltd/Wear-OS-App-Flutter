import 'package:flutter/material.dart';

import 'components/body.dart' show DeviceInfoBody;

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DeviceInfoBody(),
    );
  }
}
