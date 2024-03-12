# Community Project 1

## Prerequisites
- Godot 4.2.1
- Git & Github account


## How to setup project for personal level
To start developing your own level for the community game you must first fork this repository.
Here is a guide on how to fork a repository: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo

When you have forked the repository, you can now clone your new repository with the following command:

    git clone YOURFORKEDREPOURL

To setup a link to the original project, so you can pull updates into your project, run the following command:

    git remote add core https://github.com/GameDevCorner/Community_Project_1

Now you can always get our updates with the following command:

    git pull core main

When working on your own level, make sure that you only change files in your own folder, found in the "user/YOURUSERNAME" directory in the project (feel free to create your own folder in the user directory). This also means that changing any project settings is no go, as it can mess up other peoples levels. Any ".tscn" file that is found in the root of your user directory (the "user/YOURUSERNAME/" path) is added as a level in the lobby, so make sure that any non-level ".tscn" files are stored in sub-directories.

## How to initialize personal level in godot
Start with creating a inherited scene from the "core/scenes/base_level.tscn" file. This can be done by right clicking the file and pressing the "New Inherited Scene" button. Make sure to put the new scene (and all other files you may want to create) in your own personal user directory in the "user/" path. If you double click on your newly created scene file, it opens in the editor, where you can start building your level! The autotile component in the scene, contains all the functionality for basic platforming mechanics without any coding (variety of platforms, spikes, checkpoints, and a level goal).

## How to get your level into the main project
When you are satisfied with your level, feel free to create a pull request to the main project. Your level will almost guaranteed be added to the main game, as long as no files outside of your user directory have been changed, and no non-level ".tscn" files are stored in the root of your user directory.
