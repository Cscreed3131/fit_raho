import 'package:flutter/material.dart';

class MemberHomeScreen extends StatefulWidget {
  const MemberHomeScreen({super.key});

  @override
  State<MemberHomeScreen> createState() => _MemberHomeScreenState();
}

class _MemberHomeScreenState extends State<MemberHomeScreen> {
  List<String> workoutType = [
    "10 Pull ups",
    "10 Push ups",
    "3 x 15 (5 kg dumbels)",
    "2 x 15 Squarts"
  ];

  List<String> imagePath = [
    "assets/images/equipment.png",
    "assets/images/push-up.png",
    "assets/images/sport.png",
    "assets/images/equipment.png"
  ];
  bool isDone = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Work on this for better',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Tomorrow',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.2),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: workoutType.length,
            itemBuilder: ((context, index) {
              return Container(
                width: 365,
                height: 100,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(
                    top: 10, bottom: 5, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(imagePath[index], width: 90),
                    Text(
                      workoutType[index],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const ImageIcon(
                      AssetImage('assets/images/workout.png'),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        // const SizedBox(height: 10),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
        //   child: TextButton(
        //     onPressed: () {},
        //     child: Text(),
        //   ),
        // )
      ],
    );
  }
}
