import 'package:flutter/material.dart';
// import 'package:flutter_localization_app/Localization/demo_localization.dart';
import 'package:flutter_localization_app/Localization/localization_constants.dart';
import 'package:flutter_localization_app/classes/language.dart';
import 'package:flutter_localization_app/routes/route_names.dart';
// import 'package:flutter_localization_app/routes/route_names.dart';
import 'package:intl/intl.dart';
import '../classes/language.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  final inputNameController = new TextEditingController();
  final inputEmailController = new TextEditingController();
  final inputDateController = new TextEditingController();


  var myDateFormat = DateFormat('dd-MM-yyyy');

  //## Language Change Funtion Started
  void _changeLanguage(Language language) {
    // print(language.languageCode);
    Locale _temp;
    switch(language.languageCode) {
      case 'en':
      _temp = Locale(language.languageCode, 'US');
      break;
      case 'bn':
      _temp = Locale(language.languageCode, 'BD');
      break;
      default:
      _temp = Locale(language.languageCode, 'US');
    }

    MyApp.setLocale(context, _temp);
  }
  //## Language Change Function Finished

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(),
      appBar: AppBar(
        title: Text(getTranslated(context, 'home_page')),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            //## Dropdown for Language Change Starts
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(lang.flag, style: TextStyle(fontSize: 30),),
                            Text(lang.name),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
            ),
            //## Dropdown for Language Change Finishes
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: _mainForm(context),
        ),
      ),
    );
  }

  Container _drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'about_us'),
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to the About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'settings'),
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to the Settings Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(getTranslated(context, 'personal_info'),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: inputNameController,
            initialValue: null,
            validator: (val) {
              if (val.isEmpty) {
                return getTranslated(context, 'required_field');
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: getTranslated(context, 'name'),
              hintText: getTranslated(context, 'name_hint'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: inputEmailController,
            validator: (val) {
              if (val.isEmpty) {
                return getTranslated(context, 'required_field');
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: getTranslated(context, 'email'),
              hintText: getTranslated(context, 'email_hint'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: inputDateController,
            validator: (val) {
              if (val.isEmpty) {
                return getTranslated(context, 'required_field');
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: getTranslated(context, 'date_of_birth'),
              hintText: getTranslated(context, 'date_of_birth_hint'),
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 50),
                lastDate: DateTime(DateTime.now().year + 20),
              ).then((value) {
                setState(() {
                  inputDateController.text = '${myDateFormat.format(value)}';
                });
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              if (_key.currentState.validate()) {
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                getTranslated(context, 'submit_info'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
