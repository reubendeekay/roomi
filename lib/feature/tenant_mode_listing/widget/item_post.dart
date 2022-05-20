import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roomy/common/bloc/like_post/bloc_like_post.dart';
import 'package:roomy/feature/on_boarding/bloc/bloc_slider.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/providers/auth_provider.dart';
import 'package:roomy/providers/post_provider.dart';
import 'package:roomy/providers/wishlist_provider.dart';

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

  bool isLiked() {
    final userRef = Provider.of<AuthProvider>(context, listen: false).user;

    return userRef.wishlist.contains(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context, listen: false).user;
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
                if (user.isAdmin)
                  Positioned(
                      top: 18,
                      right: 17,
                      child: InkWell(
                        child: Icon(Icons.delete, color: Colors.red),
                        onTap: () {
                          Provider.of<PostProvider>(context, listen: false)
                              .deletePost(widget.post.id);
                        },
                      )),
                if (!user.isAdmin)
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
                          onTap: () async {
                            await Provider.of<WishlistProvider>(context,
                                    listen: false)
                                .addToWishList(widget.post.id, isLiked());
                            setState(() {});
                          },
                          child: Image.asset(
                            isLiked()
                                ? 'images/tenant_mode/ic_wishlist_active@3x.png'
                                : 'images/tenant_mode/ic_tab_bookmark@3x.png',
                            width: 22,
                            height: 20,
                            color: isLiked()
                                ? const Color(0xFFFC2F39)
                                : Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ));
  }
}
