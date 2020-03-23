import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:todeoyflutter/models/task.dart';

class SearchBox extends StatelessWidget {
  SearchBox({this.search, this.searchBarController});
  final SearchBarController searchBarController;

  final Function search;
  final bool isReplay = false;

  @override
  Widget build(BuildContext context) {
    return SearchBar<Task>(
      icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      iconActiveColor: Colors.white,
      searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
      headerPadding: EdgeInsets.symmetric(horizontal: 20),
      listPadding: EdgeInsets.symmetric(horizontal: 20),
      textStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(
        color: Colors.grey[100],
      ),
      hintText: "Search hint text",
      mainAxisSpacing: 10.0,
      cancellationWidget: Text(
        "Cancel",
        style: TextStyle(color: Colors.white),
      ),
      emptyWidget: Text("empty"),
      onSearch: search,
      onItemFound: (Task task, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 2.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: ListTile(
            title: Text(task.name),
            onTap: () {
              print(index);
            },
          ),
        );
      },
      onError: (error) {
        return Center(
          child: Text("Error occurred : $error"),
        );
      },
    );
  }
}
