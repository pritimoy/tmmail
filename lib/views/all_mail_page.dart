import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmmail/models/email.dart';
import 'package:tmmail/network/api_call.dart';
import 'package:tmmail/provider/provider_state.dart';
import 'package:tmmail/utils/constant.dart';
import 'package:tmmail/views/widgets/custom_text.dart';

class AllMailPage extends StatefulWidget {
  const AllMailPage({Key? key}) : super(key: key);

  @override
  _AllMailPageState createState() => _AllMailPageState();
}

class _AllMailPageState extends State<AllMailPage> {
  Future<Email>? allMail;
  @override
  void initState() {
    super.initState();
    // allMail = getMail();
    // print(allMail);
  }

  bool _running = true;
  Stream<Email> allmail() async* {
    while (_running) {
      await Future<Email>.delayed(const Duration(seconds: 1));

      yield await ApiCall().getMail();
    }
  }

  @override
  Widget build(BuildContext context) {
    var providerState = Provider.of<ProviderState>(context);
    int stateTotal = providerState.totalNumber;
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Inbox'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: StreamBuilder<Email>(
        stream: ApiCall().getAllEmail(),
        builder: (context, AsyncSnapshot<Email> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Some error occurred'),
                );
              } else {
                if (stateTotal != snapshot.data!.hydraTotalItems) {
                  providerState.totalMessage(snapshot.data!.hydraTotalItems);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 4.0),
                  child: Container(
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data!.hydraTotalItems,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    text: snapshot
                                        .data!.hydraMember[index].from.name,
                                    textStyle: kName),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                customText(
                                    text: snapshot
                                        .data!.hydraMember[index].from.address,
                                    textStyle: kMail),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                customText(
                                    text: snapshot
                                        .data!.hydraMember[index].subject,
                                    textStyle: kSubject),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                customText(
                                    text:
                                        snapshot.data!.hydraMember[index].intro,
                                    textStyle: kIntro),
                                const SizedBox(
                                  height: 4.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }

  Future<Email> getMail() => ApiCall().getMail();
}