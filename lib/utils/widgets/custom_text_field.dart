import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttermiwallet/res/colors.dart';

Widget customTextBox(
    {double height = 50.0,
    marginTop = 0,
    marginBottom = 0,
    marginRight = 21,
    marginLeft = 21,
    String label,
    Widget childWidget,
    Function onPressed}) {
  ScreenUtil.init(width: 360, height: 640);
  return Container(
    margin: EdgeInsets.only(
      top: ScreenUtil().setHeight(marginTop),
      bottom: ScreenUtil().setHeight(marginBottom),
      right: ScreenUtil().setWidth(marginRight),
      left: ScreenUtil().setWidth(marginLeft),
    ),
    height: ScreenUtil().setHeight(height),
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            height: ScreenUtil().setHeight(height - 14),
            child: OutlineButton(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
              onPressed: onPressed,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightedBorderColor: ColorRes.hintColor,
              color: ColorRes.textColor,
              borderSide: BorderSide(
                color: ColorRes.blueColor.withOpacity(0.55),
              ),
              disabledBorderColor: ColorRes.blueColor.withOpacity(0.55),
              child: childWidget,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: FittedBox(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(4),
              ),
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(11),
              ),
              height: ScreenUtil().setHeight(19),
              color: Colors.white,
              child: Text(
                label,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: ColorRes.textColor),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget descTextField(Function(TextEditingController) listener) {
  TextEditingController controller = TextEditingController();
  return TextField(
    controller: controller,
    onChanged: (text) {
      listener(controller);
    },
    minLines: 1,
    maxLines: 6,
    style:
        TextStyle(fontSize: ScreenUtil().setSp(12), color: ColorRes.hintColor),
    decoration: InputDecoration(
      border: InputBorder.none,
    ),
  );
}

Widget chooseBottomSheet(String hint) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        hint,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(12), color: ColorRes.hintColor),
      ),
      Icon(Icons.arrow_drop_down),
    ],
  );
}

Widget rowWithTwoChild(Widget firstChild, Widget secondChild,
    {double space = 10}) {
  return Row(
    children: <Widget>[
      firstChild,
      SizedBox(
        width: ScreenUtil().setWidth(space),
      ),
      secondChild
    ],
  );
}
