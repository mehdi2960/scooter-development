TripCost otpFromJson(Map<String, dynamic> json) => TripCost.fromJson(json);

class TripCost {
  TripCost({required this.cost});

  factory TripCost.fromJson(Map<String, dynamic> json) {
    return TripCost(cost: json['message'] as int?);
  }
  int? cost;
}
