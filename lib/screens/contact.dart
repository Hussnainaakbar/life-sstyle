import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/shop/review_star.dart';
import 'package:life_style_app/shop/shop_home.dart';

import 'drawer_side.dart';
import 'female/diet_plane.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                    Builder(
                      builder: (context){
                        return IconButton(onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                            icon: Image.asset('assets/icons/menu.png',fit: BoxFit.cover,color: Colors.black,)
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
                height: 60,
                width: 230,
                color: Color(0xffFDB640),
                child: Center(
                    child: Text(
                      '?????????????? ??????',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 34,
                          letterSpacing: 3),
                    ))),
            Container(
                height: 100,
                width: 200,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      '?????????? ???????????????? ???????? ?? ???????????? ?????????????????????? ?? ????????????????????',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ))),
            Container(
              height: 310,
              width: 295,

              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: const [
                    TextField(

                      decoration: InputDecoration(
                        hintText: '??????????',
                        hintStyle: TextStyle(fontSize: 20),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextField(

                      decoration: InputDecoration(
                        hintText: '??????????????',
                        hintStyle: TextStyle(fontSize: 20),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),

                    TextField(
                      keyboardType: TextInputType.multiline,

                      maxLines: 5,

                      decoration: InputDecoration(
                        hintText: '??????????????',
                        hintStyle: TextStyle(fontSize: 20),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            Container(
                height: 50,
                width: 150,
                color: Color(0xffFDB640),
                child: Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        '>    ??????????   ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            letterSpacing: 3),
                      ),
                    ))),

            Text(
              '???? ?????????? ???????? ??????',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/instagram.png',height: 30,),
                SizedBox(width: 5,),
                Image.asset('assets/icons/fb.png',height: 30,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
