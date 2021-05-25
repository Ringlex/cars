import 'package:cars/providers/cars.dart';
import 'package:cars/screens/car_item_detail.dart';
import 'package:cars/widgets/list_car_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CarsList extends StatefulWidget {
  @override
  _CarsListState createState() => _CarsListState();
}

class _CarsListState extends State<CarsList> {
  @override
  Widget build(BuildContext context) {
    final carItems = Provider.of<Cars>(context).items;
    
    print(carItems.length.toString());
    return Expanded(
            child:  Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                  itemCount: carItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CarItemDetail(
                  id: carItems[index].id,
                  model:carItems[index].model,
                  brand: carItems[index].brand,
                  registration: carItems[index].registration,
                  year: carItems[index].year.substring(0,4),
                )));
                      },
                                          child: ListCarItem(
                        id: carItems[index].id,
                        model: carItems[index].model,
                        brand: carItems[index].brand,
                        color: carItems[index].color,
                        registration: carItems[index].registration,
                      ),
                    );
                  },
                ),
            ),
            
          
      
    );
  }
}
