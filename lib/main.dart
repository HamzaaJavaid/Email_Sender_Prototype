import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  String? from ;
  String? to ;
  String? subject ;
  String? description ;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90 , vertical: 30),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        from = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        hintText: 'Enter Sender Email : ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90 , vertical: 30),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        to = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        hintText: 'Enter Recipient Email : ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90 , vertical: 30),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        subject = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        hintText: 'Enter Subject ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90 , vertical: 30),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        description = value;
                      });
                    },
                    maxLines: 9,
                    decoration: InputDecoration(

                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        hintText: 'Enter Description : ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () async{

                    final Email email = Email(
                      body: description.toString(),
                      subject: subject.toString(),
                      recipients: [to.toString()],
                      isHTML: false,
                    );

                    await FlutterEmailSender.send(email);


                  },
                  color: Colors.greenAccent,
                  minWidth: 170,
                  height: 50,
                  child: Text('SEND',style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 6
                  ),),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1,color: Colors.transparent),
                  ),

                )


              ],
            ),
          ),
        )
      ),
    );
  }
}
