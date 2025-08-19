import 'package:artora/core/constants.dart';
import 'package:artora/presentation/home/data/model/home_page_data.dart';
import 'package:artora/presentation/home/data/model/nft.dart';
import 'package:artora/presentation/home/data/repository/nft_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final NftRepository _nftRepository;
  HomeProvider(this._nftRepository){
    fetchNft();
  }

  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  HomePageData get homePageData => _homePageData;

  List<Nft> _nft = [];
  List<Nft> get nft => _nft;

  fetchNft() async {
    try {
      _nft = await _nftRepository.loadNft();
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to fetching Nft: ${e.toString()}");
    }
    notifyListeners();
  }

  List<Nft> getStoryData() {
    return _nft.where(
      (nft) => homePageData.storyData.contains(nft.id),
    ).toList();
  }

  List<String> getStoryImage() {
    return getStoryData().map(
      (nft) => "${AppConstants.baseUrl}${nft.imageUrl}",
    ).toList();
  }

  List<String> getStoryTitle() {
    return getStoryData().map(
      (nft) => nft.name 
    ).toList();
  }

  List<Nft> getTrendingData() {
    return _nft.where(
      (nft) => homePageData.trendingData.contains(nft.id),
    ).toList();
  }

  List<Nft> getTopData() {
    return _nft.where(
      (nft) => homePageData.topData.contains(nft.id),
    ).toList();
  }

}