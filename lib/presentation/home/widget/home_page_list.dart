import 'package:artora/presentation/home/data/model/nft.dart';
import 'package:artora/presentation/home/widget/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePageList extends StatelessWidget {
  final String title;
  final List<Nft> nft;
  const HomePageList({super.key, required this.nft, required this.title});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Gap(16),
        SizedBox(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: nft.length,
            itemExtent: 220,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            cacheExtent: 500,
            itemBuilder: (context, index) {
              final item = nft[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: NftCard(
                  key: ValueKey(item.id),
                  nft: item,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}