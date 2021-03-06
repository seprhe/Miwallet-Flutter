import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttermiwallet/res/colors.dart';
import 'package:fluttermiwallet/res/strings.dart';
import 'package:input_calculator/input_calculator.dart';

Widget appBar(BuildContext context, PreferredSize bottom, String title,
    {Function saveOnTap}) {
  ScreenUtil.init(width: 360, height: 640);
  return AppBar(
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: ScreenUtil().setSp(20),
      ),
    ),
    centerTitle: true,
    actions: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(21),
        ),
        child: InkWell(
          onTap: saveOnTap,
          child: Text(
            Strings.save,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
      ),
    ],
    leading: backButton(context),
    bottom: bottom,
  );
}

Widget bottomCalcAppBar(
    {bool isExpanded = false,
    Function(double) onSubmitted,
    String label = Strings.amount,
    bool isCalculator = true,
    Function onChangeGmail,
      Function(TextEditingController) listener,
    }) {
  TextEditingController _controller = TextEditingController();
  ScreenUtil.init(width: 360, height: 640);
  return PreferredSize(
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(21),
        right: ScreenUtil().setWidth(21),
        top: ScreenUtil().setHeight(5),
      ),
      height: ScreenUtil().setHeight(156),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                isExpanded ? Strings.from + "Saderat" + Strings.account : "",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14), color: Colors.white),
              ),
              Text(
                isExpanded ? "\$1000.00" : "",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14), color: Colors.white),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(16),
              right: ScreenUtil().setWidth(16),
              bottom: ScreenUtil().setWidth(10),
              top: ScreenUtil().setWidth(10),
            ),
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(40),
            ),
            height: ScreenUtil().setHeight(70),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(13),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: ColorRes.textColor),
                  ),
                ),
                Expanded(
                    child: isCalculator
                        ? CalculatorTextFormField(
                            onSubmitted: onSubmitted,
                            inputDecoration: InputDecoration(
                              hintText: "\$0.00",
                              suffixIcon: Image.asset(
                                "assets/images/calculator.png",
                              ),
                              counterStyle: TextStyle(
                                color: Color(0xff0D47A1),
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                          )
                        :  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                      controller: _controller,
                      onChanged: (text){
                                listener(_controller);
                      },
                      decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: ScreenUtil().setSp(12),),
                              hintText: "name@gmail.com",
                              counterStyle: TextStyle(
                                color: Color(0xff0D47A1),
                                fontSize: ScreenUtil().setSp(14),
                              ),
                      ),
                    ),
                            ),
                            Text(Strings.change,style: TextStyle(color: ColorRes.textColor,fontSize: ScreenUtil().setSp(14),),)
                          ],
                        )
                    ),
              ],
            ),
          ),
        ],
      ),
    ),
    preferredSize: Size(
      ScreenUtil().setWidth(318),
      ScreenUtil().setHeight(156),
    ),
  );
}

Widget bottomTextAppBar(Widget firstText, Widget secondText,
    {marginHorizontal = 20}) {
  return PreferredSize(
    preferredSize: Size(
      ScreenUtil().setWidth(318),
      ScreenUtil().setHeight(85),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(marginHorizontal),
      ),
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          firstText,
          secondText,
        ],
      ),
    ),
  );
}

Widget bottomText(String text, {double size = 18, Color color = Colors.white}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: ScreenUtil().setSp(size),
      color: color,
    ),
  );
}

Widget backButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
  );
}
