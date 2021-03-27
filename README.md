# Speed Dial - Float Action Button=
[![Pub Version](https://img.shields.io/pub/v/speed_dial_fab)](https://pub.dev/packages/speed_dial_fab)
![LastCommit](https://img.shields.io/github/last-commit/lcsvcn/speed_dial_fab) 
[![xs:code](https://img.shields.io/static/v1?logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iNDUiIHZpZXdCb3g9IjAgMCAzMCA0NSIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTIwLjgzMjEgMzcuNDg4OVYyOS40NzJDMjAuODMyMSAyNi43NjQ1IDE5LjI5NjggMjQuNjY5MiAxNi44NTMxIDI0Ljk1NDJWMjAuMTgzMUMxOS4yOTY4IDIwLjQ2MjggMjAuODMyMSAxOC4zNTcgMjAuODMyMSAxNS42NDQyVjcuNjI3MjhDMjAuODMyMSAwLjI5MTE2NiAyNS4xMjQ2IDAuODEzNjY1IDI5LjM3NDYgMC44MTM2NjVWNC44MDM2NkMyNi45MzA5IDQuNTIzOTQgMjUuMzk1NiA0LjkxNDUgMjUuMzk1NiA3LjYyNzI4VjE1LjY0NDJDMjUuMzk1NiAxOC43NDc2IDI0LjQyODcgMjEuMTE3MyAyMi4zODM0IDIyLjUzMTdDMjQuNDI4NyAyMy45OTg5IDI1LjM5NTYgMjYuMzY4NyAyNS4zOTU2IDI5LjQ3MlYzNy40ODg5QzI1LjM5NTYgNDAuMTk2NCAyNi45MzA5IDQwLjU5MjMgMjkuMzc0NiA0MC4zMTI2VjQ0LjYwMzRDMjUuNjkzMSA0NC41OTgxIDIwLjgzMjEgNDQuODI1MSAyMC44MzIxIDM3LjQ4ODlaIiBmaWxsPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNMC41MDY0MDkgNDQuNTk4MVY0MC4zMDczQzIuOTUwMTYgNDAuNTg3IDQuNDg1NDcgNDAuMTk2NCA0LjQ4NTQ3IDM3LjQ4MzZWMjkuNDcyQzQuNDg1NDcgMjYuMzY4NiA1LjQ1MjM1IDIzLjk5ODkgNy40OTc2NiAyMi41MzE3QzUuNDUyMzUgMjEuMTIyNSA0LjQ4NTQ3IDE4Ljc0NzUgNC40ODU0NyAxNS42NDQyVjcuNjI3MjVDNC40ODU0NyA0LjkxOTc1IDIuOTUwMTYgNC41MjM5MiAwLjUwNjQwOSA0LjgwMzY0VjAuODEzNjM4QzQuNzU2NDEgMC44MTM2MzggOS4wNDg5MSAwLjI4NTg2IDkuMDQ4OTEgNy42MjcyNVYxNS42NDQyQzkuMDQ4OTEgMTguMzUxNyAxMC41ODQyIDIwLjQ2MjggMTMuMDI4IDIwLjE4MzFWMjQuOTU0MkMxMC41ODQyIDI0LjY3NDUgOS4wNDg5MSAyNi43NjQ1IDkuMDQ4OTEgMjkuNDcyVjM3LjQ4ODlDOS4wNDg5MSA0NC44MjUgNC4xOTMyOCA0NC41OTgxIDAuNTA2NDA5IDQ0LjU5ODFaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K&message=xs:code&label=Ping+me+on&color=%23007EFF)](https://xscode.com/profile/lcsvcn)

Migrated from Gitlab: https://gitlab.com/lcsvcn/speed-dial-float-action-button

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

Please open an issue if something doesn't work or is not clear enough.

## License
See [LICENSE.md](LICENSE.md)
