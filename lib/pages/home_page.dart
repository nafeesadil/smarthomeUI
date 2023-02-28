import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //PADDING
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  //List of smart devices
    List mySmartDevices =[
      // smartDeviceName, iconPath, activeStatus
      ['Smart Light', 'lib/icons/light-bulb.png', true],
      ['Fan', 'lib/icons/fan.png', false],
      ['Smart TV', 'lib/icons/smart-tv.png', false],
    ];

    void powerSwitchChanged(value,int){
      setState(() {
        mySmartDevices[int][2]=value;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CUSTOM APP BAR
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //MENU
                  Image.asset("lib/icons/menu.png",
                  height: 45,
                  color: Colors.grey[800],),

                  //ACCOUNT
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],

                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),

            //WELCOME HOME NAFEES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home,',
                    style: GoogleFonts.oswald(
                      fontSize: 15,
                      letterSpacing: 4,
                      shadows: [Shadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                      ],
                    ),
                  ),
                  Text('Nafees',
                  style: GoogleFonts.oswald(
                    fontSize: 80,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(
                  color: Colors.grey.withOpacity(0.5),
                    offset: Offset(3, 2),
                    blurRadius: 3,
                  ),
                ],
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: Divider(
                height: 2,
                thickness: 3,
                color: Colors.grey[400],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text('Smart Devices',
                style: GoogleFonts.oswald(
                  fontSize: 15,
                  letterSpacing: 4,
                  shadows: [Shadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(25.0),
                itemCount: mySmartDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.2/1.6,
                    crossAxisCount: 2),
                itemBuilder: (BuildContext,int){
              return SmartDeviceBox(
                smartDeviceName: mySmartDevices[int][0],
                iconPath: mySmartDevices[int][1],
                powerOn: mySmartDevices[int][2],
                onChanged: (value)=> powerSwitchChanged(value,int),
              );
                },
            ),
            )



            //SMART HOME DEVICES + GRID
          ],
        ),
      ),

    );
  }
}
