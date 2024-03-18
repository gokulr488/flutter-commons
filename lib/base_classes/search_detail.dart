import 'dart:convert';

import 'package:talos_commons/base_classes/search_by.dart';

class SearchDetail {
  SearchDetail({
    this.globalSearch,
    required this.searchBy,
  });

  factory SearchDetail.fromRawJson(String str) =>
      SearchDetail.fromJson(json.decode(str));

  factory SearchDetail.fromJson(Map<String, dynamic> json) => SearchDetail(
        globalSearch: json['globalSearch'],
        searchBy: List<SearchBy>.from(
            json['searchBy'].map((x) => SearchBy.fromJson(x))),
      );

  bool? globalSearch;
  List<SearchBy?> searchBy;
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'globalSearch': globalSearch,
        'searchBy': List<dynamic>.from(searchBy.map((x) => x?.toJson())),
      };
}
