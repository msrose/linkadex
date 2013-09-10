#Linkadex

You can sign up for a Linkadex account at http://linkadex.herokuapp.com.
Detailed documentation can be found [here](https://linkadex.herokuapp.com/about).

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

> What is Linkadex?

Linkadex is a dynamic bookmark management application.

> What the heck is a dynamic bookmark management application?

Linkadex provides each user with a means of managing website bookmarks from within a web application. This way, you can have a personlized page of attractive links to the pages you use most frequently.

> But doesn't my web browser do that already?

In a sense, yes. But something like Linkadex is truly cross platform. It can be accessed from any browser on any modern device, without having to install any programs or import bookmarks from somewhere else. Linkadex allows your bookmarks to shine on their own dedicated page.

> How did you come up with the idea for Linkadex?

I implemented something similar on my first [personal page](http://www.michaelrose.heliohost.org). However, since the links were hard coded into the page, they all became outdated, because I would have to edit the source code every time I wanted to change, add, or remove a something. Linkadex solves this problem by letting users do all the dirty work quickly and easily just by logging in.

> How did you come up with the name?

Link + index = Linkadex. Which is essentially what Linkadex is, an index page for your links. A friend pointed out to me that Linkadex sounds like [Rolodex](http://en.wikipedia.org/wiki/Rolodex), which is another good analogy.

> How do I get started with Linkadex?

Visit the [home page](https://linkadex.herokuapp.com). Here you can sign up for an account, and after receiving your verification email you're all set. Please see the [about page](https://linkadex.herokuapp.com/about) for more information on how to use the application.

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
| private    | If `true`, the group will not be shown on the user's public profile (only the user will be able to see the group).                                    | No        |

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

The current stable release of Linkadex is [1.9.0](https://github.com/msrose/linkadex/releases/tag/v1.9.0).
