import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_browser/models/browser_model.dart';
import 'package:flutter_browser/models/search_engine_model.dart';
import 'package:flutter_browser/models/webview_model.dart';
import 'package:flutter_browser/pages/settings/adRemoverSettings.dart';
import 'package:flutter_browser/util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../Db/HiveDBHelper.dart';
import '../../project_info_popup.dart';

class CrossPlatformSettings extends StatefulWidget {
  const CrossPlatformSettings({Key? key}) : super(key: key);

  @override
  State<CrossPlatformSettings> createState() => _CrossPlatformSettingsState();
}

class _CrossPlatformSettingsState extends State<CrossPlatformSettings> {
  final TextEditingController _customHomePageController =
      TextEditingController();
  final TextEditingController _customUserAgentController =
      TextEditingController();

  @override
  void dispose() {
    _customHomePageController.dispose();
    _customUserAgentController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var browserModel = Provider.of<BrowserModel>(context, listen: true);
    var children = _buildBaseSettings(size);
    if (browserModel.webViewTabs.isNotEmpty) {
      children.addAll(_buildWebViewTabSettings());
    }

    return ListView(
      children: children,
    );
  }

  List<Widget> _buildBaseSettings(Size size) {
    var browserModel = Provider.of<BrowserModel>(context, listen: true);
    var settings = browserModel.getSettings();

    var widgets = <Widget>[
      const ListTile(
        title: Text("General Settings"),
        enabled: false,
      ),
      ListTile(
        title: const Text("Search Engine"),
        subtitle: Text(settings.searchEngine.name),
        trailing: DropdownButton<SearchEngineModel>(
          hint: const Text("Search Engine"),
          onChanged: (value) {
            setState(() {
              if (value != null) {
                settings.searchEngine = value;
              }
              browserModel.updateSettings(settings);
            });
          },
          value: settings.searchEngine,
          items: SearchEngines.map((searchEngine) {
            return DropdownMenuItem(
              value: searchEngine,
              child: Text(searchEngine.name),
            );
          }).toList(),
        ),
      ),
      FutureBuilder(
        future: InAppWebViewController.getDefaultUserAgent(),
        builder: (context, snapshot) {
          var deafultUserAgent = "";
          if (snapshot.hasData) {
            deafultUserAgent = snapshot.data as String;
          }

          return ListTile(
            title: const Text("Default User Agent"),
            subtitle: Text(deafultUserAgent),
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: deafultUserAgent));
            },
          );
        },
      ),
      SwitchListTile(
        title: const Text("Debugging Enabled"),
        subtitle: const Text(
            "Enables debugging of web contents loaded into any WebViews of this application. On iOS < 16.4, the debugging mode is always enabled."),
        value: settings.debuggingEnabled,
        onChanged: (value) {
          setState(() {
            settings.debuggingEnabled = value;
            browserModel.updateSettings(settings);
            if (browserModel.webViewTabs.isNotEmpty) {
              var webViewModel = browserModel.getCurrentTab()?.webViewModel;
              if (Util.isAndroid()) {
                InAppWebViewController.setWebContentsDebuggingEnabled(
                    settings.debuggingEnabled);
              }
              webViewModel?.settings?.isInspectable = settings.debuggingEnabled;
              webViewModel?.webViewController?.setSettings(
                  settings: webViewModel.settings ?? InAppWebViewSettings());
              browserModel.save();
            }
          });
        },
      ),
      FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          String packageDescription = "";
          if (snapshot.hasData) {
            PackageInfo packageInfo = snapshot.data as PackageInfo;
            packageDescription =
                "Package Name: ${packageInfo.packageName}\nVersion: ${packageInfo.version}\nBuild Number: ${packageInfo.buildNumber}";
          }
          return ListTile(
            title: const Text("Flutter Browser Package Info"),
            subtitle: Text(packageDescription),
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: packageDescription));
            },
          );
        },
      ),
      ListTile(
        leading: Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.only(top: 6.0, left: 6.0),
          child: const CircleAvatar(
              backgroundImage: AssetImage("assets/icon/icon.png")),
        ),
        title: const Text("Flutter InAppWebView Project"),
        subtitle: const Text(
            "https://github.com/pichillilorenzo/flutter_inappwebview"),
        trailing: const Icon(Icons.arrow_forward),
        onLongPress: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return const ProjectInfoPopup();
            },
            transitionDuration: const Duration(milliseconds: 300),
          );
        },
        onTap: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return const ProjectInfoPopup();
            },
            transitionDuration: const Duration(milliseconds: 300),
          );
        },
      ),



      //Add Remover Settings
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

    ];

    if (Util.isAndroid()) {
      widgets.addAll(<Widget>[
        FutureBuilder(
          future: InAppWebViewController.getCurrentWebViewPackage(),
          builder: (context, snapshot) {
            String packageDescription = "";
            if (snapshot.hasData) {
              WebViewPackageInfo packageInfo =
                  snapshot.data as WebViewPackageInfo;
              packageDescription =
                  "${packageInfo.packageName ?? ""} - ${packageInfo.versionName ?? ""}";
            }
            return ListTile(
              title: const Text("WebView Package Info"),
              subtitle: Text(packageDescription),
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: packageDescription));
              },
            );
          },
        )
      ]);
    }

    return widgets;
  }

  List<Widget> _buildWebViewTabSettings() {
    var browserModel = Provider.of<BrowserModel>(context, listen: true);
    var currentWebViewModel = Provider.of<WebViewModel>(context, listen: true);
    var webViewController = currentWebViewModel.webViewController;

    var widgets = <Widget>[
      const ListTile(
        title: Text("Current WebView Settings"),
        enabled: false,
      ),
      SwitchListTile(
        title: const Text("JavaScript Enabled"),
        subtitle:
            const Text("Sets whether the WebView should enable JavaScript."),
        value: currentWebViewModel.settings?.javaScriptEnabled ?? true,
        onChanged: (value) async {
          currentWebViewModel.settings?.javaScriptEnabled = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Cache Enabled"),
        subtitle:
            const Text("Sets whether the WebView should use browser caching."),
        value: currentWebViewModel.settings?.cacheEnabled ?? true,
        onChanged: (value) async {
          currentWebViewModel.settings?.cacheEnabled = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      StatefulBuilder(
        builder: (context, setState) {
          return ListTile(
            title: const Text("Custom User Agent"),
            subtitle: Text(
                currentWebViewModel.settings?.userAgent?.isNotEmpty ?? false
                    ? currentWebViewModel.settings!.userAgent!
                    : "Set a custom user agent ..."),
            onTap: () {
              _customUserAgentController.text =
                  currentWebViewModel.settings?.userAgent ?? "";

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.all(0.0),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  onSubmitted: (value) async {
                                    currentWebViewModel.settings?.userAgent =
                                        value;
                                    webViewController?.setSettings(
                                        settings:
                                            currentWebViewModel.settings ??
                                                InAppWebViewSettings());
                                    currentWebViewModel.settings =
                                        await webViewController?.getSettings();
                                    browserModel.save();
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Custom User Agent'),
                                  controller: _customUserAgentController,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.go,
                                  maxLines: null,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      SwitchListTile(
        title: const Text("Support Zoom"),
        subtitle: const Text(
            "Sets whether the WebView should not support zooming using its on-screen zoom controls and gestures."),
        value: currentWebViewModel.settings?.supportZoom ?? true,
        onChanged: (value) async {
          currentWebViewModel.settings?.supportZoom = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Media Playback Requires User Gesture"),
        subtitle: const Text(
            "Sets whether the WebView should prevent HTML5 audio or video from autoplaying."),
        value: currentWebViewModel.settings?.mediaPlaybackRequiresUserGesture ??
            true,
        onChanged: (value) async {
          currentWebViewModel.settings?.mediaPlaybackRequiresUserGesture =
              value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Vertical ScrollBar Enabled"),
        subtitle: const Text(
            "Sets whether the vertical scrollbar should be drawn or not."),
        value: currentWebViewModel.settings?.verticalScrollBarEnabled ?? true,
        onChanged: (value) async {
          currentWebViewModel.settings?.verticalScrollBarEnabled = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Horizontal ScrollBar Enabled"),
        subtitle: const Text(
            "Sets whether the horizontal scrollbar should be drawn or not."),
        value: currentWebViewModel.settings?.horizontalScrollBarEnabled ?? true,
        onChanged: (value) async {
          currentWebViewModel.settings?.horizontalScrollBarEnabled = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Disable Vertical Scroll"),
        subtitle: const Text(
            "Sets whether vertical scroll should be enabled or not."),
        value: currentWebViewModel.settings?.disableVerticalScroll ?? false,
        onChanged: (value) async {
          currentWebViewModel.settings?.disableVerticalScroll = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Disable Horizontal Scroll"),
        subtitle: const Text(
            "Sets whether horizontal scroll should be enabled or not."),
        value: currentWebViewModel.settings?.disableHorizontalScroll ?? false,
        onChanged: (value) async {
          currentWebViewModel.settings?.disableHorizontalScroll = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Disable Context Menu"),
        subtitle:
            const Text("Sets whether context menu should be enabled or not."),
        value: currentWebViewModel.settings?.disableContextMenu ?? false,
        onChanged: (value) async {
          currentWebViewModel.settings?.disableContextMenu = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      ListTile(
        title: const Text("Minimum Font Size"),
        subtitle: const Text("Sets the minimum font size."),
        trailing: SizedBox(
          width: 50.0,
          child: TextFormField(
            initialValue:
                currentWebViewModel.settings?.minimumFontSize.toString(),
            keyboardType: const TextInputType.numberWithOptions(),
            onFieldSubmitted: (value) async {
              currentWebViewModel.settings?.minimumFontSize = int.parse(value);
              webViewController?.setSettings(
                  settings:
                      currentWebViewModel.settings ?? InAppWebViewSettings());
              currentWebViewModel.settings =
                  await webViewController?.getSettings();
              browserModel.save();
              setState(() {});
            },
          ),
        ),
      ),
      SwitchListTile(
        title: const Text("Allow File Access From File URLs"),
        subtitle: const Text(
            "Sets whether JavaScript running in the context of a file scheme URL should be allowed to access content from other file scheme URLs."),
        value:
            currentWebViewModel.settings?.allowFileAccessFromFileURLs ?? false,
        onChanged: (value) async {
          currentWebViewModel.settings?.allowFileAccessFromFileURLs = value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
      SwitchListTile(
        title: const Text("Allow Universal Access From File URLs"),
        subtitle: const Text(
            "Sets whether JavaScript running in the context of a file scheme URL should be allowed to access content from any origin."),
        value: currentWebViewModel.settings?.allowUniversalAccessFromFileURLs ??
            false,
        onChanged: (value) async {
          currentWebViewModel.settings?.allowUniversalAccessFromFileURLs =
              value;
          webViewController?.setSettings(
              settings: currentWebViewModel.settings ?? InAppWebViewSettings());
          currentWebViewModel.settings = await webViewController?.getSettings();
          browserModel.save();
          setState(() {});
        },
      ),
    ];

    return widgets;
  }
}
