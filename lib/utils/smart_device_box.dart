import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;
  const SmartDeviceBox({super.key, required this.smartDeviceName, required this.iconPath, required this.powerOn,required this.onChanged,});


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: powerOn? Colors.grey[800]: Colors.grey[400],
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),],

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //app Icon
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(iconPath,
                height: 65,
                  color: powerOn? Colors.white: Colors.black,
                ),
              ),


              //app Name + button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(smartDeviceName,
                    style: TextStyle(
                    fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: powerOn? Colors.white : Colors.black,
                    ),
                    ),
                    Transform.rotate(
                        angle: 3*pi/2,
                        child: CupertinoSwitch(value: powerOn, onChanged: onChanged)),
                    //CupertinoButton(child: child, onPressed: onPressed)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
