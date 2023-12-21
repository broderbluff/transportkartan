class FerryLine {
  final String destination;
  final String country;

  const FerryLine({
    required this.destination,
    required this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      'destination': destination,
      'country': country,
    };
  }

  factory FerryLine.fromJson(Map<String, dynamic> json) {
    return FerryLine(
      destination: json['destination'],
      country: json['country'],
    );
  }

  FerryLine copyWith({
    String? destination,
    String? country,
  }) {
    return FerryLine(
      destination: destination ?? this.destination,
      country: country ?? this.country,
    );
  }
}
