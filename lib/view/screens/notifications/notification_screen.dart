import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // static final String oneSignalAppId ="d49b08f8-3995-4469-98e8-d5b30a77dcce";
  @override
  void initState() {
    super.initState();
    initOneSignal();
  }
  bool _requireConsent = false;
  bool _enableConsentButton = false;
  String _debugLabelString = "";
  String? _emailAddress;
  String? _smsNumber;
  String? _externalUserId;
  String? _language;
  Future<void> initOneSignal() async {
    if (!mounted) return;

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.consentRequired(_requireConsent);

    OneSignal.initialize("d49b08f8-3995-4469-98e8-d5b30a77dcce");

    OneSignal.Notifications.clearAll();
    OneSignal.User.pushSubscription.addObserver((state) {
      print(OneSignal.User.pushSubscription.optedIn);
      print(OneSignal.User.pushSubscription.id);
      print(OneSignal.User.pushSubscription.token);
      print(state.current.jsonRepresentation());
    });
    OneSignal.Notifications.addPermissionObserver((state) {
      print("Has permission " + state.toString());
    });

    OneSignal.Notifications.addClickListener((event) {
      print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      this.setState(() {
        _debugLabelString = "Clicked notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.InAppMessages.addClickListener((event) {
      this.setState(() {
        _debugLabelString =
        "In App Message Clicked: \n${event.result.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.InAppMessages.addWillDisplayListener((event) {
      print("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDisplayListener((event) {
      print("ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addWillDismissListener((event) {
      print("ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDismissListener((event) {
      print("ON DID DISMISS IN APP MESSAGE ${event.message.messageId}");
    });

    this.setState(() {
      // enableConsentButton = requireConsent;
    });

    // Some examples of how to use In App Messaging public methods with OneSignal SDK
    oneSignalInAppMessagingTriggerExamples();

    // Some examples of how to use Outcome Events public methods with OneSignal SDK
    oneSignalOutcomeExamples();

    OneSignal.InAppMessages.paused(true);


  }
  void _handleSendTags() {
    print("Sending tags");
    OneSignal.User.addTagWithKey("test2", "val2");

    print("Sending tags array");
    var sendTags = {'test': 'value', 'test2': 'value2'};
    OneSignal.User.addTags(sendTags);
  }

  void _handleRemoveTag() {
    print("Deleting tag");
    OneSignal.User.removeTag("test2");

    print("Deleting tags array");
    OneSignal.User.removeTags(['test']);
  }

  void _handlePromptForPushPermission() {
    print("Prompting for Permission");
    OneSignal.Notifications.requestPermission(true);
  }

  void _handleSetLanguage() {
    if (_language == null) return;
    print("Setting language");
    OneSignal.User.setLanguage(_language!);
  }

  void _handleSetEmail() {
    if (_emailAddress == null) return;
    print("Setting email");

    OneSignal.User.addEmail(_emailAddress!);
  }

  void _handleRemoveEmail() {
    if (_emailAddress == null) return;
    print("Remove email");

    OneSignal.User.removeEmail(_emailAddress!);
  }

  void _handleSetSMSNumber() {
    if (_smsNumber == null) return;
    print("Setting SMS Number");

    OneSignal.User.addSms(_smsNumber!);
  }

  void _handleRemoveSMSNumber() {
    if (_smsNumber == null) return;
    print("Remove smsNumber");

    OneSignal.User.removeSms(_smsNumber!);
  }

  void _handleConsent() {
    print("Setting consent to true");
    OneSignal.consentGiven(true);

    print("Setting state");
    this.setState(() {
      _enableConsentButton = false;
    });
  }

  void _handleSetLocationShared() {
    print("Setting location shared to true");
    OneSignal.Location.setShared(true);
  }

  void _handleLogin() {
    print("Setting external user ID");
    if (_externalUserId == null) return;
    OneSignal.login(_externalUserId!);
    OneSignal.User.addAlias("fb_id", "1341524");
  }

  void _handleLogout() {
    OneSignal.logout();
    OneSignal.User.removeAlias("fb_id");
  }


  oneSignalInAppMessagingTriggerExamples() async {
    /// Example addTrigger call for IAM
    /// This will add 1 trigger so if there are any IAM satisfying it, it
    /// will be shown to the user
    OneSignal.InAppMessages.addTrigger("trigger_1", "one");

    /// Example addTriggers call for IAM
    /// This will add 2 triggers so if there are any IAM satisfying these, they
    /// will be shown to the user
    Map<String, String> triggers = new Map<String, String>();
    triggers["trigger_2"] = "two";
    triggers["trigger_3"] = "three";
    OneSignal.InAppMessages.addTriggers(triggers);

    // Removes a trigger by its key so if any future IAM are pulled with
    // these triggers they will not be shown until the trigger is added back
    OneSignal.InAppMessages.removeTrigger("trigger_2");

    // Create a list and bulk remove triggers based on keys supplied
    List<String> keys = ["trigger_1", "trigger_3"];
    OneSignal.InAppMessages.removeTriggers(keys);

    // Toggle pausing (displaying or not) of IAMs
    OneSignal.InAppMessages.paused(true);
    var arePaused = await OneSignal.InAppMessages.arePaused();
    print('Notifications paused ${arePaused}');
  }
  oneSignalOutcomeExamples() async {
    OneSignal.Session.addOutcome("normal_1");
    OneSignal.Session.addOutcome("normal_2");

    OneSignal.Session.addUniqueOutcome("unique_1");
    OneSignal.Session.addUniqueOutcome("unique_2");

    OneSignal.Session.addOutcomeWithValue("value_1", 3.2);
    OneSignal.Session.addOutcomeWithValue("value_2", 3.9);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(appBarContent: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.chevron_left_rounded,size: 24,),
          ),
          const CustomText(
            text: 'Notifications',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
          const SizedBox()
        ],
      )),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }





}
