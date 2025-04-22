# GodotAssetLib

Some addons that I've made and use for my games

# Development

## Symbolic links

Instead of copying addons manually, symbolic links are used to point to the folder where the addons are checked out. This allows changes to be made directly to the addons while working on games, and those changes are immediately reflected in the checkout. This way, it's only necessary to commit them.
To create a symbolic link:

```
cd path\to\MyGame\addons
mklink /D my_cool_addon path\to\MyCoolAddon
```
