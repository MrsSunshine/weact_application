import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weact_application/services/auth.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  Choice _selectedChoice = choices[0]; // The app's "state".
  final AuthService _auth = AuthService();
  void _select(Choice choice) async {
    // Causes the app to rebuild with the new _selectedChoice.
    await _auth.signOut();
    Navigator.of(context).pushNamed('/signup');
  }

  final db = Firestore.instance;
  final String _fullName = "Serena Bono";
  final String _status = "Engineering Student";
  final String _bio =
      "If you’re in business, chances are you’ll have come across slide decks. Much like a deck of cards, each slide plays a key part in the overall ‘deck’, creating a well-rounded presentation."
      "If you need to inform your team, present findings, or outline a new strategy, slides are one of the most effective ways to do this."
      "Google Slides is one of the best ways to create a slide deck right now. It’s easy to use and has built-in design tools that integrate with Adobe, Lucidchart, and more. The best part — it’s free!";

  var _createdEvents = 0;
  TextStyle _statLabelTextStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.blue,
    fontSize: 16.0,
    fontWeight: FontWeight.w200,
  );

  TextStyle _statBioTextStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w200,
  );

  TextStyle _StatCountTextStyle = TextStyle(
    color: Colors.blue[54],
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );
  TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.blue,
      fontSize: 28.0,
      fontWeight: FontWeight.w700);

  TextStyle _nameReviewStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.blue,
      fontSize: 20.0,
      fontWeight: FontWeight.w300);

  Widget _buildImageCover(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/universe.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFullName() {
    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profile.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(
              color: Colors.white,
              width: 8.0,
            )),
      ),
    );
  }

  Color check(int number) {
    return (number > 0) ? Colors.yellow : Colors.grey;
  }

  Widget _UserRating(int number) {
    int num1 = number;
    Color _color = Colors.yellow;
    return Container(
      child: Row(
        children: <Widget>[
          new IconButton(icon: new Icon(Icons.star, color: check(number--))),
          new IconButton(icon: new Icon(Icons.star, color: check(number--))),
          new IconButton(icon: new Icon(Icons.star, color: check(number--))),
          new IconButton(icon: new Icon(Icons.star, color: check(number--))),
          new IconButton(icon: new Icon(Icons.star, color: check(number--))),
          Text(num1.toString(),
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.blue,
                fontSize: 16.0,
                fontWeight: FontWeight.w200,
              ))
        ],
      ),
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.blue,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  String checkBio(String _bio) {
    String trial =
        "If you’re in business, chances are you’ll have come across slide decks. Much like a deck of cards, each slide plays a key part in the overall ‘deck’, creating a well-rounded";
    return _bio.substring(0, trial.length);
  }

  Widget _BuildStatItem(String label, String count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _createdEvents.toString(),
          style: _StatCountTextStyle,
        ),
        Text('Organized Events', style: _statLabelTextStyle)
      ],
    );
  }

  Widget _BuildStatContainer(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(),
      child: Container(
        child: Text(checkBio(_bio), style: _statBioTextStyle),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      ),
    );
  }

  Widget _buildPopMenuButton() {
    return PopupMenuButton<Choice>(
      onSelected: _select,
      itemBuilder: (BuildContext context) {
        return choices.map((Choice choice) {
          return PopupMenuItem<Choice>(
            value: choice,
            child: Row(
              children: <Widget>[
                Text(choice.title, style: TextStyle(color: Colors.black)),
                Icon(
                  choice.icon,
                  color: Colors.black,
                ),
              ],
            ),
          );
        }).toList();
      },
    );
  }

  Widget _BuildStatContainer1() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _BuildStatItem("Created Events", _createdEvents.toString()),
        ],
      ),
    );
  }

  Widget _BuildStatContainer2() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _UserRating(2),
        ],
      ),
    );
  }

  Widget _buildReviews(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: StreamBuilder(
          stream: db.collection("reviews").snapshots(),
          // ignore: missing_return
          builder: (context, snapshot) {
            final reviews = snapshot.data.documents;
            if (!snapshot.hasData) {
              return Text('Loading data... Please wait...',
                  style: _statLabelTextStyle);
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[for (var i in reviews) _ReviewItem(i)],
              );
            }
          }),
    );
  }

  Widget _ReviewItem(var i) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(i.data['name'], style: _statLabelTextStyle),
          _UserRating(i.data['starNum']),
        ]),
        Container(
          child: Text(
            i.data['review'],
            style: _statBioTextStyle,
          ),
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("WeAct"),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          _buildPopMenuButton(),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildImageCover(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.8),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                  _BuildStatContainer(context),
                  _BuildStatContainer1(),
                  _BuildStatContainer2(),
                  Container(
                    child: Text("Reviews", style: _statLabelTextStyle),
                    alignment: Alignment.bottomCenter,
                    height: 50,
                  ),
                  _buildReviews(context),
                  //_Reviews(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Logout', icon: Icons.exit_to_app)
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
