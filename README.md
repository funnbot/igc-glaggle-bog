Download Godot 4.7.2 (non .net version)

# Practices
## When to use signals
1. When we need another node to react to a specific, one-time event. 
	For example, a took_damage signal that gets emitted when a character loses health.
2. When we need a UI element to constantly update based on a game entity’s value changes. 
	Most of the time, we don’t want the UI to store a reference to nodes in the game world and directly access their properties.

# Structure?
## micro/
everything related to the microgames
### micro/base/
The timer, basic logic, and possibly a background UI.
This will load microgames.

### micro/game/
Need a standard interface.
in:
- on start
- on pause?
- on timer run out
out:
- success
- fail

## ui/
all other UI elements, menus, dialogue
## common/
utilities, autoloads, shared "libraries"
## stage/
levels, you should be able to press play from any scene here and it works
- main menu
- map screen
- selected character

### stage/character/
assets, dialogue, and main scenes for that character.

## asset/
SubFolder for each artist
General assets.
Working files, export as PSD
Do not edit someone elses file, duplicate and edit in your own folder.

# Addons
- Dialogue Manager
	- Its gdscript, and pretty simply format, should be easy for anyone that has used twine.
	- https://github.com/nathanhoad/godot_dialogue_manager/blob/main/docs/Basic_Dialogue.md
