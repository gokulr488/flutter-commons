import 'package:flutter/material.dart';

class SearchableTextBox extends StatefulWidget {
  const SearchableTextBox(
      {super.key,
      required this.searchables,
      required this.onSelected,
      this.hintText,
      this.onTapped,
      this.onClear,
      this.onChanged,
      this.searchBoxHeight,
      this.searchBoxWidth,
      this.searchBarBgColor,
      this.borderSideColor});
  final List<dynamic> searchables;
  final Function(dynamic) onSelected;
  final Function(String)? onChanged;
  final String? hintText;
  final VoidCallback? onTapped;
  final VoidCallback? onClear;
  final double? searchBoxHeight;
  final double? searchBoxWidth;
  final Color? searchBarBgColor;
  final Color? borderSideColor;

  @override
  State<SearchableTextBox> createState() => _SearchableTextBoxState();
}

class _SearchableTextBoxState extends State<SearchableTextBox> {
  List<dynamic> suggestions = [];
  SearchController controller = SearchController();
  @override
  void initState() {
    // Flutter bug workAround. try moving this code to "onChanged" handler method of searchBar later
    controller.addListener(() {
      suggestions = widget.searchables
          .where((element) => element
              .toString()
              .toLowerCase()
              .contains(controller.text.toLowerCase()))
          .toList();
      if (widget.onChanged != null) widget.onChanged!(controller.text);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: widget.searchBoxHeight ?? screenSize.height * 0.045,
      width: widget.searchBoxWidth,
      child: SearchAnchor(
          // viewSide: const BorderSide(color: Colors.white70),
          viewShape: const LinearBorder(
              // side: BorderSide(color: Colors.blue),
              // bottom: LinearBorderEdge(),
              ),
          viewBackgroundColor: const Color(0xff11161b), //pass cheyyanam
          searchController: controller,
          viewHintText: widget.hintText,
          builder: (context, controller) {
            return SearchBar(
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.008,
                ),
              ),
              surfaceTintColor:
                  const MaterialStatePropertyAll(Colors.transparent),
              shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              side: widget.borderSideColor != null
                  ? MaterialStateProperty.all(BorderSide(
                      width: 0.5,
                      color: widget.borderSideColor!,
                    ))
                  : MaterialStateProperty.all(null),
              shape: MaterialStateProperty.all(
                const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                  widget.searchBarBgColor ??
                      Theme.of(context)
                          .colorScheme
                          .onInverseSurface
                          .withOpacity(0.5)),
              controller: controller,
              onTap: () {
                if (widget.onTapped != null) widget.onTapped!();
                controller.openView();
              },
              leading: Row(
                children: [
                  Icon(Icons.search,
                      size: MediaQuery.of(context).size.width * 0.010),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: VerticalDivider(thickness: 0.25),
                  ),
                ],
              ),
              trailing: [
                IconButton(
                  onPressed: () {
                    controller.clear();
                    if (widget.onClear != null) widget.onClear!();
                  },
                  icon: Row(
                    children: [
                      Icon(Icons.clear_outlined,
                          size: MediaQuery.of(context).size.width * 0.010),
                    ],
                  ),
                ),
              ],
              hintText: widget.hintText,
            );
          },
          suggestionsBuilder: (context, controller) {
            return List<ListTile>.generate(suggestions.length, (int index) {
              dynamic item = suggestions[index];
              return ListTile(
                title: Text(item.toString()),
                onTap: () {
                  controller.closeView(item.toString());
                  widget.onSelected(item);
                },
              );
            });
          }),
    );
  }
}
