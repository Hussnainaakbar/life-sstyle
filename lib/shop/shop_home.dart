import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/provider/cart_provider.dart';
import 'package:life_style_app/provider/product_provider.dart';
import 'package:life_style_app/screens/drawer_side.dart';
import 'package:life_style_app/shop/product_over_view.dart';
import 'package:life_style_app/shop/review_star.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce_api/woocommerce_api.dart';


class ShopHome extends StatefulWidget {

  @override
  _ShopHomeState createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {

  GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;
  var _cartQuantityItems = 0;


  Future _getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://nutriana.surnaturel.ma/",
        consumerKey: "ck_73b8b2030da9878cdc1b9cdab513fce415418696",
        consumerSecret: "cs_974a8179e3d0009937fc59c3793ae9a85be50a0c");

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");

    return products;
  }


  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      gkCart: gkCart,
      rotation: true,
      dragToCardCurve: Curves.easeIn,
      dragToCardDuration: const Duration(milliseconds: 1000),
      previewCurve: Curves.linearToEaseOut,
      previewDuration: const Duration(milliseconds: 500),
      previewHeight: 30,
      previewWidth: 30,
      opacity: 0.85,
      initiaJump: false,
      receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
        // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCardAnimation = addToCardAnimationMethod;
      },
      child: Scaffold(
        backgroundColor: Color(0xffFBFAF8),
        bottomNavigationBar: Container(
          height: 85,
          color: Color(0xffFDB640),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ShopHome()));
                      },
                      child: Image.asset('assets/icons/shop.jpg',)),
                ),
                Image.asset('assets/icons/gift.jpg',),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ReviewStar()));
                    },
                    child: Image.asset('assets/icons/star.jpg',)),
              ],
            ),
          ),
        ),
        endDrawer: DrawerSide(),
        appBar: AppBar(
          centerTitle: false,
          title:Row(
            children: [
              AddToCartIcon(
                key: gkCart,
                icon:CircleAvatar(
                    backgroundColor:  Color(0xffFDB640),
                    child: Image.asset('assets/icons/shopping-cart.png',height: 20,)),

                colorBadge: Colors.red,
              ),

            ],
          ),
          elevation: 0,
          toolbarHeight: 70,
          iconTheme: IconThemeData(
            color: Colors.black,
            // size: 33
          ),
          backgroundColor:Color(0xffFBFAF8),
          leading: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios_new)),
              // CircleAvatar(
              //     child: Image.asset('assets/icons/shopping-cart.png',height: 20,)),
            ],
          ),
        ),
        body:ListView(
          children: [
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height:55,
                      width: 280,
                      color:Color(0xffFDB640),
                      child: Center(child: Text('????????????',
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 34,letterSpacing: 3),
                      ))),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0,right: 45),
                    child: Container(
                      height: 115,
                      width: 300,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('?????????? ?????? ?????? ???????? ???????????????? ???????? ?????????? ?????? ?????????? ???????????? ???????????? ???????????? ?????????? ???? ?????????? ?????? ?????????? ?? ?????????? ???????????? ?????????????? ?? ???????????? ?????????? ?????????????? ????????????',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(height: 5,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: 435,
                child:   FutureBuilder(
                  future: _getProducts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      // Create a list of products
                      return ListView.builder(

                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {

                          return GestureDetector(
                            onTap: ()


                            {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductOverview(
                                productUrl: snapshot.data[index]["images"][0]["src"].toString(),
                                productName:snapshot.data[index]["name"].toString(),
                                productPrice: snapshot.data[index]["price"].toString(),
                              )));
                            },
                            child: ListTile(
                              leading: Image.network(snapshot.data[index]["images"][0]["src"].toString(),height: 50,),
                              title: Flexible(
                                child: Text(snapshot.data[index]["name"].toString(),style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis
                                ),),
                              ),
                              subtitle:
                              Text("Buy now for \AED " + snapshot.data[index]["price"].toString()),
                              trailing: InkWell(
                                onTap: (){
                                  listClick;
                                },
                                child: CircleAvatar(
                                    backgroundColor:  Color(0xffFDB640),
                                    child: Image.asset('assets/icons/shopping-cart.png',height: 20,)),
                              ) ,
                            ),
                          );
                        },
                      );
                    }

                    // Show a circular progress indicator while loading products
                    return const Center(
                      child: CircularProgressIndicator(color:  Color(0xffFDB640),),
                    );
                  },
                ),
              ),
            ),


          ],
        ) ,
      ),
    );
  }
  void listClick(GlobalKey ) async {
    await runAddToCardAnimation;
    await gkCart.currentState!.runCartAnimation((++_cartQuantityItems).toString());
  }
}
