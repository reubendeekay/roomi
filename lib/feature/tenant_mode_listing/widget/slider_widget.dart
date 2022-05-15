import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:roomy/app/widget_support.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget(
      {this.typeLabel, this.labelOne, this.labelTwo, this.max, this.min});
  final String labelOne;
  final String labelTwo;
  final double max;
  final double min;
  final String typeLabel;
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double currentMin;
  double currentMax;
  @override
  void initState() {
    currentMin = widget.min;
    currentMax = widget.max;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 22),
          child: Text(
            widget.typeLabel == 'age'
                ? '${currentMin.toInt()}s - ${currentMax.toInt()}s'
                : (widget.typeLabel == 'monthlyBudgets'
                    ? '\$${currentMin.toInt()} - \$${currentMax.toInt()}'
                    : '${currentMin.toInt()} - ${currentMax.toInt()} months'),
            style: AppWidget.boldTextFieldStyle(
                fontSize: 14,
                height: 17.07,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF020433)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: FlutterSlider(
            values: [currentMin, currentMax],
            max: widget.max,
            min: widget.min,
            rangeSlider: true,
            hatchMark: FlutterSliderHatchMark(
              labelsDistanceFromTrackBar: 40,
              labels: [
                FlutterSliderHatchMarkLabel(
                    percent: 5,
                    label: FittedBox(
                      child: Text(widget.labelOne,
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF95A0B6),
                              fontSize: 13,
                              height: 15.85)),
                    )),
                FlutterSliderHatchMarkLabel(
                    percent: 92,
                    label: FittedBox(
                      child: Text(widget.labelTwo,
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF95A0B6),
                              fontSize: 13,
                              height: 15.85)),
                    )),
              ],
            ),
            trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFF0F73EE),
                      Color(0xFFC644FC),
                    ]),
                    borderRadius: BorderRadius.circular(2)),
                inactiveTrackBar:
                    BoxDecoration(borderRadius: BorderRadius.circular(2))),
            tooltip: FlutterSliderTooltip(
              disabled: true,
            ),
            rightHandler: FlutterSliderHandler(
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
                currentMin = lowerValue;
                currentMax = upperValue;
              });
            },
          ),
        )
      ],
    );
  }
}
