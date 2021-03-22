# Speed Dial - Float Action Button
Migrated from Gitlab: https://gitlab.com/lcsvcn/speed-dial-float-action-button

A Speed Dial FAB widget for Flutter

![](/https://i.imgur.com/NUYF5KQ.gif)
<img src="https://i.imgur.com/NUYF5KQ.gif"  width="375" height="667">

**Please note**: Most of the support on debugging new issues relies on the open source community.

## Getting started

### Requirements
### To install and start using speed_dial_fab:

1. `Add speed_dial_fab to your pubspec.yaml`
## Usage

To use speed_dial_fab, `import` the `speed_dial_fab` module and use the `speed_dial_fab` Widget. More usage examples can be seen under the `examples/` folder.

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
