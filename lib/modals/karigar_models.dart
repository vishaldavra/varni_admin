class KarigarData {
  String? id;
  String? name;
  String? mobile;
  String? pass;
  String? adr;
  String? clKey;
  String? logo;
  String? lockCnt;
  String? login;
  String? bhav;
  String? job;
  String? date;

  KarigarData({this.id, this.name, this.mobile, this.pass, this.adr, this.clKey, this.logo, this.lockCnt, this.login, this.bhav, this.job, this.date});

  KarigarData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    pass = json['pass'];
    adr = json['adr'];
    clKey = json['cl_key'];
    logo = json['logo'];
    lockCnt = json['lock_cnt'];
    login = json['login'];
    bhav = json['bhav'];
    job = json['job'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['pass'] = pass;
    data['adr'] = adr;
    data['cl_key'] = clKey;
    data['logo'] = logo;
    data['lock_cnt'] = lockCnt;
    data['login'] = login;
    data['bhav'] = bhav;
    data['job'] = job;
    data['date'] = date;
    return data;
  }
}
