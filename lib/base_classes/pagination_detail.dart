import 'dart:convert';

class PaginationDetail {
  PaginationDetail({
    this.order,
    this.page,
    this.pageable,
    this.size,
    this.sort,
  });
  factory PaginationDetail.fromRawJson(String str) =>
      PaginationDetail.fromJson(json.decode(str));
  factory PaginationDetail.fromJson(Map<String, dynamic> json) =>
      PaginationDetail(
        order: json['order'],
        page: json['page'],
        pageable: json['pageable'],
        size: json['size'],
        sort: json['sort'],
      );

  String? order;
  int? page;
  bool? pageable;
  int? size;
  String? sort;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (order != null) map['order'] = order;
    if (page != null) map['page'] = page;
    if (pageable != null) map['pageable'] = pageable;
    if (size != null) map['size'] = size;
    if (sort != null) map['sort'] = sort;

    return map;
  }
}
