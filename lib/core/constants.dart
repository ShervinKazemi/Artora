import 'package:artora/presentation/home/data/model/home_page_data.dart';
import 'package:flutter/material.dart';

class Appcolors {
  static const Color primary = Color(0xFF211134);
  static const Color lightText = Colors.white;
}

class AppConstants {
  static const String baseUrl = "assets/image/";
  static const String nftJson = "assets/data/nft.json";
  static const String statsJson = "assets/data/stats.json";
}

class HomePageDataConstants {
  static const List<String> _storyData = ["1" , "2" , "3"];
  static const List<String> _trendingData = ["4" , "5" , "6"];
  static const List<String> _topData = ["7" , "8" , "9"];

  static HomePageData get homePageData => HomePageData(
    storyData: _storyData,
    trendingData: _trendingData,
    topData: _topData
  );

}
