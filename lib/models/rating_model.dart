class Rating {
  num rate;
  dynamic count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<dynamic, dynamic> json) {
    return Rating(rate: json['rate'], count: json['count']);
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'rate': this.rate,
      'count': this.count,
    };
  }
}
