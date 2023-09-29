import 'dart:math';

import 'package:flutter/material.dart';

class clock extends StatefulWidget {
  const clock({super.key});

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
  double sec = 3 * pi / 2;
  int secCount = 0;
  int stop = 1;
  double min = 3 * pi / 2;
  int minCount = 0;
  double hour = 3 * pi / 2;
  int hourCount = 0;
  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  timer() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        sec += (pi / 30);

        if (sec > 0) {
          sec += (pi * 30);
          min + (pi / 30);
        }

        if (stop == 1) {
          secCount++;
          if (secCount == 59) {
            secCount = 0;
            min += (pi / 30);
            minCount++;
            if (minCount > 59) {
              minCount = 0;
              hourCount++;
              hour += (pi / 6);
            }
          }
        }
      });
    });
    timer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              height: 300,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.black,
                    spreadRadius: 10,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Transform.rotate(
                    angle: sec,
                    child: const Divider(
                      color: Colors.black,
                      thickness: 1.3,
                      endIndent: 30,
                      indent: 150,
                    ),
                  ),
                  Transform.rotate(
                    angle: min,
                    child: const Divider(
                      color: Colors.black,
                      endIndent: 60,
                      indent: 150,
                      thickness: 1.5,
                    ),
                  ),
                  Transform.rotate(
                    angle: (3 / pi * 2) + pi / 2.55,
                    child: const Divider(
                      indent: 270,
                      color: Colors.red,
                      thickness: 1.5,
                    ),
                  ),
                  Transform.rotate(
                    angle: pi * 6,
                    child: const Divider(
                      indent: 270,
                      color: Colors.red,
                      thickness: 1.5,
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: const Divider(
                      indent: 270,
                      color: Colors.red,
                      thickness: 1.5,
                    ),
                  ),
                  Transform.rotate(
                    angle: 3 * pi / 2,
                    child: const Divider(
                      indent: 270,
                      color: Colors.red,
                      thickness: 1.5,
                    ),
                  ),
                  Transform.rotate(
                    angle: hour,
                    child: const Divider(
                      color: Colors.blueGrey,
                      endIndent: 80,
                      indent: 150,
                      thickness: 3.5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(145, 2),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(),
              child: Text(
                "$hourCount : $minCount : $secCount",
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade300,
              ),
              onPressed: () {
                if (stop == 1) {
                  stop = 0;
                } else {
                  if (stop == 0) {
                    stop = 1;
                  }
                }
              },
              child: const Text(
                "Pause",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
