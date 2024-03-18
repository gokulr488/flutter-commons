import 'package:talos_commons/base_classes/sort.dart';

class PageResp {
  PageResp(
      {this.first,
      this.last,
      this.page,
      this.size,
      this.sort,
      this.totalElements,
      this.totalPages});
  int? page;
  int? size;
  int? totalElements;
  int? totalPages;
  bool? last;
  bool? first;
  Sort? sort;
}
