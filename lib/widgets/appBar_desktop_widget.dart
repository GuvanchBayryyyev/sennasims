import 'package:flutter/material.dart';
import 'package:senna_sims/widgets/text_button.dart';

class AppBarDesktop extends StatefulWidget {
  final String subtitle;
  final Function submit;

  AppBarDesktop({this.subtitle, this.submit});

  @override
  _AppBarDesktopState createState() => _AppBarDesktopState();
}

class _AppBarDesktopState extends State<AppBarDesktop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = "SennaSims";
    return Container(
      padding: const EdgeInsets.all(40.0),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  )),
              widget.subtitle != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 6.0),
                      child: Text(widget.subtitle,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                          )),
                    )
                  : Container()
            ],
          ),
          widget.submit != null
              ? SizedBox(
                  width: 120,
                  child: CustomButtonInput(
                      label: "Submit",
                      onTap: () {
                        widget.submit();
                      }),
                )
              : Container()
        ],
      ),
    );
  }
}
