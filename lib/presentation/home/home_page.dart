import 'package:artora/core/constants.dart';
import 'package:artora/presentation/home/home_provider.dart';
import 'package:artora/presentation/home/widget/home_page_list.dart';
import 'package:artora/presentation/home/widget/story_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("NFT Marketplace", style: theme.textTheme.titleLarge),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset("${AppConstants.baseUrl}title.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  images: homeProvider.getStoryImage(),
                  titles: homeProvider.getStoryTitle(),
                );
              },
            ),
            Gap(16),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HomePageList(
                  nft: homeProvider.getTrendingData(),
                  title: "Trending collection",
                );
              },
            ),
            Gap(16),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HomePageList(
                  nft: homeProvider.getTopData(),
                  title: "Top seller",
                );
              },
            ),
            Gap(32)
          ],
        ),
      ),
    );
  }
}
