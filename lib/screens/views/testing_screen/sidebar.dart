import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'rive_utils.dart';

class NavbarAnimate extends StatefulWidget {
  const NavbarAnimate({super.key});

  @override
  State<NavbarAnimate> createState() => _NavbarAnimateState();
}

class _NavbarAnimateState extends State<NavbarAnimate> {
  // var searchTigger;
  RiveAsset selectedBottomNav = bottomNavs.first;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                  onTap: () {
                    bottomNavs[index].input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      bottomNavs[index].input!.change(false);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 36,
                width: 36,
                child: Opacity(
                  opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                  child: RiveAnimation.asset(
                    bottomNavs.first.src,
                    artboard: bottomNavs[0].artboard,
                    onInit: (Artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(Artboard,
                              stateMachineName:
                                  bottomNavs[index].stateMachineName);
                      bottomNavs[index].input =
                          controller.findSMI("active") as SMIBool;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notifications"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
];
