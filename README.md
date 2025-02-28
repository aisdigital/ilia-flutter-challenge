# Pixel Cinema

## Overview

Welcome to the Pixel Cinema! This app provides a comprehensive experience for exploring featured movies. It uses TheMovieDB API to fetch and display movie information.


The development of the app was based on Clean Architecture, ensuring a solid and scalable structure. However, I made some simplifications to make development more agile and dynamic. The presentation layer acts as a mini design system, aligning with the VIP design pattern to promote a clear separation between business logic and user interface. The app aims to follow SOLID principles.

## Features

- **Movie List**: Displays a list of featured movies in theaters.
- **Movie Details**: When a movie is selected, detailed information about the movie is shown on a separate screen.
- **Load More**: As the user scrolls to the bottom of the movie list, more movies are automatically loaded.
- **Search**: Allows users to search for movies by title.
- **Trailer**: On the detail screen, an option to play the movie trailer is available.

## Requirements

- [Flutter - v3.24.1](https://docs.flutter.dev/get-started/install)
- TheMovieDB API key (register at [TheMovieDB](https://www.themoviedb.org/) to get your API key)


## Steps to tun
- Clone the repository and enter the folder with your terminal;
- If you are using [VSCode](https://code.visualstudio.com/), create a `.vscode` in the root of the application folder;
- Inside the `.vscode` folder, create a `launch.json` file and fill with this information:
  - `{
   "configurations": [
        {
            "name": "Pixel Cinema",
            "request": "launch",
            "type": "dart",
            "toolArgs": [
                "--dart-define",
                "API_KEY={YOUR-API-KEY}"
            ],
        },
    ]
}`
  - Change `{YOUR-API-KEY}` for the key you got in the [TMDB keys section](https://www.themoviedb.org/settings/api);
- Run `Flutter pub get` to install the dependencies;
- Press F5 if using VSCode.
  - NOTICE: If you are not using VSCode, do not forget to use the `--dart-define` variable passing you key to the `API_KEY` variable, otherwise the app will not work.

### Enjoy :D

## License

Software licensed under the [MIT license](https://opensource.org/licenses/MIT).
