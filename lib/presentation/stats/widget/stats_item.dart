import 'package:artora/core/constants.dart';
import 'package:artora/presentation/stats/data/model/stats.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatsItem extends StatelessWidget {
  static const double _imageSize = 50.0;
  static const double _ethIconSize = 20.0;
  
  final Stats stats;
  const StatsItem({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositiveChange = stats.chance >= 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  "${stats.id}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "${AppConstants.baseUrl}${stats.imageUrl}",
                    width: _imageSize,
                    height: _imageSize,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        stats.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(4),
                      Text(
                        "View info",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/image/eth.png",
                      width: _ethIconSize,
                      height: _ethIconSize,
                      color: Colors.grey,
                    ),
                    const Gap(4),
                    Text(
                      _formatPrice(stats.price),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(4),
                // Change percentage
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPositiveChange 
                          ? Icons.trending_up_rounded
                          : Icons.trending_down_rounded,
                      color: isPositiveChange ? Colors.green : Colors.red,
                      size: 16,
                    ),
                    const Gap(4),
                    Text(
                      "${stats.chance.abs().toStringAsFixed(2)}%",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isPositiveChange ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double price) {
    if (price >= 1000000) {
      return (price / 1000000).toStringAsFixed(2);
    } else if (price >= 1000) {
      return (price / 1000).toStringAsFixed(2);
    } else {
      return price.toStringAsFixed(2);
    }
  }
}
