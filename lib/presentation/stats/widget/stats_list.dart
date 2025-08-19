import 'package:artora/presentation/stats/data/model/stats.dart';
import 'package:artora/presentation/stats/widget/stats_item.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of stats items
class StatsList extends StatelessWidget {
  static const double _itemHeight = 80.0;
  
  /// The list of stats to display
  final List<Stats> stats;

  const StatsList({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: stats.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemExtent: _itemHeight,
      cacheExtent: _itemHeight * 5, // Cache 5 items ahead
      itemBuilder: (context, index) => StatsItem(stats: stats[index]),
    );
  }
}