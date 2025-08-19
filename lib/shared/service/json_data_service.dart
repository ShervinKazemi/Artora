import 'dart:convert';

import 'package:artora/core/constants.dart';
import 'package:artora/presentation/home/data/model/nft.dart';
import 'package:artora/presentation/stats/data/model/stats.dart';
import 'package:flutter/services.dart';

class JsonDataService {
  Future<List<Nft>> loadNft() async {
    final String response = await rootBundle.loadString(AppConstants.nftJson);
    final Map<String, dynamic> jsonData = json.decode(response);
    final List<dynamic> nftList = jsonData["NFT"];
    return nftList
        .map((nft) => Nft.fromJson(nft as Map<String, dynamic>))
        .toList();
  }

  Future<List<Stats>> loadStats() async {
    final String response = await rootBundle.loadString(AppConstants.statsJson);
    final Map<String, dynamic> jsonData = json.decode(response);
    final List<dynamic> statsList = jsonData["Stats"];
    return statsList
        .map((stats) => Stats.fromJson(stats as Map<String, dynamic>))
        .toList();
  }
}
