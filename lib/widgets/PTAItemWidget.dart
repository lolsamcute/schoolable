import 'package:flutter/material.dart';

class PTAItemWidget extends StatelessWidget {
  PTAItemWidget({Key key, this.index = 1}) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).hintColor.withOpacity(0.1),
          offset: Offset(0, 5),
          blurRadius: 15,
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))),
            child: Text(
              '1. We now Charge for Bitcoin deposits. We deduct a small fee from each bitcoin amount you send to our app.'
              '2. We posted this notice in our community groups a few days ago. But since many people missed it, we decided to write it in this email as well' ,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ],
      ),
    );
  }
}
