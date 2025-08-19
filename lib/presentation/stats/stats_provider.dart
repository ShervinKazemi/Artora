import 'package:artora/presentation/stats/data/model/stats.dart';
import 'package:artora/presentation/stats/data/repository/stats_repository.dart';
import 'package:flutter/widgets.dart';

class StatsProvider with ChangeNotifier {
  final StatsRepository _statsRepository;
  StatsProvider(this._statsRepository) {
    fetchStats();
  }

  List<Stats> _stats = [];
  List<Stats> get stats => _stats;

  fetchStats() async {
    try{
      _stats = await _statsRepository.loadStats();
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to fetching Stats: $e");
    }
    notifyListeners();
  } 

}