#Linkage

Linkage is a dynamic bookmark management application. What the heck does that even mean? Well, as an alternative to using bookmarks in a browser, I created a web page with my most frequently used links on it, specifically my first [personal page](http://www.michaelrose.heliohost.org). I soon found that all the links became outdated, because I would have to edit the source code every time I wanted to change, add, or remove a link. Linkage solves this problem.

## Terminology

### Groups

A *group* is a container for many [links](#links). Groups can be used to, well, *group* similar links together. For example, on [the current Linkage page](https://msrose-linkage.herokuapp.com), there is a group called *Waterloo*, where I keep all of the links related to my studies at the University of Waterloo.

Configuration options for groups include:

| Option    | Description                                                                | Required? |
| ---       | ---                                                                        | ---       |
| title     | The main heading for the group                                             | Yes       |
| color     | The [color](#colors) that is associated with the group                     | Yes       |
| collapsed | If `true`, the group's links will not be shown on the dashboard by default | Yes       |

### Links

A *link* is essentially a bookmark. A link belongs to a [group](#groups), and has three different [colors](#colors) associated with it. Configuration options include:

| Option           | Description                                                                              | Required? |
| ---              | ---                                                                                      | ---       |
| title            | The text that will be displayed when the link is shown on the page                       | Yes       |
| target           | If `blank`, the link opens in a new window. If `self`, the link opens in the same window | Yes       |
| href             | The URL that the link open. Validation is done with `URI.regexp`                         | Yes       |
| color            | The color that the title of the link will take when the link is displayed                | Yes       |
| border color     | The color of the border surrounding the link title                                       | Yes       |
| background color | The color of the background, on which the link title is displayed                        | Yes       |

### Colors

Linkage requires every [link](#links) and [group](#groups) to be associated with a *color*. Created colors become part of the Linkage palette, and the option to use a color for a link or group is provided upon creation. Colors have two configuration options:

| Option    | Description                                           | Required? |
| ---       | ---                                                   | ---       |
| alias     | A humanized name for the color                        | No        |
| hex value | A hexadecimal color code, such as `#fff` or `#123abc` | Yes       |

### Modes

#### Normal Mode

*Normal mode* simply displays the user's dashboard, with all their groups and links. Edit mode can be entered by clicking on the pencil in the upper right corner of the screen.

#### Edit Mode

*Edit mode* allows users to create and edit colors, groups, and links. The main difference from normal mode is the menu bar at the top. The dashboard provides links to the groups via the group title in this mode.

## TODO List

Linkage is still in quite a nascent state. Listed below are some important features that would greatly increase functionality of the application ([issues](https://github.com/msrose/linkage/issues?state=open) are already open for most of them):

- [ ] Allow users to create accounts so that everyone can personalize their own Linkage
- [ ] Detailed documentation about how to use the application
- [ ] Allow users to decide which order the links take inside a group and groups take on the dashboard

## Contributing

1. Fork the repository
2. Clone it and create a new feature branch: `git checkout -b feature/my-awesome-feature`
3. Push your branch: `git push origin feature/my-awesome-feature`
4. Submit a [pull request](https://github.com/msrose/linkage/pulls)

## Version

The current stable release of Linkage is [1.1.1](https://github.com/msrose/linkage/releases/tag/v1.1.1).
