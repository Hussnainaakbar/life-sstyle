import 'package:flutter/material.dart';
import 'package:life_style_app/screens/home_screen.dart';
import 'package:open_mail_app/open_mail_app.dart';

class EmailVerificationScreen extends StatelessWidget {

  static const String id = 'email-ver';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verify Email',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 26, color: Theme
                    .of(context)
                    .primaryColor
                ),
              ),
              SizedBox(height: 10,),
              Text('Check your email to verify your registered email',
                style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: 14,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Theme
                            .of(context)
                            .primaryColor),
                      ),
                      onPressed: ()async {
                        var result = await OpenMailApp.openMailApp();

                        // If no mail apps found, show error
                        if (!result.didOpen && !result.canOpen) {
                          showNoMailAppsDialog(context);

                          // iOS: if multiple mail apps found, show dialog to select.
                          // There is no native intent/default app system in iOS so
                          // you have to do it yourself.
                        } else if (!result.didOpen && result.canOpen) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return MailAppPickerDialog(
                                mailApps: result.options,//it will show installed email app
                              );
                            },
                          );
                        }
                        Navigator.pushReplacementNamed(context, HomeScreen.id);
                      },
                      child: Text('Verify Email'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
