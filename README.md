# JAGLT
Just a good looking (OJS) theme

[Demo instance](https://static.99.120.47.78.clients.your-server.de/index.php/showcase/)

## Prerequisites
- OJS 3.2.0
- Node.js

## Introduction / Remarks
Note that this theme is a work in progress and will grow in the future. As of now there are a lot of pages which are not styled yet.

## Installation
Either download the theme archived and unpack it into your `/your/path/to/ojs/plugins/themes/` folder, clone inside `/your/path/to/ojs/plugins/themes` or if you work with a cloned OJS add it as a submodule inside `/your/path/to/ojs/plugins/themes/`.

Install all dependencies
```
npm install
```

Register the plugin

```
php /path/to/your/ojs/installation/lib/pkp/tools/installPluginVersion.php plugins/generic/pdfMerge/version.xml
```

Enable the plugin inside your OJS by going to

```
Management > Website Settings > Plugins > Theme Plugins and enable the Checkbox beside "JAGLT"
```

## Updating stylesheets
If you want to change the stylesheets used by this template you can find all styles inside the `dev_scss` folder.
After changing a file you have to either:
```
node_modules/gulp/bin/gulp.js watch
```

before updating the file or just call

```
node_modules/gulp/bin/gulp.js
```
after updating the file.

The color scheme can be found inside `dev_scss/variables.scss`

## Contributing

If you want to contribute to this plugin please open a pull request.

## Authors

* **Torben Richter** - *Initial work*

See also the list of [contributors](https://github.com/KRONWALLED1134/JAGLT/contributors) who participated in this project.

## License
This project is licensed under the GNU General Public License v2 - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* All of the guys working on OJS!
