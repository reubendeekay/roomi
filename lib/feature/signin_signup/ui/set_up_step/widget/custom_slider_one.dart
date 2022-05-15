import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:roomy/app/widget_support.dart';

class CustomSliderOne extends StatefulWidget {
  const CustomSliderOne({this.onChanged});
  final Function(double amount) onChanged;
  @override
  _CustomSliderOneState createState() => _CustomSliderOneState();
}

class _CustomSliderOneState extends State<CustomSliderOne> {
  double currentMoney = 2500;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'KES ${currentMoney.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}',
                style: AppWidget.boldTextFieldStyle(
                    color: const Color(0xFF0F73EE),
                    fontSize: 24,
                    height: 29.26,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 3),
                child: Text(
                  ' per month',
                  style: AppWidget.simpleTextFieldStyle(
                      color: const Color(0xFF020433),
                      fontSize: 14,
                      height: 17.07),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
          child: FlutterSlider(
            values: [currentMoney],
            max: 1000000,
            min: 1000,
            hatchMark: FlutterSliderHatchMark(
              labelsDistanceFromTrackBar: 40,
              labels: [
                FlutterSliderHatchMarkLabel(
                    percent: 2,
                    label: Text('1,000',
                        style: AppWidget.simpleTextFieldStyle(
                            color: const Color(0xFF404B69),
                            fontSize: 13,
                            height: 15.85))),
                FlutterSliderHatchMarkLabel(
                    percent: 92,
                    label: FittedBox(
                      child: Text('100,000',
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF404B69),
                              fontSize: 13,
                              height: 15.85)),
                    )),
              ],
            ),
            trackBar: FlutterSliderTrackBar(
                activeTrackBar:
                    BoxDecoration(borderRadius: BorderRadius.circular(2)),
                inactiveTrackBar:
                    BoxDecoration(borderRadius: BorderRadius.circular(2))),
            tooltip: FlutterSliderTooltip(
              disabled: true,
            ),
            handler: FlutterSliderHandler(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('images/log_in/ic_handle_step_3@3x.png'),
                      fit: BoxFit.cover)),
              child: const Material(
                type: MaterialType.transparency,
                color: Colors.white,
              ),
            ),
            onDragging: (handlerIndex, dynamic lowerValue, dynamic upperValue) {
              setState(() {
                currentMoney = lowerValue;
                widget.onChanged(currentMoney);
              });
            },
          ),
        ),
      ],
    );
  }
}
