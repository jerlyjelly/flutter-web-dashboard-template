import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
      leading: Visibility(
        visible: ResponsiveWidget.isSmallScreen(context),
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            key.currentState.openDrawer();
          },
        ),
      ),
      title: Container(
        child: Row(
          children: [
            Visibility(
                visible: !ResponsiveWidget.isSmallScreen(context),
                child: CustomText(
                  text: "Myron",
                  color: lightGrey,
                  size: 20,
                  weight: FontWeight.bold,
                )),
            Expanded(child: Container()),
            //!no settings or notifications for now
            // IconButton(
            //     icon: Icon(
            //       Icons.settings,
            //       color: dark,
            //     ),
            //     onPressed: () {}),
            // Stack(
            //   children: [
            //     IconButton(
            //         icon: Icon(
            //           Icons.notifications,
            //           color: dark.withOpacity(.7),
            //         ),
            //         onPressed: () {}),
            //     Positioned(
            //       top: 7,
            //       right: 7,
            //       child: Container(
            //         width: 12,
            //         height: 12,
            //         padding: EdgeInsets.all(4),
            //         decoration: BoxDecoration(
            //             color: active,
            //             borderRadius: BorderRadius.circular(30),
            //             border: Border.all(color: light, width: 2)),
            //       ),
            //     )
            //   ],
            // ),
            // Container(
            //   width: 1,
            //   height: 22,
            //   color: lightGrey,
            // ),
            //!end
            SizedBox(
              width: 24,
            ),
            CustomText(
              text: "\$name",
              color: lightGrey,
            ),
            SizedBox(
              width: 16,
            ),
            Container(
              decoration: BoxDecoration(color: active.withOpacity(.5), borderRadius: BorderRadius.circular(30)),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(2),
                child: CircleAvatar(
                  backgroundColor: light,
                  child: Icon(
                    Icons.person_outline,
                    color: dark,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
