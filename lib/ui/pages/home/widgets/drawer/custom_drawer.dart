import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 247, 245),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 210,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 253, 81, 62),
                      Color.fromARGB(255, 252, 39, 71),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_box_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "go fidelidade",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_circle_right_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "acumule selinhos e trique por reservas grátis. vale em todos os motéis e horário",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DrawerTile(icon: Icons.person, title: "login"),
              DrawerTile(icon: Icons.help, title: "ajuda"),
              DrawerTile(icon: Icons.settings, title: "configurações"),
              DrawerTile(
                icon: Icons.bug_report_rounded,
                title: "comunicar problema",
              ),
              DrawerTile(
                icon: FontAwesomeIcons.bullhorn,
                title: "tem um motel? faça parte",
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "2.0.087",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
