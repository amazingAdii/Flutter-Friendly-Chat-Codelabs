import 'package:flutter/material.dart';

const String _name = "Aditya";

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];  
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: Text(
            "Friendly Chat",
            style: TextStyle(
                color: Colors.white,
              ),
            ),
        ),
        body: new Column(                                        //modified
          children: <Widget>[                                         //new
            new Flexible(                                             //new
              child: new ListView.builder(                            //new 
                padding: new EdgeInsets.all(8.0),                     //new
                reverse: true,                                        //new
                itemBuilder: (_, int index) => _messages[index],      //new
                itemCount: _messages.length,                          //new
              ),                                                      //new
            ),                                                        //new
            new Divider(height: 1.0),                                 //new
            new Container(                                            //new
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),                  //new
              child: _buildTextComposer(),                       //modified
            ),                                                        //new
          ],                                                          //new
        ),
      );
  }

  Widget _buildTextComposer() {
  return new IconTheme(                                            //new
    data: new IconThemeData(color: Theme.of(context).accentColor), //new
    child: new Container(                                     //modified
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmit,
              decoration: new InputDecoration.collapsed(
                hintText: "Send a message"),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              color: Colors.black54,
              icon: new Icon(Icons.send),
              onPressed: () => _handleSubmit(_textController.text)),
          ),
        ],
      ),
    ),                                                             //new
  );
}

  void _handleSubmit(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(                         //new
      text: text,                                                  //new
    );                                                             //new
    setState(() {                                                  //new
      _messages.insert(0, message);                                //new
    });
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}