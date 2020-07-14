import 'package:coffee_store_app/model/DrinksListModel.dart';
import 'package:coffee_store_app/widget/DrinksCard.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrinksList extends StatelessWidget {
  @override
  Widget build(BuildContext scaffoldcontext) {
    return ScopedModelDescendant<DrinksListModel>(
      builder: (context, _, model) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
          padding: EdgeInsets.all(6.0),
            children: model.drinkType.map((drinkType){
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: scaffoldcontext,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text(
                            'Order'
                          ),
                          content: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.lime
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                    drinkType.image,
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        drinkType.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),
                                        softWrap: false,
                                          overflow: TextOverflow.visible
                                      ),
                                      Text(
                                        'Price: \$${drinkType.price}',
                                        key: Key('${drinkType.title}_order'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 18.0
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                            ),
                            FlatButton(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                    fontSize: 18.0
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.white,
                                  duration: Duration(
                                    seconds: 4
                                  ),
                                  content: Text(
                                    '${drinkType.title} order confirmed',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                );
                                Scaffold.of(scaffoldcontext).showSnackBar(snackBar);
                              },
                            )
                          ],
                        );
                      }
                  );
                },
                child: DrinksCard(
                  drinkType: drinkType,
                ),
              );
            }).toList(),
          ),
        );
      },
    );

  }
}
