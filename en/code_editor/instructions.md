There are a lot of different editors and it largely boils down to personal preference. Most Python programmers use complex but extremely powerful IDEs (Integrated Development Environments), such as PyCharm. As a beginner, however, that's probably less suitable; our recommendation is equally powerful, but a lot simpler.

Feel free to ask your coach what their preferences are too!

## Visual Studio Code

Visual Studio Code is a source code editor developed by Microsoft for Windows, Linux and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring.

**[Download Visual Studio Code](https://code.visualstudio.com/)**

# Installing Visual Studio Code

<!--sec data-title="VSCode Install for Windows" data-id="ide_windows"
data-collapse=true ces-->

1. **Download Visual Studio Code:**
   - Go to the official Visual Studio Code website referenced above.
   - Click on the download link for Windows.

2. **Install Visual Studio Code:**
   - Run the downloaded `.exe` file.
   - Follow the installation prompts:
     - Accept the license agreement.
     - Choose the installation location.
     - Select additional tasks (e.g., creating a desktop icon, adding to PATH).
   - Click "Install" and then "Finish" once the installation is complete.

3. **Open VSCode from your start menu.**

<!--endsec-->

<!--sec data-title="VSCode Install for Mac" data-id="ide_mac"
data-collapse=true ces-->

1. **Download Visual Studio Code:**
   - Go to the official Visual Studio Code website referenced above.
   - Click on the download link for macOS.

2. **Install Visual Studio Code:**
   - Open the downloaded `.dmg` file.
   - Drag the Visual Studio Code icon to the Applications folder.
   - Open Visual Studio Code from the Applications folder.

3. **Open VSCode from your applications folder.**

<!--endsec-->

<!--sec data-title="VSCode Install for Linux" data-id="ide_linx"
data-collapse=true ces-->

1. **Download Visual Studio Code:**
   - Go to the official Visual Studio Code website referenced above.
   - Click on the download link for Linux and follow the instructions for your specific distribution.

2. **Install Visual Studio Code:**
   - Follow the instructions on the Linux installation page for your specific distribution.

3. **Open VSCode from your applications menu.**

<!--endsec-->

# Setting Up Visual Studio Code

## Customize Your Setup
**Configure Settings:**
    - Go to `File > Preferences > Settings` to customize your editor settings, such as font size, tab size, and more.

## Enable Autosave
1. **Open Settings:**
   - Go to `File > Preferences > Settings` (or use the shortcut `Ctrl + ,` on Windows/Linux or `Cmd + ,` on macOS).
2. **Search for Autosave:**
   - In the search bar at the top, type "auto save".
3. **Enable Autosave:**
   - Under the "Files: Auto Save" setting, select one of the following options from the dropdown menu:
     - `off`: Disable autosave.
     - `afterDelay`: Automatically save files after a delay.
     - `onWindowChange`: Automatically save files when the window loses focus.
     - `onFocusChange`: Automatically save files when the editor loses focus.
   - If you choose `afterDelay`, you can set the delay duration (e.g., 1000 ms for 1 second).

## Why are we installing a code editor?

You might be wondering why we are installing this special code editor software, rather than using something like Word or Notepad.

The first reason is that code needs to be **plain text**, and the problem with programs like Word and Textedit is that they don't actually produce plain text, they produce rich text (with fonts and formatting), using custom formats like [RTF (Rich Text Format)](https://en.wikipedia.org/wiki/Rich_Text_Format).

The second reason is that code editors are specialized for editing code, so they can provide helpful features like highlighting code with color according to its meaning, or automatically closing quotes for you.

We'll see all this in action later. Soon, you'll come to think of your trusty old code editor as one of your favorite tools. :)

