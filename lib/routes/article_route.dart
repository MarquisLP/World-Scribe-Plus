import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleRoute extends StatefulWidget {
  ArticleRoute({Key key, this.article}) : super(key: key);

  final Article article;

  @override
  _ArticleRouteState createState() => new _ArticleRouteState();
}

class _ArticleRouteState extends State<ArticleRoute> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildTabs(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(widget.article.name),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.book),
          onPressed: () { },
        ),
        PopupMenuButton<_OverflowOption>(
          onSelected: _selectOverflowOption,
          itemBuilder: (BuildContext context) {
            return overflowOptions.map((_OverflowOption option) {
              return PopupMenuItem<_OverflowOption>(
                value: option,
                child: Text(option.label),
              );
            }).toList();
          },
        ),
      ],
      bottom: TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.info),
            text: "INFO",
          ),
          Tab(
            icon: Icon(Icons.compare_arrows),
            text: "RELATIONS",
          ),
          Tab(
            icon: Icon(Icons.note),
            text: "SNIPPETS",
          ),
        ],
      ),
    );
  }

  void _selectOverflowOption(_OverflowOption option) {
  }

  Widget _buildTabs() {
    return TabBarView(
      children: <Widget>[
        _buildInfoTab(),
        _buildRelationsTab(),
        _buildSnippetsTab(),
      ],
    );
  }

  Widget _buildUnderConstructionTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.blue,
            size: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
          ),
          Text(
            "Under Construction",
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoTab() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: widget.article.image,
                ),
                Positioned(
                  child: Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.10,
                  ),
                  bottom: 12.0,
                  right: 12.0,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Nicknames / Aliases",
              ),
              maxLines: 1,
              controller: new TextEditingController(
                text: widget.article.aliases,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Age",
              ),
              maxLines: 1,
              controller: new TextEditingController(
                text: widget.article.age,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                hintText: "Description",
              ),
              controller: new TextEditingController(
                text: widget.article.description,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelationsTab() {
    var relations = widget.article.relations;
    
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: relations.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              color: Colors.white,
              margin: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: relations[index].image,
                    ),
                    title: Text(
                      relations[index].otherArticleName,
                    ),
                    subtitle: Text(
                      relations[index].title,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_up,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
                    child: Text(
                      relations[index].description,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: FlatButton(
                      child: Text(
                        'GO TO ARTICLE',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSnippetsTab() {
    return _buildUnderConstructionTab();
  }
}

/// A list item in the overflow menu.
class _OverflowOption {
  const _OverflowOption({this.label, this.icon});

  final String label;
  final IconData icon;
}

const List<_OverflowOption> overflowOptions = const <_OverflowOption>[
  const _OverflowOption(label: 'Rename Article', icon: Icons.edit),
  const _OverflowOption(label: 'Delete Article', icon: Icons.delete),
  const _OverflowOption(label: 'Settings', icon: Icons.settings),
];