import 'package:artora/presentation/stats/data/model/stats.dart';
import 'package:artora/shared/service/json_data_service.dart';

class StatsRepository {
  final JsonDataService _jsonDataService;
  StatsRepository(this._jsonDataService);

  Future<List<Stats>> loadStats() {
    return _jsonDataService.loadStats();
  }

}