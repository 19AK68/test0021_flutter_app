import 'package:flutter/material.dart';

class NewsBoxFavourit extends StatefulWidget {
  final int _num;
  final bool _like;
  NewsBoxFavourit(this._num,this._like);

  @override
    createState() => new NewsBoxFavouritState(this._num,this._like);
}

class NewsBoxFavouritState extends State<NewsBoxFavourit> {
  int num;
  bool like=false;

  NewsBoxFavouritState(this.num,this.like);

  void pressButton(){
    setState(() {
      like = !like;
      if(like) num++;
      else num--;

    });
  }

  @override
  Widget build(BuildContext context) {

    return new Column( children: <Widget>[
      new Text('В избранное\n$num',textAlign: TextAlign.center,),
      new IconButton(
          icon:new Icon(like ? Icons.star :Icons.star_border,size:30.0, color: Colors.red[500], ),
          onPressed: pressButton)
    ],);
  }

}


class NewsBox extends StatelessWidget {

  final String _title;
  final String _text;
  String _imagesurl;
  int _num;
  bool _like;

  NewsBox(this._title,this._text,{String imageurl, int num =0, bool like = false}){

    _imagesurl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imagesurl != null && _imagesurl != '') return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: <Widget>[
          new Image.network(_imagesurl, width: 100.0, height: 100.0, fit: BoxFit.cover,),
          new Expanded(child: new Container (padding: new EdgeInsets.all(5.0), child: new Column  (children: <Widget>[
            new Text(_title,  style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
            new Expanded (child:new Text(_text, softWrap: true, maxLines: 4, textAlign: TextAlign.justify,))
          ], ))),
          new NewsBoxFavourit(_num,_like)
        ]
        ),
    );

    return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: <Widget>[
          new Expanded(child: new Container(padding: new EdgeInsets.all(5.0), child: new Column (children: <Widget>[
            new Text(_title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
            new Expanded(child:new Text(_text, softWrap: true, maxLines: 4, textAlign: TextAlign.justify,))
          ],))),
          new NewsBoxFavourit(_num,_like)
        ])
    );
  }
}



void main (){
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          appBar: new AppBar(),
          body: new NewsBox('Новый урок',
              'бла-бла-бла бла бла бла бла-бла-бла бла бла блабла-бла-бла бла бла блабла-бла-бла бла бла бла',
              imageurl: 'https://flutter.su/favicon.png', like:true, num: 101, ),


      )
  )
  );

}