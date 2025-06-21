class Place {
  final int id;
  final String placeName;
  final String address;
  final String img;

  Place({
    required this.id,
    required this.placeName,
    required this.address,
    required this.img,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      placeName: json['placeName'],
      address: json['address'],
      img: json['img'],
    );
  }
}