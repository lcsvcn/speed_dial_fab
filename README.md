# Speed Dial - Float Action Button

[![Pub Version](https://img.shields.io/pub/v/speed_dial_fab)](https://pub.dev/packages/speed_dial_fab)

A Speed Dial FAB widget for Flutter

![](/https://i.imgur.com/NUYF5KQ.gif)
<img src="https://i.imgur.com/NUYF5KQ.gif"  width="375" height="667">

**Please note**: Most of the support on debugging new issues relies on the open source community.

## Usage

To use speed_dial_fab, `import` the `speed_dial_fab` module and use the `speed_dial_fab` Widget. More usage examples can be seen under the `examples/` folder.

Here is the Primary and Secondary FAB reference:

![](/https://i.imgur.com/n6qPgzD.png)
<img src="https://i.imgur.com/n6qPgzD.png"  width="300" height="250">

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

default: `null` (No tooltip)

#### `primaryIconExpand`

Change the icon for the principal FAB when the secondary FABs aren't visible. Expand secondary FABS.

propType: `IconData`

default: `Icons.expand_less`

#### `primaryIconCollapse`

Change the icon for the principal FAB when the secondary FABs are visible. Close/Collapse secondary FABS.

propType: `IconData`

default: `Icons.expand_less`

primaryElevation
Change the elevation of the primary FAB button.

propType: `double`

default: `10.0`

secondaryElevation
Change the elevation of the secondary FAB button.

propType: `double`

default: `10.0`

#### `rotateAngle`

Change the animation icon for the principal FAB, when is clicked.

propType: `double`

default: 'math.pi (180°)

## Stateful functions

#### `forceExpandSecondaryFab`

Force animation of expand the secondary fab. Note: This can mess the animation, so use it wisely.

#### `forceCollapseSecondaryFab`

Force animation of collapse the secondary fab. Note: This can mess the animation, so use it wisely.


Please open an issue if something doesn't work or is not clear enough.

## ToDo
- [ ] Add Test to every components

## License
See [LICENSE.md](LICENSE.md)
