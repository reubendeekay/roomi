import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/common/bloc/like_post/bloc_like_post.dart';
import 'package:roomy/feature/on_boarding/bloc/bloc_slider.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/filter_widget.dart';

class ItemPost extends StatefulWidget {
  const ItemPost({this.post, this.height, this.index});
  final PostModel post;
  final int index;
  final double height;
  @override
  _ItemPostState createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    final SliderBloc counterBloc = BlocProvider.of<SliderBloc>(context);
    return SizedBox(
        height: widget.height / 3.5,
        child: BlocBuilder<SliderBloc, int>(
          bloc: counterBloc,
          builder: (context, imageIndex) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  itemCount: widget.post.images.length,
                  onPageChanged: (value) {
                    currentImage = value;
                    if (value > currentImage) {
                      counterBloc.add(SliderEvent.swipeRight);
                    } else {
                      counterBloc.add(SliderEvent.swipeLeft);
                    }
                  },
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          widget.post.images[index],
                          height: 240,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    );
                  },
                ),
                Positioned(
                  top: 18,
                  right: 17,
                  child: BlocBuilder<LikePostBloc, LikePostState>(
                    bloc: BlocProvider.of<LikePostBloc>(context),
                    builder: (context, state) {
                      if (state is LikePostSelectedState) {
                        widget.post.selected =
                            state.listPost[widget.index]['liked'];
                      }
                      return GestureDetector(
                        onTap: () {
                          widget.post.selected = !widget.post.selected;
                          BlocProvider.of<LikePostBloc>(context).add(
                              LikePostPressed(
                                  liked: widget.post.selected,
                                  id: widget.post.id));
                        },
                        child: Image.asset(
                          widget.post.selected
                              ? 'images/tenant_mode/ic_wishlist_active@3x.png'
                              : 'images/tenant_mode/ic_tab_bookmark@3x.png',
                          width: 22,
                          height: 20,
                          color: widget.post.selected
                              ? const Color(0xFFFC2F39)
                              : Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 16,
                    child: FilterWidget.createIndicator(
                        currentImage: currentImage,
                        listImage: widget.post.images)),
              ],
            );
          },
        ));
  }
}
