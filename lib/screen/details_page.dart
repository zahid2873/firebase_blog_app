import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Stream<QuerySnapshot> _detailsStream = FirebaseFirestore.instance.collection('blog').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _detailsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Container(
                height: 400,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(child: Image.network(data["img"])),
                      Expanded(child: Column(children: [
                        Text(data['title']),
                        Text(data['description']),
                        ElevatedButton(onPressed: (){
                          customDialog(data["img"], data['title'], data['description'], context);
                        }, child: Text("Details")),
                      ],))
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        });
  }

  customDialog(String img, String title, String des, context){
    return showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(img),
                Text(title),
                Text(des)
                
              ],
            ),
          ),
        ),
      );
    });
  }
}
