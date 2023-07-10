import 'package:flutter/material.dart';
import 'package:learnt/constants.dart';


import '../common_widgets/app_text.dart';
import '../models/grocery_item.dart';

class ChartItemWidget extends StatefulWidget {
  ChartItemWidget({Key? key, required this.item}) : super(key: key);
  final GroceryItem item;

  @override
  _ChartItemWidgetState createState() => _ChartItemWidgetState();
}

class _ChartItemWidgetState extends State<ChartItemWidget> {
  final double height = 110;

  final Color borderColor = Color(0xffE2E2E2);

  final double borderRadius = 18;

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          imageWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: widget.item.name,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 5,
              ),
              AppText(
                  text: widget.item.description,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              SizedBox(
                height: 12,
              ),


            ],
          ),
          Column(
            children: [
              Icon(
                Icons.close,
                color: Colors.grey,
                size: 25,
              ),
              Spacer(
                flex: 5,
              ),
              Container(
                color: kggrey,
                width: 50,
                height: 20,
                child: Center(
                  child: AppText(
                    text: "\$${getPrice().toStringAsFixed(2)}",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      width: 100,
      child: Image.asset(widget.item.imagePath),
    );
  }

  double getPrice() {
    return widget.item.price * amount;
  }
}
