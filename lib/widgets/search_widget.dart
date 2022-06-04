import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late ThemeData theme;

  _pickDate(BuildContext context) async {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: BorderRadius.all(Radius.circular(16)), boxShadow: [
        BoxShadow(blurRadius: 6.0, color: theme.colorScheme.onBackground, offset: Offset(0.0, 0.0)),
      ]),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    style: AppCss.getTextStyle(
                      theme.textTheme.subtitle2!,
                      fontWeight: 500,
                    ),
                    decoration: InputDecoration(
                      hintStyle: AppCss.getTextStyle(theme.textTheme.subtitle2!, fontWeight: 500),
                      hintText: "Hotels near me",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        MdiIcons.magnify,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 14),
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.sentences,
                    controller: TextEditingController(text: ""),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16),
                  child: InkWell(
                    onTap: () {
                      _pickDate(context);
                    },
                    child: Icon(
                      MdiIcons.calendarOutline,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              height: 0,
              color: theme.dividerColor,
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Check in",
                              style: AppCss.getTextStyle(theme.textTheme.caption!, fontWeight: 500),
                            ),
                            Text(
                              "28 May",
                              style: AppCss.getTextStyle(theme.textTheme.bodyText1!, fontWeight: 600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Check out",
                              style: AppCss.getTextStyle(theme.textTheme.caption!, fontWeight: 500),
                            ),
                            Text(
                              "31 May",
                              style: AppCss.getTextStyle(theme.textTheme.bodyText1!, fontWeight: 600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Person",
                              style: AppCss.getTextStyle(theme.textTheme.caption!, fontWeight: 500),
                            ),
                            Text(
                              "2 Couple",
                              style: AppCss.getTextStyle(theme.textTheme.bodyText1!, fontWeight: 600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
