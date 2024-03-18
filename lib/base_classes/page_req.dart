import 'package:talos_commons/base_classes/pagination_detail.dart';
import 'package:talos_commons/base_classes/search_detail.dart';

class PageReq {
  PageReq(
      {this.paginationDetail,
      this.searchDetail,
      this.createdBy,
      this.updatedBy});

  PaginationDetail? paginationDetail;
  SearchDetail? searchDetail;
  String? createdBy;
  String? updatedBy;
}
