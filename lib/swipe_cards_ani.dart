import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget/getdiscover/getdiscover_cubit.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeCardsAnimation extends StatefulWidget {
  const SwipeCardsAnimation({super.key});

  @override
  State<SwipeCardsAnimation> createState() => _SwipeCardsAnimationState();
}

class _SwipeCardsAnimationState extends State<SwipeCardsAnimation> {
  final ValueNotifier<List<SwipeItem>> _swipeItems = ValueNotifier<List<SwipeItem>>([]);
  MatchEngine? _matchEngine;

  @override
  void initState() {
    super.initState();
    context.read<GetDiscoverCubit>().getDiscover();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetDiscoverCubit, GetDiscoverState>(
      listener: (context, state) {
        if (state is GetDiscoverError) {
          log("Error: ${state.error}");
        }

        if (state is GetDiscoverLoaded) {
          final profileData = state.model.profiledata ?? [];
          final newSwipeItems = profileData.map((profile) {
            return SwipeItem(
              content: profile,
              likeAction: () {
                log('Liked: ${profile.username}');
              },
              nopeAction: () {
                log('Nope: ${profile.username}');
              },
              superlikeAction: () {
                log('Superliked: ${profile.superLikes}');
              },
            );
          }).toList();

          _swipeItems.value = newSwipeItems;
          _matchEngine = MatchEngine(swipeItems: newSwipeItems);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Swipe Cards'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<SwipeItem>>(
                valueListenable: _swipeItems,
                builder: (context, swipeItems, child) {
                  if (swipeItems.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
              
                  return SwipeCards(
                    matchEngine: _matchEngine!,
                    onStackFinished: () {
                      log('No more cards!');
                    },
                    itemBuilder: (context, index) {
                      final profile = swipeItems[index].content;
                      return Center(
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(profile.fullname, style: const TextStyle(fontSize: 24)),
                              Text(profile.gender, style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_down, color: Colors.red),
                    onPressed: () {
                      _matchEngine?.currentItem?.nope();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.star, color: Colors.blue),
                    onPressed: () {
                      _matchEngine?.currentItem?.superLike();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.thumb_up, color: Colors.green),
                    onPressed: () {
                      _matchEngine?.currentItem?.like();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
