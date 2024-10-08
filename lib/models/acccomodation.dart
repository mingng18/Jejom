class Accommodation {
  final String accomWebsite;
  final String address;
  final String description;
  final String googleMapsURL;
  final String googlePlaceID;
  final double latitude;
  final double longitude;
  final String name;
  final int numRating;
  final List<String> openingHours;
  final List<String> photos;
  final String price;
  final String rating;
  final String endDate;
  final String startDate;

  Accommodation({
    required this.accomWebsite,
    required this.address,
    required this.description,
    required this.googleMapsURL,
    required this.googlePlaceID,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.numRating,
    required this.openingHours,
    required this.photos,
    required this.price,
    required this.rating,
    required this.endDate,
    required this.startDate,
  });

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return Accommodation(
      accomWebsite: json['AccomodationWebsiteURL'] ?? 'Unknown',
      address: json['Address'] ?? 'Unknown',
      description: json['Description'] ?? 'No description available',
      googleMapsURL: json['GoogleMapsURL'] ?? 'Unknown',
      googlePlaceID: json['GooglePlaceID'] ?? 'Unknown',
      latitude: double.tryParse(json['Latitude']?.toString() ?? '') ?? 0.0,
      longitude: double.tryParse(json['Longitude']?.toString() ?? '') ?? 0.0,
      name: json['Name'] ?? 'Unknown',
      numRating: json['NumRating'] ?? 0,
      openingHours: json['OpeningHours'] != null
          ? List<String>.from(json['OpeningHours'].map((x) => x))
          : [],
      photos: json['Photos'] != null
          ? List<String>.from(json['Photos'].map((x) => (x)))
          : [],
      price: json['Price'] ?? 'Unknown',
      rating: json['Rating'] ?? 'Unknown',
      endDate: json['endDate'] ?? 'Unknown',
      startDate: json['startDate'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AccomodationWebsiteURL': accomWebsite,
      'Address': address,
      'Description': description,
      'GoogleMapsURL': googleMapsURL,
      'GooglePlaceID': googlePlaceID,
      'Latitude': latitude,
      'Longitude': longitude,
      'Name': name,
      'NumRating': numRating,
      'OpeningHours': openingHours,
      'Photos': photos,
      'Price': price,
      'Rating': rating,
      'endDate': endDate,
      'startDate': startDate,
    };
  }

  Accommodation copyWith({
    String? accomWebsite,
    String? address,
    String? description,
    String? googleMapsURL,
    String? googlePlaceID,
    double? latitude,
    double? longitude,
    String? name,
    int? numRating,
    List<String>? openingHours,
    List<String>? photos,
    String? price,
    String? rating,
    String? endDate,
    String? startDate,
  }) {
    return Accommodation(
      accomWebsite: accomWebsite ?? this.accomWebsite,
      address: address ?? this.address,
      description: description ?? this.description,
      googleMapsURL: googleMapsURL ?? this.googleMapsURL,
      googlePlaceID: googlePlaceID ?? this.googlePlaceID,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      numRating: numRating ?? this.numRating,
      openingHours: openingHours ?? this.openingHours,
      photos: photos ?? this.photos,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
    );
  }
}
