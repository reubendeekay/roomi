import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/on_boarding/slider_page.dart';

import 'bloc/slider_bloc.dart';
import 'bloc/slider_event.dart';

class OnBoardingScreen extends StatelessWidget {
  final List<Widget> _pages = [
    const SliderPage(
      title: 'Find Places to Live',
      image: 'images/on_boarding/Art_1@1x.png',
      description: 'Find great verified places & people to share a home with.',
    ),
    const SliderPage(
      title: 'Match Your Preferences',
      description: 'Tell us your preferences and match with the right people.',
      image: 'images/on_boarding/Art_2@1x.png',
    ),
    const SliderPage(
      title: 'Like-minded People',
      description: 'Live together with people who will inspire like you.',
      image: 'images/on_boarding/Art_3@1x.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    final SliderBloc counterBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<SliderBloc, int>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                    height: height / 203 * 160,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _pages.length,
                      onPageChanged: (value) {
                        if (value > state) {
                          counterBloc.add(SliderEvent.swipeRight);
                        } else {
                          counterBloc.add(SliderEvent.swipeLeft);
                        }
                      },
                      itemBuilder: (context, index) {
                        return _pages[index];
                      },
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  List<Widget>.generate(_pages.length, (index) {
                                return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height: 8,
                                    width: 8,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFF0F73EE)),
                                        borderRadius: BorderRadius.circular(10),
                                        color: (index == state)
                                            ? const Color(0xFF0F73EE)
                                            : Colors.white));
                              })),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.setUpScreen);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 15),
                                child: AppWidget.typeButtonStartAction(
                                    input: 'GET STARTED'),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.logInScreen);
                            },
                            child: Text(
                              'Login',
                              style: AppWidget.simpleTextFieldStyle(
                                  fontSize: 14,
                                  color: const Color(0xFF404B69),
                                  height: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
