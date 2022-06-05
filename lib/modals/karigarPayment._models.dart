class KarigarPayment {
  String? id;
  String? name;
  String? mobile;
  String? amo;
  String? clKey;
  String? date;
  String? time;

  KarigarPayment({this.id, this.name, this.mobile, this.amo, this.clKey, this.date, this.time});

  KarigarPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    amo = json['amo'];
    clKey = json['cl_key'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['amo'] = this.amo;
    data['cl_key'] = this.clKey;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
