# Haylen Runner

Haylen Runner plays Haylen apps from the address of their zip file, which suits trying an app on a phone, a tablet or a TV while it is being made. Its home screen shows the Haylen logo, a field to type or paste the address of a zip file, a button that reads the address from a QR code, the addresses opened before, each once and the most recent first, and the versions of the runner, of Haylen and of the system. Opening an address downloads the zip file and plays the app on its own in place of the runner, with `haylen.launch`, and the runner comes back when the app quits, through `haylen.quit()`, the Close button of its error screen or the back button at its root on Android and Apple TV.

The runner works in every orientation, on phones, tablets, foldables and TVs. TVs, desktops and browsers have no QR scanner, so the button shows only where the device reads codes.

## Layout

| Path | What it holds |
| --- | --- |
| `app.json` | The identity `com.haylen.runner`, the window, the design size and the splash of the runner. |
| `source/` | The home screen in `main.lua`, the addresses opened before in `history.lua` and the download in `download.lua`. |
| `content/images/` | The logo and the icons of the home screen. |
| `plugins/qr-scanner/` | The plugin that reads QR codes with the camera on iPhones, iPads, Macs and Android devices. |
| `platform/apple/` | The Xcode project of iOS, iPadOS, Mac Catalyst, tvOS and macOS, with its icons. |
| `platform/android/` | The Gradle project of Android phones, tablets and TVs, with its icons. |

## Running

The runner builds with the command `haylen` of a checkout of the [Haylen repository](https://github.com/haylen-org/haylen):

```sh
haylen run .
haylen run . --platform ios-simulator
haylen run . --platform android
```

A package to try is the folder of an app zipped with its `app.json`, `source/` and `content/` at the root of the zip, served at an address the device reaches, such as `http://192.168.0.10:8000/app.zip` from `python3 -m http.server` in the folder of the zip.
