import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

class FriendPostListView extends StatelessWidget {
// 1
  final List<Post>? friendPosts;
  const FriendPostListView({Key? key, this.friendPosts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
// 2
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
// 3
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// 4
          Text('Social Chefs! ', style: Theme.of(context).textTheme.headline1),
// 5
          const SizedBox(height: 16),
// TODO: Add PostListView here
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final post = friendPosts?[index];
              return FriendPostTile(
                post: post,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: friendPosts!.length,
          ),

          const SizedBox(height: 16),
        ]));
  }
}
