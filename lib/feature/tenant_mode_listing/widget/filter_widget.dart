import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/log_in_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';

mixin FilterWidget {
  static Widget createAppBar({BuildContext context}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      brightness: Brightness.light,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close,
            size: 24,
            color: Color(0xFF020433),
          ),
        ),
      ),
      title: Text(
        'Filter',
        style: AppWidget.boldTextFieldStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 19.5,
            color: const Color(0xFF020433)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Clear Filter',
                style: AppWidget.simpleTextFieldStyle(
                    fontSize: 14,
                    height: 17.07,
                    color: const Color(0xFF0F73EE)),
              )
            ],
          ),
        )
      ],
    );
  }

  static Widget createTitle({String text, double top, double bottom}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: top ?? 0, bottom: bottom ?? 0),
        child: LogInWidget.createTextWidget(
            input: text, color: const Color(0xFF020433)),
      ),
    );
  }

  static Widget createItemOption({OptionModel optionModel}) {
    return FittedBox(
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: optionModel.isSelected
                    ? const Color(0xFF0F73EE)
                    : Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    width: 1,
                    color: optionModel.isSelected
                        ? const Color(0xFF0F73EE)
                        : const Color(0xFFF0F0F0))),
            child: Image.asset(
              '${optionModel.image}',
              color: optionModel.isSelected
                  ? Colors.white
                  : const Color(0xFF020433),
            ),
          ),
          Text(
            optionModel.text,
            maxLines: 2,
            style: AppWidget.simpleTextFieldStyle(
                fontSize: 12,
                height: 14.63,
                color: optionModel.isSelected
                    ? const Color(0xFF0F73EE)
                    : const Color(0xFF020433)),
          )
        ],
      ),
    );
  }

  static Widget createOption(
      {BuildContext context,
      double width,
      List<OptionModel> list,
      List<String> routes}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        mainAxisSpacing: 24,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(routes[index]);
            },
            child: FilterWidget.createItemOption(optionModel: list[index]));
      },
    );
  }

  static Widget createIndicator({int currentImage, List<dynamic> listImage}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(listImage.length, (index) {
          return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 15 / (index + 2),
              width: 15 / (index + 2),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (index == currentImage)
                      ? const Color(0xFFFFFFFF)
                      : const Color.fromRGBO(255, 255, 255, 0.5)));
        }));
  }
}
