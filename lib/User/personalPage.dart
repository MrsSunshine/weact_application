import 'package:flutter/material.dart';
  class PersonalPage extends StatelessWidget{
    final String _fullName= "Serena Bono";
    final String _status = "Engineering Student";
    final String _bio="If you’re in business, chances are you’ll have come across slide decks. Much like a deck of cards, each slide plays a key part in the overall ‘deck’, creating a well-rounded presentation."
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

    Widget _buildImageCover(Size screenSize){
      return Container(
        height: screenSize.height/2.6,
        decoration:  BoxDecoration(
          image:  DecorationImage(image: AssetImage("assets/universe.jpg"),
              fit: BoxFit.cover,
          ),
        ),
      );
    }



    Widget _buildFullName(){
      TextStyle _nameTextStyle=TextStyle(
        fontFamily: 'Roboto',
        color:  Colors.blue,
        fontSize: 28.0,
        fontWeight: FontWeight.w700
      );
      return Text(
        _fullName,
        style: _nameTextStyle,
      );
    }


    Widget _buildProfileImage(){
      return Center(
        child: Container(
          width:  140.0,
          height:  140.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profile.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(
              color: Colors.blue,
              width: 8.0,
            )
          ),
        ),
      );
    }
    Color check(int number){
      return (number>0)?Colors.yellow:Colors.grey;
    }
    Widget _UserRating(int number){
      int num1=number;
      Color _color=Colors.yellow;
      return Container(
        child: Row(
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.star, color: check(number--))),
            new IconButton(icon: new Icon(Icons.star,color: check(number--))),
            new IconButton(icon: new Icon(Icons.star,color: check(number--))),
            new IconButton(icon: new Icon(Icons.star,color: check(number--))),
            new IconButton(icon: new Icon(Icons.star,color: check(number--))),
            Text(num1.toString(), style: TextStyle(fontFamily: 'Roboto',
              color: Colors.blue,
              fontSize: 16.0,
              fontWeight: FontWeight.w200,))
          ],
        ),
      );
    }
    Widget _buildStatus(BuildContext context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
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
      String trial = "If you’re in business, chances are you’ll have come across slide decks. Much like a deck of cards, each slide plays a key part in the overall ‘deck’, creating a well-rounded";
      return _bio.substring(0, trial.length);
    }

    Widget _BuildStatItem(String label, String count){
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
    Widget _BuildStatContainer(BuildContext context){
      return Container(
        height:  60.0,
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(checkBio(_bio), style: _statBioTextStyle),
          ],
        ),
      );
    }
    Widget _BuildStatContainer1(){
      return Container(
        height:  60.0,
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
    Widget _BuildStatContainer2(){
      return Container(
        height:  60.0,
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Color(0xFFEFF4F7),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _UserRating(4),
          ],
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;
      return Scaffold(
        body: Stack(
          children: <Widget>[
            _buildImageCover(screenSize),
            SafeArea(
              child:  SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height/6.8),
                    _buildProfileImage(),
                    _buildFullName(),
                    _buildStatus(context),
                    _BuildStatContainer(context),
                    _BuildStatContainer1(),
                    _BuildStatContainer2(),
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
