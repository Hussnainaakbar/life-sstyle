import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:life_style_app/screens/male/male_weight_gain/male_sport/male_gain_sport_calender.dart';

import '../../../../drawer_side.dart';

class MaleGainSportDay3 extends StatefulWidget {
  const MaleGainSportDay3({Key? key}) : super(key: key);

  @override
  _MaleGainSportDay3State createState() => _MaleGainSportDay3State();
}

class _MaleGainSportDay3State extends State<MaleGainSportDay3> {
  final CountDownController _controller = CountDownController();
  late AnimationController controller;

  bool onPressed =false;
  int duration = 600;

  button({required IconData icon, VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color:  Color(0xffF4A02C),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(icon),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerSide(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MaleGainSportCalender()));
                    },
                        icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),

                    // Center(child: Text('اليوم الأول',
                    // style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    // )),
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
              height: 205,
              child: CircularCountDownTimer(
                duration: duration,
                initialDuration: 600,
                controller:_controller,
                width: MediaQuery.of(context).size.width / 1.6,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.grey,
                fillColor:   Color(0xffF4A02C),
                strokeWidth: 15.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 33.0, color: Colors.black, fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () {
                  print('Countdown Ended');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffF7B044),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: IconButton(
                        icon: onPressed
                            ? Icon(
                          Icons.pause,
                          size: 25.0,
                        )
                            : Icon(Icons.play_arrow, size: 25.0),
                        onPressed: () {
                          onPressed ?_controller.pause() : _controller.restart();
                          setState(() {
                            onPressed = !onPressed;
                          });
                        }),
                  ),
                  button(icon: Icons.stop, onPressed: ()=> _controller.pause())
                ],
              ),
            ),
            Container(
              height: 384.2,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: ClipPath(
                      clipper: WaveClipperOne(reverse: true),
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xffF4A02C),
                        child: Center(
                            child: Column(
                              children: const [
                                SizedBox(height: 105,),
                                Text("LUNGE",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0,right: 20),
                                    child: Text("تمرين الاندفاع أثناء المشي هو تمرين ممتاز لبناء وتقوية عضلات الألوية مع استهداف عضلات الفخذ أيضًا وتحسين توازنك.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign:TextAlign.center ,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 80,
                      child: Image.asset('assets/male/mgain2.png',height: 240,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
