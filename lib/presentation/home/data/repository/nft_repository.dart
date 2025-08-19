import 'package:artora/presentation/home/data/model/nft.dart';
import 'package:artora/shared/service/json_data_service.dart';

class NftRepository {
  final JsonDataService _jsonDataService;
  NftRepository(this._jsonDataService);

  Future<List<Nft>> loadNft() async {
    return _jsonDataService.loadNft();
  }

}