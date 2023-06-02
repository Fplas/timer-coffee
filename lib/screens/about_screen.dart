import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatelessWidget {
  Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ExpansionTile(
                title: Text('About'),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Timer.Coffee App is created by Anton Karliner, a coffee enthusiast, media specialist, and photojournalist. You can view my photojournalistic work ',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: 'here',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchURL('https://www.karliner.photo/');
                              },
                          ),
                          TextSpan(
                            text:
                                '. I hope that this app will help you enjoy your coffee. Feel free to contribute on Github. Icons by Ionicons (MIT license).',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('License'),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Copyright (c) 2023 Anton Karliner'),
                        Text(
                            'This application is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.'),
                        TextButton(
                          onPressed: () => _launchURL(
                              'https://www.gnu.org/licenses/gpl-3.0.html'),
                          child: Text(
                            'Read the GNU General Public License v3',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Privacy policy'),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      kIsWeb
                          ? '''
Privacy Policy for Timer.Coffee (Web Version)

1. INTRODUCTION

Timer.Coffee respects the privacy of its users and is committed to protecting it in all respects. This policy will explain how Coffee Timer uses the personal data we collect from you when you use our web application.

2. DATA COLLECTION AND USAGE

The tracking script aggregates the following statistical information:

    The day of the week (As in: Monday, Tuesday, ...)
    Your users device (As in Phone, Tablet or Computer)
    The date of the visit
    From which other website a visit originated.
    The users browser (As in: Firefox, Chrome, Microsoft Edge, ...)
    The hour component of the current time in a day
    A country mapped to the users IP address.
    The users operating system (As in: Windows or Mac)
    Information on the users screen size
    The users preferred language
    Pages visited

3. COOKIES

Timer.Coffee uses cookies to collect anonymous data for improving user experience and for analytical purposes.

4. SECURITY

We value your trust in providing us your personal information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.

5. PRIVACY POLICIES OF OTHER WEBSITES

The Timer.Cofee app contains links to other websites. Our privacy policy applies only to our app, so if you click on a link to another website or service, you should read their privacy policy.

6. CHANGES TO OUR PRIVACY POLICY

We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.

7. CONTACT US

For any questions or clarifications regarding the Privacy Policy, please contact us at support@timer.coffee

8. HOW TO CONTACT THE APPROPRIATE AUTHORITY

Should you wish to report a complaint or if you feel that Timer.Coffee has not addressed your concern in a satisfactory manner, you may contact your local data protection authority.

9. TRADEMARKS

All trademarks, service marks, trade names, trade dress, product names and logos appearing in the app are the property of their respective owners.
'''
                          : '''
Privacy Policy for Timer.Cofee

1. INTRODUCTION

Timer.Cofee respects the privacy of its users and is committed to protecting it in all respects. This policy will explain how Coffee Timer uses the personal data we collect from you when you use our app.

2. DATA COLLECTION AND USAGE

Timer.Cofee does not collect any personal data. We do not process any personal identification information or collect any data indirectly from other sources. As we do not collect any personal data, we have no data to share, sell, or use in any way.

3. COOKIES

Timer.Cofee does not use cookies. 

4. SECURITY

We value your trust in providing us your personal information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.

5. PRIVACY POLICIES OF OTHER WEBSITES

The Timer.Cofee app contains links to other websites. Our privacy policy applies only to our app, so if you click on a link to another website or service, you should read their privacy policy.

6. CHANGES TO OUR PRIVACY POLICY

We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.

7. CONTACT US

For any questions or clarifications regarding the Privacy Policy, please contact us at support@timer.coffee

8. HOW TO CONTACT THE APPROPRIATE AUTHORITY

Should you wish to report a complaint or if you feel that Timer.Cofee has not addressed your concern in a satisfactory manner, you may contact your local data protection authority.

9. TRADEMARKS

All trademarks, service marks, trade names, trade dress, product names and logos appearing in the app are the property of their respective owners.
''',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12.0, // space between buttons
                runSpacing: 2.0, // space between lines
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _launchURL('https://www.timer.coffee'),
                    icon: Icon(Ionicons.globe_outline),
                    label: Text('Website'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _launchURL(
                        'https://github.com/antonkarliner/coffee-timer'),
                    icon: Icon(Ionicons.logo_github),
                    label: Text('Github'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () =>
                        _launchURL('https://www.buymeacoffee.com/timercoffee'),
                    icon: Icon(Ionicons.cafe),
                    label: Text('Buy me a coffee'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              FutureBuilder<String>(
                future: getVersionNumber(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      'App Version: ${snapshot.data}',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
