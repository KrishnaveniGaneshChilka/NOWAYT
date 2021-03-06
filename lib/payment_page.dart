


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nowayt_copy1/orderDetails.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class payment_gateway extends StatefulWidget {
  final sum;
  payment_gateway({Key key , @required this.sum}) : super(key:key);
  @override
  _payment_gatewayState createState() => _payment_gatewayState(sum);
}

class _payment_gatewayState extends State<payment_gateway> {
  Razorpay razorpay;
  final sum;
  _payment_gatewayState(this.sum);
  TextEditingController textEditingController=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay=new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentsuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymenterror);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalwallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();


  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_ulkzAIvEDfGzPf",
      "amount": sum*100,
      "name": "Nowayt",
      "description": "Payment for order",
      "prefill": {
        "contact": "7721961357",
        "email": "tanmaidmuke@gmail.com"
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try{
      razorpay.open(options);
    }
    catch(e){
      print(e.toString());
    }



  }

  void paymentsuccess(PaymentSuccessResponse response){
   print("Payment Sucess");
   Fluttertoast.showToast(
       msg: "Payment Sucess!"+response.paymentId,
       gravity: ToastGravity.BOTTOM,
       toastLength: Toast.LENGTH_LONG,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.lightBlueAccent,
       textColor: Colors.black,
       fontSize: 16.0

   );
   print("*****************************************");
    Navigator.push(context,MaterialPageRoute(builder: (context) => order_details() ) );
   print("*****************************************");

  }

  void paymenterror(PaymentFailureResponse response){
    Fluttertoast.showToast(
        msg: "Payment Failed!",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlueAccent,
        textColor: Colors.black,
        fontSize: 16.0

    );
  }
  void externalwallet(){
    Fluttertoast.showToast(
        msg: "External Wallet!",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlueAccent,
        textColor: Colors.black,
        fontSize: 16.0

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Razor Pay Gateway"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(sum.toString()),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.blue,
              child: Text("Pay Now", style: TextStyle(
                  color: Colors.white
              ),),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
