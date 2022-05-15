import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class SegmentControlWidget extends StatefulWidget {
  const SegmentControlWidget(
      {this.width, this.length, this.listLabel, this.onChanged});
  final int length;
  final List<String> listLabel;
  final double width;
  final Function(int) onChanged;
  @override
  _SegmentControlWidgetState createState() => _SegmentControlWidgetState();
}

class _SegmentControlWidgetState extends State<SegmentControlWidget> {
  Map<int, Widget> _children;
  int segmentedControlValue = 0;
  @override
  void initState() {
    _children = List.generate(
        widget.listLabel == null ? widget.length : widget.listLabel.length,
        (index) => Text(
              widget.listLabel == null
                  ? '$index'
                  : '${widget.listLabel[index]}',
              style:
                  AppWidget.simpleTextFieldStyle(height: 15.85, fontSize: 13),
            )).asMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: MaterialSegmentedControl(
        children: _children,
        horizontalPadding: const EdgeInsets.symmetric(horizontal: 0),
        selectionIndex: segmentedControlValue,
        borderColor: const Color(0xFF0F73EE),
        selectedColor: const Color(0xFF0F73EE),
        unselectedColor: Colors.white,
        borderRadius: 6,
        onSegmentChosen: (int index) {
          setState(() {
            segmentedControlValue = index;
            widget.onChanged(index);
          });
        },
      ),
    );
  }
}
