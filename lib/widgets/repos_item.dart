import 'package:flutter/material.dart';

class ReposItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'ss',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.favorite_border,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
