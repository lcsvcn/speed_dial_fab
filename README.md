# Speed Dial - Float Action Button (speed_dial_fab)

A Speed Dial FAB widget for Flutter

This module was originally written because the author couldn't find a module that could be simply plugged into a project without requiring too much setup.

_**Please note**: Most of the support on debugging new issues, especially with Android, relies on the open source community. The project is on the look out for active contributors who want to maintain this library more rigorously.

## Getting started

### Requirements
### To install and start using speed_dial_fab:

1. `Add speed_dial_fab to your pubspec.yaml`
## Usage

To use speed_dial_fab, `import` the `speed_dial_fab` module and use the `speed_dial_fab` Widget. More usage examples can be seen under the `examples/` folder.

Here is an example of basic usage:

```
import 'package:flutter/material.dart';
import 'package:speed_dial_fab/speed_dial_fab_widget.dart';

class MyHomeView extends StatefulWidget {
  final String title;
  
  MyHomeView({Key key, this.title})
      : super(key: key);

  @override
  _MyHomeViewState createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDialFabWidget(
        secondaryIconsList: [
          Icons.content_copy,
          Icons.content_paste,
          Icons.content_cut,
        ],
        secondaryIconsTooltip: [
          "Copy",
          "Paste",
          "Cut",
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
            child: Text("Test Speed Dial FAB"),
        ),
      ),
    );
  }
}

```

Screenshot of the above:

![](/https://i.imgur.com/weziv3c.png)
<img src="https://i.imgur.com/weziv3c.png"  width="375" height="667">

![](/https://i.imgur.com/n6qPgzD.png)
<img src="https://i.imgur.com/n6qPgzD.png"  width="300" height="250">

Please open an issue if something doesn't work or is not clear enough.

## Props

#### `primaryBackgroundColor`

Change the background color of the primary FAB button.

propType: `Color`
default: `Colors.white`

#### `primaryForegroundColor`

Change the foregroundColor of the primary FAB button.

propType: `Color`
default: `Colors.black`

#### `secondaryBackgroundColor`

Change the background color of the secondary FAB buttons.

propType: `Color`
default: `Colors.white`

#### `secondaryForegroundColor`

Change the foreground color of the secondary FAB buttons.


propType: `Color`
default: `Colors.black`

#### `secondaryIconsList`

Change the icons of the secondary FAB buttons.

propType: `List[IconData]`

REQUIRED!

#### `secondaryIconsOnPress`

An array of function that will be called when secondary button is clicked

propType: `List[Function]`

REQUIRED!

#### `secondaryIconsText`

Change the text of the icon for the secondary FAB buttons, the little ones that expand and colapse from the main FAB.

propType: `List[String]`
default: 'null' (No tooltip)

#### `principalIconExpand`

Change the icon for the principal FAB when the secondary FABs aren't visible. Expand secondary FABS.

propType: `IconData`
default: 'Icons.expand_less'

#### `principalIconCollapse`

Change the icon for the principal FAB when the secondary FABs are visible. Close/Collapse secondary FABS.

propType: `IconData`
default: 'Icons.expand_less'

#### `rotateAngle`

Change the animation icon for the principal FAB, when is clicked.

propType: `double`
default: 'math.pi (180°)

## License

See [LICENSE.md](LICENSE.md)
