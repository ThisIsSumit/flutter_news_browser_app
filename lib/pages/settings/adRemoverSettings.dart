import 'package:flutter/material.dart';
import 'package:flutter_browser/Db/HiveDBHelper.dart';

class AdRemoverSettings extends StatefulWidget {

  @override
  State<AdRemoverSettings> createState() => _AdRemoverSettingsState();
}

class _AdRemoverSettingsState extends State<AdRemoverSettings> {

  final TextEditingController textController = TextEditingController();
  List listOfClassesRules = [];
  List listOfIdRules = [];

  @override
  void initState() {
    super.initState();
    setRules();
  }

  setRules(){
    listOfClassesRules = HiveDBHelper.getAllClassRules();
    listOfIdRules = HiveDBHelper.getALlIdRules();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Ad Rules"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("Classes Rules",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                  Spacer(),
                  IconButton(icon: Icon(Icons.add),onPressed: (){
                    showAddingDialog(size,true);
                  },),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: listOfClassesRules.isNotEmpty ?
                ListView.builder(itemCount: listOfClassesRules.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                  String classRule = listOfClassesRules[index];
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(classRule),
                          Spacer(),
                          InkWell(onTap: (){
                            HiveDBHelper.removeClassRule(index);
                            setRules();
                          },child: Icon(Icons.delete,color: Colors.red,),),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  );
                })
                : Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height*0.2,
                    child: Text("No Rules for Classes Set yet"),
                  ),
                ),
              ),



              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("Id Rules",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                  Spacer(),
                  IconButton(icon: Icon(Icons.add),onPressed: (){
                    showAddingDialog(size, false);
                  },),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: listOfIdRules.isNotEmpty ?
                ListView.builder(itemCount: listOfIdRules.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                  String idRule = listOfIdRules[index];
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(idRule),
                          Spacer(),
                          InkWell(onTap: (){
                            HiveDBHelper.removeIdRule(index);
                            setRules();
                          },child: Icon(Icons.delete,color: Colors.red,),),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  );
                })
                    : Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height*0.2,
                    child: Text("No Rules for Classes Set yet"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAddingDialog(Size size,bool isClass){
    showDialog(context: context, builder: (context){
      return AlertDialog(

        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          Container(width: size.width*0.275,child: ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Discard"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.white),),),
          Container(width: size.width*0.275,child: ElevatedButton(onPressed: (){
            if(textController.text.isNotEmpty) {
              if(isClass) {
                HiveDBHelper.addClassRule(textController.text);
              }else{
                HiveDBHelper.addElementIdRule(textController.text);
              }
              textController.clear();
              setRules();
              Navigator.pop(context);
            }
          }, child: Text("Add"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.white),),),
        ],
        content: Container(
          height: size.height*0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(isClass? "Class Name" : "Id Name"),
              TextField(
                controller: textController,
              ),
            ],
          ),
        ),
      );
    });
  }
}