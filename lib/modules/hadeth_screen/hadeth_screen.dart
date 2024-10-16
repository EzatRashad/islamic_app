import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../widgets/loading.dart';
import '../widgets/my_scaffold.dart';
import 'hadeths_name.dart';

class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key, required this.args, required this.title});

  final HadethModel args;
  final String title;

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (text.isEmpty) {
      loadFile(widget.args.index);
    }
    return MyScaffold(
      title: widget.title,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(provider.appTheme == ThemeMode.dark
                ? "assets/images/bdark-web.png"
                : "assets/images/blight-web.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: text.isNotEmpty
            ? Container(
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                    vertical: MediaQuery.of(context).size.height * 0.047),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SelectableText(
                  text,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            : const Loading(),
      ),
    );
  }

  void loadFile(int index) async {
    String pos = "h${(index + 1).toString()}";
    String content =
        await rootBundle.loadString("assets/files/hadeth/$pos.txt");
    List<String> lines = content.split('\n');

    setState(() {
      lines.removeAt(0);
      text = lines.join("");
    });
  }
}
