import 'package:flutter/material.dart';
import 'package:medion/infrastructure/core/interceptors.dart';
import 'package:medion/infrastructure/services/alice/alice.dart';
import 'package:medion/infrastructure/services/alice/model/alice_configuration.dart';
import 'package:medion/presentation/pages/core/my_app.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug - Alice Inspector'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            alice.showInspector();
          },
          child: Text('View HTTP Requests'),
        ),
      ),
    );
  }
}
