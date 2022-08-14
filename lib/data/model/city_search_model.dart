class CitySearchResult {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  CitySearchResult(
      {this.name,
        this.localNames,
        this.lat,
        this.lon,
        this.country,
        this.state});

  CitySearchResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? new LocalNames.fromJson(json['local_names'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.localNames != null) {
      data['local_names'] = this.localNames!.toJson();
    }
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['country'] = this.country;
    data['state'] = this.state;
    return data;
  }
}

class LocalNames {
  String? zh;
  String? et;
  String? vi;
  String? uk;
  String? pt;
  String? fr;
  String? en;
  String? ja;
  String? ru;
  String? de;

  LocalNames(
      {this.zh,
        this.et,
        this.vi,
        this.uk,
        this.pt,
        this.fr,
        this.en,
        this.ja,
        this.ru,
        this.de});

  LocalNames.fromJson(Map<String, dynamic> json) {
    zh = json['zh'];
    et = json['et'];
    vi = json['vi'];
    uk = json['uk'];
    pt = json['pt'];
    fr = json['fr'];
    en = json['en'];
    ja = json['ja'];
    ru = json['ru'];
    de = json['de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zh'] = this.zh;
    data['et'] = this.et;
    data['vi'] = this.vi;
    data['uk'] = this.uk;
    data['pt'] = this.pt;
    data['fr'] = this.fr;
    data['en'] = this.en;
    data['ja'] = this.ja;
    data['ru'] = this.ru;
    data['de'] = this.de;
    return data;
  }
}