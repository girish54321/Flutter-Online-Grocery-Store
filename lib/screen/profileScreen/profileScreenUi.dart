import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ProfileScreenUi extends StatelessWidget {
  const ProfileScreenUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 36,
              ),
              title: Text("User Name"),
              subtitle: Text("user@gmail.com"),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onLongPress: () {},
                    leading: Container(
                        width: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          FluentIcons.building_shop_24_regular,
                          color: Colors.black,
                        )),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    title: Text("User Name"),
                    subtitle: Text("user@gmail.com"),
                  ),
                  Divider(height: 1)
                ],
              );
            }, childCount: 8),
          )
        ],
      )),
    );
  }
}
