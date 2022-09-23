import '../models/realestatemodel.dart';

abstract class RealEstatesRepo {
  Future<List<RealEstate>> getRealEstateList();
}

class RealEstateServices implements RealEstatesRepo {
  static const _baseUrl = 'dummytesturl.com';
  static const String _GET_REALESTATES = '/realestates';

  @override
  Future<List<RealEstate>> getRealEstateList() async {
    //TODO: For network communication uncomment and use this:

    // Uri uri = Uri.https(_baseUrl, _GET_REALESTATES);
    // Response response = await http.get(uri);
    // List<RealEstate> realEstates = realEstatesFromJson(response.body);
    // TODO: toJson is missing for RealEstate model!

    List<RealEstate> realEstates = [];


    //TODO: For firebase implementation:
    // await Firestore.instance.collection("dummyrealestates").getDocuments().then(
    //       (QuerySnapshot snapshot) =>
    //       snapshot.documents.forEach(
    //               (data) =>
    //
    //               realEstates.add(RealEstate.fromMap(data))
    //       ),
    // );

    // add dummy data instead
    await Future.delayed(const Duration(seconds: 2));
    realEstates.add(RealEstate(name: 'Sus', minPrice: 1200000, maxPrice: 5400000, isNotificationEnabled: true, privateAdvertisersOnly: false));


    return
    realEstates;
  }
}
