import 'package:artora/presentation/stats/stats_provider.dart';
import 'package:artora/presentation/stats/widget/stats_list.dart';
import 'package:artora/shared/widget/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:artora/shared/widget/custom_button.dart';
import 'package:provider/provider.dart';

/// A page that displays NFT rankings with filtering options
class RankingPage extends StatelessWidget {
  static const double _padding = 16.0;

  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        // Filter buttons section
        SliverPadding(
          padding: const EdgeInsets.all(_padding),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    theme: theme,
                    text: "All categories",
                    icon: Icons.category_rounded,
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: CustomButton(
                    theme: theme,
                    text: "All Chains",
                    icon: Icons.link_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Stats list section
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: _padding),
          sliver: SliverToBoxAdapter(
            child: GlassMorphism(
              backgroundColor: theme.colorScheme.primary,
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Consumer<StatsProvider>(
                  builder: (context, provider, _) => provider.stats.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : StatsList(stats: provider.stats),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
