import 'package:flutter/material.dart';

import '../dictionary_model.dart';
import '../hive/hive_repository.dart';
import '../widgets/app_bar.dart';
import '../widgets/list_view_builder.dart';

class DictionaryApp extends StatefulWidget {
  const  DictionaryApp({Key? key}) : super(key: key);

  @override
  State<DictionaryApp> createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  TextEditingController wordEngController = TextEditingController();
  TextEditingController wordUzController = TextEditingController();

  HiveRepository hiveRepository = HiveRepository();

  @override
  void initState() {



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List list=hiveRepository.getDictionnaries();
    for(int i=0;i<list.length; i++){

    }
    print(DictionaryModel.fromJson(hiveRepository.getDictionnaries().first)
        .wordUz);



    String engLishWord=DictionaryModel.fromJson(hiveRepository.getDictionnaries().first)
        .wordEng;

    Dialog addWordsDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 5 * 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: wordEngController,
                decoration: InputDecoration(
                  hintText: 'English word',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: wordUzController,
                decoration: InputDecoration(
                  hintText: 'Uzbek word',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {

                  DictionaryModel dictionaryModel = DictionaryModel(
                      wordEng:wordEngController.text, wordUz: wordUzController.text);
                  hiveRepository
                      .saveDictionaries(<Map<String, dynamic>>[dictionaryModel.toJson()]);

                  Navigator.pop(context);
                },
                child: Text(
                  'Add!',
                  style: TextStyle(color: Colors.purple, fontSize: 18.0),
                ))
          ],
        ),
      ),
    );

    return SizedBox(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56), child: appBarWidget()),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return buildItemBuilder(wordEng:DictionaryModel.fromJson(list[index]).wordEng,wordUz:DictionaryModel.fromJson(list[index]).wordUz );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 20),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyanAccent,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => addWordsDialog);
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
