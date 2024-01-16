
import 'dart:convert';

import 'package:http/http.dart' as http;
class NetworkRequest{

  /// get method
  Future getRequest(String url)async{
    try{
      http.Response response=await http.get(Uri.parse(url),
       /* headers: {
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },*/
      );
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }else{
        print('Request Failed');
      }
    }catch(e){
      print(e);
    }
  }

  /// post method
/*  Future postRequest(String url,Map<String,String> body)async{
    try{
      http.Response response=await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept':'application/json',
          'token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTQ2OTAzMDYsImRhdGEiOiJyYWJiaWxpZGxjQGdtYWlsLmNvbSIsImlhdCI6MTY5NDYwMzkwNn0.ZeEvPrBYfYiDOBEUl1r8zrSzxVSFI9JN-lgVms1Kbb4',

        },
        body: jsonEncode(body),
      );
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }
      else if(response.statusCode==401){
        print('Unauthorized Response');
      }
      else{
        print('Request Failed');
      }
    }catch(e){
      print(e);
    }
  }*/

}