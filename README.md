<h1>namer_app</h1> 

<p>A simple Flutter project for learning, which renders random name of two words, allowing users to add to Favorite </p>
<p>Tech stack: Dart, Flutter</p>

<h2>Content</h2>
<table>
  <tr>
    <th width = 30%>Pages</th>
    <th width = 70%>Features</th>
  </tr>
  <tr>
    <td>Home</td>
    <td>
      - Random name of two word
      <br>- Favorite button (add to Favorite)
      <br>- Next button (render new random name)
      <br>(rail relative navigation)
    </td>
  </tr>
  <tr>
    <td>Favorite</td>
    <td>
      - List of favorite names added
      <br>(rail relative navigation)
    </td>
  </tr>
</table>

<h2>How to run on Windows</h2>

<h3>Install Flutter SDK</h3>

<p>Download the Flutter SDK from the official Flutter website (https://flutter.dev/docs/get-started/install).</p>
<p>Extract the downloaded zip file to a location on your computer (e.g., C:\flutter).</p>
<h4>Set up environment variables</h4>
<p>Add the Flutter bin directory to your system's PATH variable. For example, if you extracted Flutter to C:\flutter, you would add C:\flutter\bin to your PATH.</p>
<h4>Install required dependencies</h4>
<p>Ensure that you have the necessary dependencies installed, such as Git and the Android SDK. Follow the instructions on the Flutter website to install these dependencies.</p>
<h4>Configure Flutter</h4>
<p>Run <code>flutter doctor</code> in the command prompt to check if there are any issues with your Flutter installation. Follow any instructions provided to resolve them.</p>

<h3>Running from CLI</h3>

<h4>Open Command Prompt</h4>
<p>Navigate to the root directory of the project using the command prompt</p>

````c
$ cd ../project_root
````

<h4>Run Flutter commands</h4>
<p>Run <code>flutter clean</code> to delete the build directory and start fresh.</p>
<p>Run <code>flutter pub get</code> to fetch the dependencies specified in the pubspec.yaml file.</p>
<p>Run <code>flutter run</code> to build and run the Flutter app on the connected device or emulator.</p></p>

````c
$ flutter clean
$ flutter pub get
$ flutter run
````

<p>Depend on devices you would like to make run on, select device number to continue:</p>

````c
Connected devices:
Windows (desktop) • windows • windows-x64    • Microsoft Windows [Version 10.0.22631.3155]
Chrome (web)      • chrome  • web-javascript • Google Chrome 122.0.6261.112
Edge (web)        • edge    • web-javascript • Microsoft Edge 122.0.2365.66
[1]: Windows (windows)
[2]: Chrome (chrome)
[3]: Edge (edge)
Please choose one (or "q" to quit):
````





