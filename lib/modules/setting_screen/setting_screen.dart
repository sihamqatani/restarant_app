import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: Center(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/89.jpg'),
                    radius: 38,
                  ),
                  Icon(
                    Icons.camera_enhance,
                    color: Colors.red[200],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
