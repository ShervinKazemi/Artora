import 'package:artora/app.dart';
import 'package:artora/presentation/home/data/repository/nft_repository.dart';
import 'package:artora/presentation/home/home_provider.dart';
import 'package:artora/presentation/stats/data/repository/stats_repository.dart';
import 'package:artora/presentation/stats/stats_provider.dart';
import 'package:artora/shared/service/json_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  final JsonDataService jsonDataService = JsonDataService();

  final NftRepository nftRepository = NftRepository(jsonDataService);
  final StatsRepository statsRepository = StatsRepository(jsonDataService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(nftRepository),
        ),
        ChangeNotifierProvider(
          create: (context) => StatsProvider(statsRepository)
        )
      ],
      child: const App(),
    )
  );
}