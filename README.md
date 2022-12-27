# godot-fgd

FGD (Forge Game Data) parser for Godot

# Setup

- Make sure [tbloader](https://github.com/codecat/godot-tbloader) is installed and you have added the `tb-gameconfig` folder (from the tbloader repo) into the trenchbroom games folder.
- Add the game path to your game root in the Trenchbroom settings.
- Run `run.sh` to compile the fgd file
- At the bottom of the Trenchbroom right hand panel there is an option to add "External" fgd files. Add the generated one to your map.
- You can now use the entities in your map.

# Troubleshooting

## Error: "Could not load model. File not Found"

- Make sure the file actually exists
- Make sure you have set the game path in Trenchbroom settings.
