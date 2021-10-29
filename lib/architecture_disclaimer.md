## Widget folder

This folder will contain all widgets used in the App, using Atomic Design Pattern

## Bloc folder

The contents of this folder must contain data manipulation logic. How, manipulate a string, stream a date or notify a
change color button

## Repository folder

The contents of this folder will become responsible for deciding whether the data comes from a local cache, the api or
another location

## Provider folder

The contents of this folder will contain mainly the connection of our system to the data provider Here you can find
classes to connect to the local database, firebase, sharedPreferences, or the api

## Model folder

The contents of this folder must contain model to any data on app Like an internal User or a Model for an API response

## Interface folder

The contents of this folder should contain abstractions for generating contracts between the bloc, repository and
provider. In order to maintain a good coding standard