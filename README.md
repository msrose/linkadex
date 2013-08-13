#Linkadex

You can sign up for a Linkadex account at http://linkadex.herokuapp.com.

Contents:
* [About](#about)
* [Terminology](#terminology)
  * [Groups](#groups)
  * [Links](#links)
  * [Colors](#colors)
* [Modes](#modes)
  * [Normal Mode](#normal-mode)
  * [Edit Mode](#edit-mode)
* [Contributing](#contributing)
* [Version Information](#version-information)

## About

Linkadex is a dynamic bookmark management application. What the heck does that even mean? Well, as an alternative to using bookmarks in a browser, I created a web page with my most frequently used links on it, specifically my first [personal page](http://www.michaelrose.heliohost.org). I soon found that all the links became outdated, because I would have to edit the source code every time I wanted to change, add, or remove a link. Linkadex solves this problem by providing a web interface to manage a page of bookmarks.

## Terminology

### Groups

A *group* is a container for many [links](#links). Groups can be used to, well, *group* similar links together. For example, on my Linkadex page, there is a group called *Waterloo*, where I keep all of the links related to my studies at the University of Waterloo.

Configuration options for groups include:

| Option     | Description                                                                                                                                           | Required? |
| ---        | ---                                                                                                                                                   | ---       |
| title      | The main heading for the group                                                                                                                        | Yes       |
| color      | The [color](#colors) that is associated with the group                                                                                                | Yes       |
| collapsed  | If `true`, the group's links will not be shown on the dashboard by default. If `false`, all links from the group will be visible.                     | Yes       |
| order rank | An integer determining what order the groups are displayed in. Groups with lower numbers are displayed first. Overrides any other ordering of groups. | No        |

### Links

A *link* is essentially a bookmark. A link belongs to a [group](#groups), and has three different [colors](#colors) associated with it. Configuration options include:

| Option           | Description                                                                                        | Required? |
| ---              | ---                                                                                                | ---       |
| title            | The text that will be displayed when the link is shown on the page                                 | Yes       |
| target           | If `blank`, the link opens in a new window. If `self`, the link opens in the same window           | Yes       |
| href             | The URL that the link open. Validation is done with `URI.regexp`                                   | Yes       |
| color            | The color that the title of the link will take when the link is displayed                          | Yes       |
| border color     | The color of the border surrounding the link title                                                 | Yes       |
| background color | The color of the background, on which the link title is displayed                                  | Yes       |
| order rank       | An integer determining what order the links are displayed in. Analogous to the *group* order rank. | No        |

### Colors

Linkadex requires every [link](#links) and [group](#groups) to be associated with a *color*. Created colors become part of the Linkadex palette, and the option to use a color for a link or group is provided upon creation. Colors have two configuration options:

| Option    | Description                                           | Required? |
| ---       | ---                                                   | ---       |
| alias     | A humanized name for the color                        | No        |
| hex value | A hexadecimal color code, such as `#FFF` or `#123ABC` | Yes       |

#### Color Clean-Up

The clean-up option will delete any colors that are not being used by a group or link. This is useful if you have done a palette redesign, and have many many colors that you'd now like to delete.

### Modes

#### Normal Mode

*Normal mode* simply displays the user's dashboard, with all their groups and links. Edit mode can be entered by clicking on the pencil in the upper right corner of the screen.

#### Edit Mode

*Edit mode* allows users to create and edit colors, groups, and links. The main difference from normal mode is the menu bar at the top. The dashboard provides links to the groups via the group title in this mode.

## Contributing

1. Fork the repository
2. Clone it and create a new feature branch: `git checkout -b feature/my-awesome-feature`
3. Push your branch: `git push origin feature/my-awesome-feature`
4. Submit a [pull request](https://github.com/msrose/linkadex/pulls)

## Version Information

The current stable release of Linkadex is [1.8.2](https://github.com/msrose/linkadex/releases/tag/v1.8.2).
