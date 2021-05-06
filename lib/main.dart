import 'package:flutter/material.dart';
import 'package:login_ui/test_body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff2D2D2D),
        body: Container(
          child: LayoutBuilder(
            // ignore: missing_return
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Container(
                    child: IntrinsicHeight(
                        child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xff2D2D2D),
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Center(
                            child: Text(
                              'Car Wash',
                              style: TextStyle(
                                  color: Color(0xff0085CA), fontSize: 30.00),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Column(
                            children: [
                              CustomTextField(
                                txt: 'Enter Phone Number',
                              ),
                              SizedBox(height: 20),
                              CustomTextField(
                                txt: 'Enter Password',
                              ),
                              SizedBox(height: 20),
                              // ignore: deprecated_member_use
                              RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 30.0),
                                  child: Text(
                                    "Login",
                                    style: (TextStyle(fontSize: 25.00)),
                                  ),
                                  color: Color(0xff2D2D2D),
                                  textColor: Color(0xff0085CA),
                                  onPressed: () {
                                    
                                  }),
                                  Container(
                                    child: ButtonPress(),
                                  )
                            ],
                          ),
                        )),
                      ],
                    )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String txt;

  const CustomTextField({Key key, this.txt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (txt == 'Enter Password') {
      return TextField(
        autocorrect: true,
        obscureText: true,
        decoration: InputDecoration(
          hintText: txt,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      );
    }
    return TextField(
      autocorrect: true,
      decoration: InputDecoration(
          hintText: txt,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              )),
          prefixIcon: IconTheme(
            data: IconThemeData(color: Theme.of(context).primaryColor),
            child: Icon(Icons.phone),
          )),
    );
  }
}

