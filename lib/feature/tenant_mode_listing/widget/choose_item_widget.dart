import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/tenant_mode_listing/bloc/choose_item/bloc_choose_item.dart';
import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';
import '../widget/filter_widget.dart';

class ChooseItemWidget extends StatefulWidget {
  const ChooseItemWidget({this.sampleData, this.crossAxisCount, this.type});
  final List<OptionModel> sampleData;
  final int crossAxisCount;
  final Function(String) type;
  @override
  _ChooseItemWidgetState createState() => _ChooseItemWidgetState();
}

class _ChooseItemWidgetState extends State<ChooseItemWidget> {
  List<OptionModel> listOption = [];
  @override
  void initState() {
    listOption = widget.sampleData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: widget.crossAxisCount == null ? 1.5 : 1,
        crossAxisCount: widget.crossAxisCount ?? 2,
        mainAxisSpacing: 24,
      ),
      itemCount: listOption.length,
      itemBuilder: (context, index) {
        return BlocBuilder<ChooseItemBloc, ChooseItemState>(
          bloc: BlocProvider.of<ChooseItemBloc>(context),
          builder: (context, state) {
            if (state is ChooseItemSuccess) {
              // listOption = state.listOption;
            }
            return GestureDetector(
                onTap: () {
                  BlocProvider.of<ChooseItemBloc>(context).add(
                      ItemSelectedEvent(
                          indexSelected: index, listOption: listOption));

                  setState(() {
                    widget.type(listOption[index].text);
                  });
                  // setState(() {
                  //   for (var i = 0; i < listOption.length; i++) {
                  //     listOption[i].isSelected = true;
                  //   }
                  //   listOption[index].isSelected = false;
                  // });
                },
                child: FilterWidget.createItemOption(
                    optionModel: listOption[index]));
          },
        );
      },
    );
  }
}
