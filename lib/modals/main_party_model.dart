class MainPartyModels {
  String? id;
  String? company;
  String? name;
  String? mobile;
  String? address;
  String? nSmall;
  String? nBig;
  String? gSmall;
  String? gBig;
  String? pKey;
  String? st;
  String? logo;

  MainPartyModels({this.id, this.company, this.name, this.mobile, this.address, this.nSmall, this.nBig, this.gSmall, this.gBig, this.pKey, this.st, this.logo});

  MainPartyModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    nSmall = json['n_small'];
    nBig = json['n_big'];
    gSmall = json['g_small'];
    gBig = json['g_big'];
    pKey = json['p_key'];
    st = json['st'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company'] = this.company;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['n_small'] = this.nSmall;
    data['n_big'] = this.nBig;
    data['g_small'] = this.gSmall;
    data['g_big'] = this.gBig;
    data['p_key'] = this.pKey;
    data['st'] = this.st;
    return data;
  }
}
