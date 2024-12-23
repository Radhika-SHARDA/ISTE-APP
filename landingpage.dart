import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ISTEApp(),
    );
  }
}

class ISTEApp extends StatefulWidget {
  @override
  _ISTEAppState createState() => _ISTEAppState();
}

class _ISTEAppState extends State<ISTEApp> {
  int currentIndex = 0;
  bool isDarkMode = false;

  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    updatePages();
  }

  void updatePages() {
    pages.clear();
    pages.add(LandingPage(isDarkMode: isDarkMode));
    pages.add(ChatPage(isDarkMode: isDarkMode));
    pages.add(TeamPage(isDarkMode: isDarkMode));
    pages.add(MoreOptionsPage(isDarkMode: isDarkMode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'ISTE : NITK',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.calendar_today, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
                updatePages();
              });
            },
          ),
        ],
        shape: Border(
          bottom: BorderSide(
            color: isDarkMode ? Colors.white : Colors.black,
            width: 1.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
  color: isDarkMode ? Colors.grey[900] : Colors.white,
),
        ////ADD HERE,
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed, 
  backgroundColor: isDarkMode ? Colors.black : Colors.white,
  selectedItemColor: isDarkMode ? Colors.white : Colors.black,
  unselectedItemColor: isDarkMode ? Colors.white : Colors.black,
  currentIndex: currentIndex,
  onTap: (index) {
    setState(() {
      currentIndex = index;
    });
  },
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Team'),
    BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More Options'),
  ],
),

    );
  }
}

class LandingPage extends StatelessWidget {
  final bool isDarkMode;

  const LandingPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  child: Icon(Icons.person, size: 50, color: isDarkMode ? Colors.black : Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'CHAITANYA MENON',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
                ),
                Text(
                  'CRYPT',
                  style: TextStyle(fontSize: 18, color: isDarkMode ? Colors.white70 : Colors.black54),
                ),
                Text(
                  'Mazdoor',
                  style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.white70 : Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Text(
            'UPCOMING EVENTS:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
          ),
          SizedBox(height: 16),
          EventBox(title: 'Dec 2: ISTE Meet the new recruits!', isDarkMode: isDarkMode),
          EventBox(title: 'Dec 5: ISTE CRYPT : Meet\'n Greet', isDarkMode: isDarkMode),
          SizedBox(height: 32),
          Text(
            'NOTIFICATIONS:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
          ),
          SizedBox(height: 16),
          NotificationBox(sender: 'Ansh', message: 'Be there on time!', isDarkMode: isDarkMode),
          NotificationBox(sender: 'Harsh', message: 'RR on December 6 bois!', isDarkMode: isDarkMode),
        ],
      ),
    );
  }
}

class EventBox extends StatelessWidget {
  final String title;
  final bool isDarkMode;

  const EventBox({required this.title, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}

class NotificationBox extends StatelessWidget {
  final String sender;
  final String message;
  final bool isDarkMode;

  const NotificationBox({required this.sender, required this.message, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            child: Text(
              sender[0],
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              '$sender: $message',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final bool isDarkMode;

  const ChatPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New chats here!',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}

class TeamPage extends StatelessWidget {
  final bool isDarkMode;

  const TeamPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Team Details here!',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}

class MoreOptionsPage extends StatelessWidget {
  final bool isDarkMode;

  const MoreOptionsPage({required this.isDarkMode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
  color: isDarkMode ? Colors.grey[900] : Colors.white,
),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(isDarkMode: isDarkMode)),
                );
              },
            ),
            Divider(
              color: isDarkMode ? Colors.white54 : Colors.black54,
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                'Change Password',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                // Navigate to Password Change page
              },
            ),
            Divider(
              color: isDarkMode ? Colors.white54 : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final bool isDarkMode;

  const ProfilePage({required this.isDarkMode, Key? key}) : super(key: key);

  Future<void> _downloadIDCard() async {
    final Uri url = Uri.parse(
        'https://example.com/iste_id_card.pdf'); // Replace with actual download link
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    double availableHeight = screenHeight - appBarHeight;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isDarkMode ? Colors.white : Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: AppBar(
            title: Text(
              'PROFILE',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            foregroundColor: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[900] : Colors.white,
        ),
        child: Column(
          children: [
            // Top side: Avatar and Info
            Container(
              height: availableHeight * 0.3,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // User details and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chaitanya Menon',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'B Tech, 2nd year',
                          style: TextStyle(
                            fontSize: 20,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          'ISTE Crypt',
                          style: TextStyle(
                            fontSize: 20,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          'Mazdoor',
                          style: TextStyle(
                            fontSize: 20,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Download icon on the right
                  IconButton(
                    icon: Icon(
                      Icons.download,
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: 30,
                    ),
                    onPressed: _downloadIDCard,
                    tooltip: 'Download ID Card',
                  ),
                ],
              ),
            ),
            // Add a border here
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              height: 1.0,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            // Bottom side: Tabs for Personal and Club Info
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[900] : Colors.white,
                      ),
                      child: TabBar(
                        labelColor: isDarkMode ? Colors.white : Colors.black,
                        unselectedLabelColor:
                            isDarkMode ? Colors.white70 : Colors.black54,
                        indicatorColor: isDarkMode ? Colors.white : Colors.black,
                        tabs: const [
                          Tab(text: 'Personal'),
                          Tab(text: 'Club'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Personal Info
                          Container(
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.grey[900] : Colors.white,
                            ),
                            child: ListView(
                              padding: const EdgeInsets.all(16),
                              children: [
                                _buildListTile(
                                    'Father\'s Name', 'S Krishna Das', isDarkMode),
                                _buildListTile(
                                    'Blood Group', 'AB+', isDarkMode),
                                _buildListTile(
                                    'Date of Birth', '09-02-2005', isDarkMode),
                                _buildListTile(
                                    'Phone Number', '8714727341', isDarkMode),
                                _buildListTile(
                                    'Email', 'chaitanya@nitk.edu.in', isDarkMode),
                                ListTile(
                                  title: Text(
                                    'Download ISTE ID Card',
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  trailing: Icon(Icons.download,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black),
                                  onTap: _downloadIDCard,
                                ),
                              ],
                            ),
                          ),
                          // Club Info
                          Container(
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.grey[900] : Colors.white,
                            ),
                            child: ListView(
                              padding: const EdgeInsets.all(16),
                              children: [
                                _buildListTile('SIG Name', 'Crypt', isDarkMode),
                                _buildListTile(
                                    'Year Joined', '2024', isDarkMode),
                                _buildListTile(
                                    'Position', 'Mazdoor', isDarkMode),
                                _buildListTile(
                                    'Number of Projects', '2', isDarkMode),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(String title, String subtitle, bool isDarkMode) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white70 : Colors.black54,
        ),
      ),
    );
  }
}
