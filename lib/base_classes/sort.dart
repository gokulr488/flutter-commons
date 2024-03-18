import 'dart:convert';

class Sort {
  Sort({
    this.sorted,
    this.unsorted,
    this.empty,
  });

  factory Sort.fromRawJson(String str) => Sort.fromJson(json.decode(str));

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json['sorted'],
        unsorted: json['unsorted'],
        empty: json['empty'],
      );

  String toRawJson() => json.encode(toJson());

  bool? sorted;
  bool? unsorted;
  bool? empty;

  Map<String, dynamic> toJson() => {
        'sorted': sorted,
        'unsorted': unsorted,
        'empty': empty,
      };
}
