import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Models/coupons_defination.dart';
import 'package:flutter_smart_home_ui/admin/widgets/admin_drawer.dart';
import 'package:flutter_smart_home_ui/provider/coupons_provider.dart';
import 'package:provider/provider.dart';
import '../../students/widgets/student_drawer.dart';

class OrderReceived extends StatefulWidget {
  static const routeName='/order_received';

  @override
  _OrderReceivedState createState() => _OrderReceivedState();
}

class _OrderReceivedState extends State<OrderReceived> {

  @override
    void didChangeDependencies() {
      // TODO: implement didChangeDependencies
      Provider.of<Coupons>(context).fetchCoupons();
      super.didChangeDependencies();
    }
  @override
  Widget build(BuildContext context) {
    
    final couponData = Provider.of<Coupons>(context).fetchitems;
    return Scaffold(
      drawer: AdminDrawer(
      ),
      appBar: AppBar(
        title: Text(
          'Your Coupons',
        ),
      ),
      body: ListView.builder(itemCount: couponData.length, itemBuilder: (context, index) => 
        Card(
          child: ListTile(
            leading: 
             Icon(
                Icons.ac_unit_sharp,
                color: Colors.black,
                size: 35,
              ),
            title: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        'Coupon Code: ${couponData[index].couponNumber.toString()}',
                      ),
                      
                    ),
                    Spacer(),
                    Container(
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Container(
                  child: Text(
                    couponData[index].cartOrdersid.keys.toString(),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
              couponData[index].cartOrdersid.values.toString(),
            ),)
              ],
            ),
            // trailing: Text(
            //   couponData[index].cartOrdersid.values.toString(),
            // ),
            ),
        ),
        )
        );
      
    
  }
}
//couponData[index].title,