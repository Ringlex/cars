import 'package:cars/providers/cars.dart';
import 'package:cars/widgets/grid_car_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CarsGrid extends StatefulWidget {
  @override
  _CarsGridState createState() => _CarsGridState();
}

class _CarsGridState extends State<CarsGrid> {
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
                    return GridCarItem(
                      id: carItems[index].id,
                      model: carItems[index].model,
                      brand: carItems[index].brand,
                      color: carItems[index].color,
                      registration: carItems[index].registration,
                    );
                  },
                ),
            ),
            
          
      
    );
  }
}
