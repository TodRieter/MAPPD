import 'package:flutter/material.dart';
import '../models/user_data.dart';

class UserDataPage extends StatefulWidget {
  final UserData user;
  const UserDataPage(this.user, {Key? key}) : super(key: key);

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  String name = '';
  String dateOfBirth = "";
  String favoriteUnreadBook = "";
  bool? expandByDefault;
  bool? filterRussellPosts;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(
          initialValue: UserData.getUsername(),
          decoration: const InputDecoration(
            labelText: "User Name",
            hintText: "enter a user name",
          ),
          textInputAction: TextInputAction.done,
          onChanged: (username) {
            setState(
              () => name = username,
            );
          },
        ),
        TextFormField(
          initialValue: UserData.getDateOfBirth(),
          decoration: const InputDecoration(
            labelText: "User Date of Birth",
            hintText: "enter a your Date of Birth",
          ),
          textInputAction: TextInputAction.done,
          onChanged: (dofB) {
            setState(
              () => dateOfBirth = dofB,
            );
          },
        ),
        TextFormField(
          initialValue: UserData.getFavoriteUnreadBook(),
          decoration: const InputDecoration(
            labelText: "Favorite Unread Book",
            hintText: "enter your Favorite Unread Book",
          ),
          textInputAction: TextInputAction.done,
          onChanged: (unreadBook) {
            setState(
              () => favoriteUnreadBook = unreadBook,
            );
          },
        ),
        TextFormField(
          initialValue: "",
          decoration: const InputDecoration(
            labelText: "Favorite Read Book",
            hintText: "This should be left Blank",
          ),
          readOnly: true,
        ),
        CheckboxListTile(
          title: const Text("Show Review"),
          value: expandByDefault ?? UserData.getExpandByDefault(),
          onChanged: (expandedByDefault) => setState(
            () => expandByDefault = expandedByDefault!,
          ),
        ),
        CheckboxListTile(
          title: const Text("Hide Bad Reviews"),
          value: filterRussellPosts ?? UserData.getFilterRussellPosts(),
          onChanged: (filterPosts) => setState(
            () => filterRussellPosts = filterPosts!,
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await UserData.setUsername(
                name == "" ? UserData.getUsername() : name);
            await UserData.setDateOfBirth(
              dateOfBirth == "" ? UserData.getDateOfBirth() : dateOfBirth,
            );
            await UserData.setFavoriteUnreadBook(favoriteUnreadBook == ""
                ? UserData.getFavoriteUnreadBook()
                : favoriteUnreadBook);

            await UserData.setExpandByDefault(
              expandByDefault ?? UserData.getExpandByDefault(),
            );
            await UserData.setFilterRussellPosts(
              filterRussellPosts ?? UserData.getFilterRussellPosts(),
            );
          },
          child: const Text("Save Data"),
        )
      ],
    );
  }
}
