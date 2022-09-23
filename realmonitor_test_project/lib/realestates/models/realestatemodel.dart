

class RealEstate {
  String name;
  int minPrice;
  int maxPrice;
  bool isNotificationEnabled;
  bool privateAdvertisersOnly;

  RealEstate(
      {required this.name,
      required this.minPrice,
      required this.maxPrice,
      required this.isNotificationEnabled,
      required this.privateAdvertisersOnly});




  factory RealEstate.fromMap(Map<String, dynamic> map) {
    return RealEstate(
      name: map['name'],
      minPrice: map['minPrice'],
      maxPrice: map['maxPrice'],
      isNotificationEnabled: map['isNotificationEnabled'].ToString() == 'true',
      privateAdvertisersOnly: map['privateAdvertisersOnly'].ToString == 'true',
    );
  }



}
