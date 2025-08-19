import 'package:artora/core/constants.dart';
import 'package:artora/presentation/stats/widget/activity_page.dart';
import 'package:artora/presentation/stats/widget/ranking_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Stats", style: theme.textTheme.titleLarge),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset("${AppConstants.baseUrl}title.png"),
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            dividerColor: Colors.grey.shade800,
            indicator: ShapeDecoration(
              shape: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.purple,
                  width: 2,
                  style: BorderStyle.solid
                ),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bar_chart_rounded),
                    Gap(8),
                    Text("Ranking"),
                  ],
                ),
              ),
              Tab(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.stacked_line_chart_rounded),
                    Gap(8),
                    Text("Activity"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RankingPage(),
            ActivityPage()
          ],
        ),
      ),
    );
  }
}
