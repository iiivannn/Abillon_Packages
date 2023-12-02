// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_feed/stf.dart';
import 'package:transition/transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 98, 98),
        body: Stack(
          children: [
            Center(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(30)),
                    MyCard(
                      icon: Icons.travel_explore_rounded,
                      title: 'Transition',
                      subtitle: "Package for today's video",
                      btnTxt: 'Transition',
                      fx: TransitionEffect.LEFT_TO_RIGHT,
                      color: Color.fromARGB(255, 90, 60, 49),
                      contest:
                          'This is Transition Package. It specifically features Fade and Scale Functionality. I also used Gap Packaged but with only one function which is to give gap.',
                    ),
                    Gap(30),
                    MyCard(
                      icon: Icons.headphones_battery_rounded,
                      title: 'Fade',
                      subtitle: "Fade Function",
                      btnTxt: 'Fade',
                      fx: TransitionEffect.FADE,
                      color: Color.fromARGB(255, 9, 53, 89),
                      contest:
                          'Fade function allows you to transition from one page to the latter in faded manner.',
                    ),
                    Gap(30),
                    MyCard(
                      icon: Icons.cloud,
                      title: 'Scale',
                      subtitle: "Scale Function",
                      btnTxt: 'Scale',
                      fx: TransitionEffect.SCALE,
                      color: Colors.deepOrangeAccent,
                      contest:
                          'Scale function allows you to transition from first page to the last in a scaling manner.',
                    ),
                    Padding(padding: EdgeInsets.all(30))
                  ]),
            )),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.btnTxt,
    required this.fx,
    required this.color,
    required this.contest,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final String btnTxt;
  final TransitionEffect fx;
  final Color color;
  final String contest;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 189, 101, 74),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
            color: Colors.black,
          ),
          ListTile(
            title: Text(title),
            subtitle: const Text("Package for today's video"),
          ),
          FilledButton.tonal(
            onPressed: () {
              Navigator.push(
                  context,
                  Transition(
                      child: SecondScreen(
                        text: contest,
                        color: color,
                      ),
                      transitionEffect: fx));
            },
            style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 89, 13, 35),
              minimumSize: const Size(70, 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            child: Text(
              btnTxt,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
