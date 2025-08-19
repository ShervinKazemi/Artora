import 'package:artora/core/constants.dart';
import 'package:artora/presentation/home/data/model/nft.dart';
import 'package:artora/shared/widget/glassmorphism.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NftCard extends StatelessWidget {
  final Nft nft;
  const NftCard({super.key, required this.nft});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 220,
      child: GlassMorphism(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "${AppConstants.baseUrl}${nft.imageUrl}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nft.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.heart_fill, color: Colors.red),
                      Text(
                        "200",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
