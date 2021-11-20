import 'package:flutter/material.dart';

class EditUser extends StatelessWidget {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('بياناتي'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/89.jpg'),
                        radius: 38,
                      ),
                      Icon(
                        Icons.camera_enhance,
                        color: Colors.red[200],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red[100]!,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          )
                        ]),
                    child: TextFormField(
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {},
                      onTap: () {},
                      validator: (value) {},
                      controller: nameController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.person, color: Colors.red[200],
                            // color: Colors.white,
                          ),
                          focusColor: Colors.red[100],
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius: BorderRadius.all(
                              Radius.circular(90.0),
                            ),
                            borderSide: BorderSide.none,
                            //borderSide: const BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Colors.red[200])),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red[100]!,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          )
                        ]),
                    child: TextFormField(
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {},
                      onTap: () {},
                      validator: (value) {},
                      controller: nameController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email_outlined, color: Colors.red[200],
                            // color: Colors.white,
                          ),
                          focusColor: Colors.red[100],
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius: BorderRadius.all(
                              Radius.circular(90.0),
                            ),
                            borderSide: BorderSide.none,
                            //borderSide: const BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Colors.red[200])),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red[100]!,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          )
                        ]),
                    child: TextFormField(
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {},
                      onTap: () {},
                      validator: (value) {},
                      controller: nameController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.phone_android_outlined,
                            color: Colors.red[200],
                            // color: Colors.white,
                          ),
                          focusColor: Colors.red[100],
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius: BorderRadius.all(
                              Radius.circular(90.0),
                            ),
                            borderSide: BorderSide.none,
                            //borderSide: const BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Colors.red[200])),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: 100,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.red[200],
                onPressed: () {},
                child: Text(
                  'تحديث البيانات',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontFamily: 'Cairo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
