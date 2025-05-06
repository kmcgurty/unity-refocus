# Unity Refocus
After Unity steals focus away from your IDE, this script will refocus your IDE automatically.

### What's the problem?
When using the Unity Editor on Linux, Unity [will automatically focus itself](https://discussions.unity.com/t/anyone-know-of-a-way-to-restrict-the-editor-window-from-stealing-focus-and-raising-on-window-events/901340) after refreshing the assets or recompiling the C# assemblies. This is particularly problematic if you want to use Rider's `Automatically refresh assets in Unity` feature to have assets refresh in the background. When saving a script, Unity it will raise itself above every other window, including your IDE.

There's unfortunately no way to stop it from happening. The best option is to just pull the IDE in front of Unity as fast as possible. That being said, it's a surprisingly difficult issue to fix using Gnome 42 + Wayland. It requires installing two Gnome extensions to expose methods for window manipulation.

# Instructions
1. Install the Gnome extensions: [Activate Window By Title](https://extensions.gnome.org/extension/5021/activate-window-by-title/) and [Window Calls](https://extensions.gnome.org/extension/4724/window-calls/).
2. Download and run the script with `bash refocus.sh`

After saving a file in Rider, Unity will flash momentarily, then Rider will be focused again, putting Unity behind it.

Note: Rider is the default `wm-class` that gets refocused. You can change this to be any window you want by modifying lines 16 and 25.
