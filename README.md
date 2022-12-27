# godot-fgd

FGD (Forge Game Data) parser for Godot

# Setup

- Make sure [tbloader](https://github.com/codecat/godot-tbloader) is installed and you have added the `tb-gameconfig` folder (from the tbloader repo) into the trenchbroom games folder.
- Add the game path to your game root in the Trenchbroom settings.
- Run `run.sh` to compile the fgd file
- At the bottom of the Trenchbroom right hand panel there is an option to add "External" fgd files. Add the generated one to your map.
- You can now use the entities in your map.

# Usage

The script will process all .tscn and .gd files in the entities folder. It will gather the exported variables and generate a fgd file that can be used in Trenchbroom.

## Special variables

When exporting these variables, they will be used to configure the entity for use with Trenchbroom.

- `fgd_size` - The scale factor for the entity in trenchbroom. i.e `4`
- `fgd_color` - The color of the entity in trenchbroom. i.e `0 255 0` (yellow)
- `fgd_model` - The model settings for the entity in trenchbroom. See an [example here](https://github.com/krazyjakee/godot-fgd/blob/main/entities/models/sphere_script.gd#L7).
- `fgd_block` - An array of variables NOT to export. i.e `["my_var", "bar"]`

## Variable types

Different variable types will have different controls in Trenchbroom.

- bool - 1 or 0 in an input box
- string - text input
- int - number input
- float - number input
- Color - color picker
- string array - drop down list (choices)
- dictionary - checkboxes (flags)

# Troubleshooting

## Error: "Could not load model. File not Found"

- Make sure the model actually exists
- Make sure you have set the game path in Trenchbroom settings.
