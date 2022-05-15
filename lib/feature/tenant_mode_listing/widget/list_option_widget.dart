import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';

import '../bloc/list_option/bloc_list_option.dart';
import '../widget/filter_widget.dart';

class ListOptionWidget extends StatefulWidget {
  const ListOptionWidget({this.sampleData, this.listSelected, this.onSelected});
  final List<OptionModel> sampleData;
  final List<OptionModel> listSelected;
  final Function(List<String>) onSelected;
  @override
  _ListOptionWidgetState createState() => _ListOptionWidgetState();
}

class _ListOptionWidgetState extends State<ListOptionWidget> {
  List<OptionModel> listSelected = [];
  List<String> myList = [];
  @override
  void initState() {
    listSelected = widget.listSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListOptionBloc, ListOptionState>(
      bloc: BlocProvider.of<ListOptionBloc>(context),
      builder: (context, state) {
        if (state is ItemSelectedState) {
          listSelected = state.listSelected;
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 3,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: widget.sampleData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  myList.contains(widget.sampleData[index].text)
                      ? myList.remove(widget.sampleData[index].text)
                      : myList.add(widget.sampleData[index].text);

                  BlocProvider.of<ListOptionBloc>(context).add(
                      ItemSelectedEvent(
                          listOption: widget.sampleData,
                          listSelected: listSelected,
                          indexItemSelected: index));

                  widget.onSelected(myList);
                  // print(myList);
                },
                child: FilterWidget.createItemOption(
                    optionModel: widget.sampleData[index]));
          },
        );
      },
    );
  }
}
