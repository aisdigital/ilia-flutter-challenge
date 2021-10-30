## Bloc folder

The contents of this folder must contain data manipulation logic. How, manipulate a string, stream a date or notify a
change color button.

## Repository folder

The contents of this folder will become responsible for deciding whether the data comes from a local cache, the api or
another location.

## Provider folder

The contents of this folder will contain mainly the connection of our system to the data provider Here you can find
classes to connect to the local database, firebase, sharedPreferences, or the API.

## Model folder

The contents of this folder must contain model to any data on app Like an internal User or a Model for an API response.

## Interface folder

The contents of this folder should contain abstractions for generating contracts between the bloc, repository and
provider. In order to maintain a good coding standard.

## Widget folder

This folder will contain all widgets used in the App, using Atomic Design Pattern.
- ### Atoms

  Atom is a basic widget in the system Like a:
Text or Button Or something like a color or font style.

- ### Molecules

  Molecules are a set of atoms for creating a more elaborate widget. such as a card, a list of data, a column, a row or a
grid.

- ### Organism

  Here Organism are the junction of molecules and data, they are what give life to widgets like a FutureBuilder,
StreamBuilder or other widget with or another widget that receives data from a source and displays it on the screen,
such as inflation of a listview or gridview.

- ### Pages
  Pages is a complete page screen composed with organism, molecules and atoms.

- ### Page controller
  The page controller manipulate the layout behavior.