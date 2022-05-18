import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:roomy/feature/on_boarding/on_boarding_screen.dart';

class SabMyProfileWidget extends StatefulWidget {
  const SabMyProfileWidget({this.height, this.listImage});
  final double height;
  final List<String> listImage;
  @override
  _SabMyProfileWidgetState createState() => _SabMyProfileWidgetState();
}

class _SabMyProfileWidgetState extends State<SabMyProfileWidget> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.height / 203 * 75);
    return SliverAppBar(
      pinned: false,
      expandedHeight: widget.height / 203 * 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Image.asset(
                'images/questionnaires/ic_back@3x.png',
                width: 24,
                height: 24,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAll(() => OnBoardingScreen());
            },
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          width: 10,
        )
      ],
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            itemCount: widget.listImage.length,
            onPageChanged: (value) {
              setState(() {
                currentImage = value;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.listImage[index],
                width: double.infinity,
                fit: BoxFit.fill,
              );
            },
          ),
          Positioned(
            child: Container(
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
            bottom: -1,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
