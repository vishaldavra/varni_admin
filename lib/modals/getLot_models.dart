class GetLot {
  String? c00;
  String? c000;
  String? c0;
  String? c1;
  String? c2;
  String? c3;

  GetLot({this.c00, this.c000, this.c0, this.c1, this.c2, this.c3});

  GetLot.fromJson(Map<String, dynamic> json) {
    c00 = json['c00'];
    c000 = json['c000'];
    c0 = json['c0'];
    c1 = json['c1'];
    c2 = json['c2'];
    c3 = json['c3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c00'] = this.c00;
    data['c000'] = this.c000;
    data['c0'] = this.c0;
    data['c1'] = this.c1;
    data['c2'] = this.c2;
    data['c3'] = this.c3;
    return data;
  }
}
