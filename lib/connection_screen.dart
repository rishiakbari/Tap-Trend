import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:taptrend/service/api_service.dart';
// import 'package:taptrend/utils/helper.dart';
import 'package:taptrend/widget/textformfield.dart';

// import 'models/connection_model.dart';
import 'slider_navbar_screen.dart';
import 'utils/colorz.dart';

class ConnectionsScreen extends StatefulWidget {
  const ConnectionsScreen({super.key});

  static const routeName = '/connection-screen';
  @override
  State<ConnectionsScreen> createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends State<ConnectionsScreen> {

//   late SharedPreferences _sharedPreferences;
  TextEditingController searchContactController = TextEditingController();
// List<ConnectionBody> connectionList = [];

// Future<void> _init(int offset, String search)async{
// _sharedPreferences = await SharedPreferences.getInstance();
//  Connection getconnection = await ApiService.getConnection(
//   token: _sharedPreferences.getString('authToken')!,
//   offset: offset,
//   search: search,
//   );

//   if(getconnection.statusCode == 200 && getconnection.body != null){
//     connectionList = getconnection.body!;
//     setState(() {
      
//     });
//     if(mounted){
//       Helper.hideLoading(context: context);
//     }
//   }else {
//     if(mounted){
//       Helper.hideLoading(context: context);
//       Helper.showSnackBar(context: context, text: getconnection.message!);
//     }
//   }

// }
//    @override
//   void initState() {
//     super.initState();
//     _init(0, null.toString());
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBarScreen(),
      backgroundColor: Colorz.screenBackground,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colorz.main),
        actions: <Widget> [
          IconButton(
          onPressed: (){}, 
          icon: const Icon(TablerIcons.nfc,color: Colorz.textPrimary,),
          tooltip: "nfc icon",
          ),
          IconButton(
          onPressed: (){}, 
          icon: const Icon(TablerIcons.qrcode,color: Colorz.textPrimary,),
          tooltip: "Qr Code",
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            child: CustomTextFormField(
              controller: searchContactController,
              fillColor: Colorz.textFormFieldBackground,
              prefixIcon:const Icon(Icons.search),
              hintText: "Search Contact",
              onChanged: (p0) {},
            ),
          ),
        ],
      ),
    );
  }
}