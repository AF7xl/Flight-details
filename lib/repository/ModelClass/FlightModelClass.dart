class FlightModelClass {
  FlightModelClass({
      this.version, 
      this.rows,});

  FlightModelClass.fromJson(dynamic json) {
    version = json['version'];
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(Rows.fromJson(v));
      });
    }
  }
  int? version;
  List<Rows>? rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = version;
    if (rows != null) {
      map['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Rows {
  Rows({
      this.name, 
      this.code, 
      this.icao,});

  Rows.fromJson(dynamic json) {
    name = json['Name'];
    code = json['Code'];
    icao = json['ICAO'];
  }
  String? name;
  String? code;
  String? icao;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['Code'] = code;
    map['ICAO'] = icao;
    return map;
  }

}