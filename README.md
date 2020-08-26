# Speed Dial - Float Action Button (speed_dial_fab)

A Speed Dial FAB widget for Flutter

This module was originally written because the author couldn't find a module that could be simply plugged into a project without requiring too much setup.

_**Please note**: Most of the support on debugging new issues, especially with Android, relies on the open source community. The project is on the look out for active contributors who want to maintain this library more rigorously.

## Getting started

### Requirements
### To install and start using react-native-qrcode-scanner:

1. `Add speed_dial_fab to your pubspec.yaml`
## Usage

To use react-native-qrcode-scanner, `import` the `react-native-qrcode-scanner` module and use the `<QRCodeScanner />` tag. More usage examples can be seen under the `examples/` folder.

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

![fab collapsed](https://imgur.com/a/bsXu9It)
![fab collapsed](https://i.imgur.com/weziv3c.png)

Please open an issue if something doesn't work or is not clear enough.

## Props

#### `backgroundColor`

Change the backgroundColor of the secondary FAB buttons

propType: `Color`
default: `Colors.white`

#### `foregroundColor`

Change the foregroundColor of the secondary FAB buttons

propType: `Color`
default: `Colors.black`

#### `secondaryIconsList`

Change the icons of the secondary FAB buttons

propType: `List[IconData]`

REQUIRED!

#### `secondaryIconsTooltip`

Change the tooltip of the icon for the secondary FAB buttons

propType: `List[String]`
default: 'null' (No tooltip)

#### `principalIconExpand`

Change the icon for the principal FAB when the secondary FABs aren't visible. Expand secondary FABS.

propType: `IconData`
default: 'Icons.more_vert'

#### `principalIconClose`

Change the icon for the principal FAB when the secondary FABs are visible. Close/Collapse secondary FABS.

propType: `IconData`
default: 'Icons.close'

## License

See [LICENSE.md](LICENSE.md)