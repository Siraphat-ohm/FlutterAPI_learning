import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'dart:convert';

class Homepage extends StatefulWidget {
//  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("ความรู้เกี่ยวกับคอมพิวเตอร์"),
     ), 
     body : Padding(
       padding: const EdgeInsets.all(8.0),
       child: 
         FutureBuilder( builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['image_url'], data[index]['detail']);
              },
              itemCount: data.length, 
            );
       },
       future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
       ),
       
       
     ), 
    );
  }

  Widget MyBox(String title, String subtitle, String url, String detail){
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.80), BlendMode.darken)
        ),
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 25, color: Colors.blue[50]),),
          Text(subtitle, style: TextStyle(fontSize: 15, color: Colors.blue[50]),),
          TextButton(onPressed: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(v1, v2, v3, v4)))
          }, child: Text("อ่านต่อ"))
        ]
        ),
    );
  }

  Widget XButton(){
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MaterialButton(
              onPressed: ()=>{},
              color: Colors.blue,
              child: Icon(Icons.camera_alt),
              shape: CircleBorder(),
            )
          ],
        )    );
  }
}