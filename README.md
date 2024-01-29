=======================================================
## Overview 
Hello! I’m Lucas Fernandes. This project is designed to address the technical challenge presented by Ília Digital. The application is designed to interact with The Movie Database (TMDB) API.

I’ve used various approaches to address common issues, such as using Blocs, Cubits, and ValueNotifiers for state management.
You may notice that there isn’t a consistent pattern in the development of this app, and you’d be correct in that observation.

In a production project, it’s best practice to maintain a consistent pattern throughout to facilitate understanding and maintenance of the codebase.

Here I opted to show diferent aproaches that I can use.

=======================================================
## Getting Started 

Firstly, you´ll need to have a Flutter environment set up and running. You can find the instructions here [https://docs.flutter.dev/get-started/install].

Now, inside the project folder, generate the freezed classes with the following command:

dart run build_runner build --delete-conflicting-outputs

This project uses environment variables to store the credentials for API access.

To set up the credentials, you’ll need to create an account with TMDB to obtain them.

Once you have the credentials, copy them into a .env file into the project directory, following this pattern:

API_BASE_URL=https://api.themoviedb.org
IMAGE_API=https://image.tmdb.org
API_KEY=#######YOUR API KEY HERE#######
BEARER_TOKEN=#######YOUR BEARER TOKEN HERE#######

FOR MY RECRUITERS ^^ Altought it´s not correct, i´ll share mine, since it can cause no harm (and the api is puclic already).

Now, when running, building, or profiling, add this Dart flag: --dart-define-from-file={{YourEnvFileName}}.env

Here are some examples:

flutter test --dart-define-from-file=dev.env
flutter run --dart-define-from-file=dev.env
flutter build apk --release --dart-define-from-file=dev.env


=======================================================
## The Challenge 
Using the API from [TheMovieDB](https://developers.themoviedb.org/3/getting-started/introduction), You must create an app that shows the featured movies in the Theaters, in a list.

When the user touches in a movie, the app must show in a detail screen detailed information about it. You can choose which information should be shown.

=======================================================
## Extra features 

- In the main list of the movies, would be nice if the app could load more movies, as the scroll reaches the bottom section of the current page.
- In the detail screen, would be nice to have an option to play the movie trailer.
- In the main screen, would be nice to have the possibility to search by the movie title.

In the end, a pull request must be created in the Github repo. As soon as you finish, please let us know.

====================================================================================================================================
