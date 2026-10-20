# QR Scanner

A Haylen plugin that reads the text of a QR code with the camera of the device. iPhones, iPads and Macs read the code through AVFoundation, and Android devices through the code scanner of Google Play services, which brings its own screen and needs no camera permission of the app. TVs, desktops and browsers have no scanner, so `available()` returns `false` there.

## Platforms

| Platform | Native part | Setup |
| --- | --- | --- |
| iOS, iPadOS, Mac Catalyst | `apple/QrScannerPlugin.swift` | None. The completed `Info.plist` takes the camera usage description from the parameter `cameraUsage`. |
| Android | The library module in `android/` | None. The module depends on `com.google.android.gms:play-services-code-scanner`, and a device without Google Play services fails the scan with the code `unsupported`. |

## Parameters

| Parameter | Type | Default | Meaning |
| --- | --- | --- | --- |
| `cameraUsage` | string | `"Haylen Runner reads the address of an app from a QR code."` | Text of the camera permission prompt on Apple platforms. |

## Lua API

```lua
local scanner = require('qr-scanner')
```

### scanner.available()

Returns whether a native part reads codes on this device.

### scanner.scan()

Shows the camera until it reads a QR code. Returns a platform call, whose `await` gives `{text}`, or `nil` and the error of the call, with the code `cancelled` when the person closes the scanner, `permissionDenied` when the person refuses the camera and `unsupported` on a device that cannot scan.

```lua
local async = require('async')
local scanner = require('qr-scanner')

async.spawn(function()
    if scanner.available() then
        local result, err = scanner.scan():await()
        print(result and result.text or err.message)
    end
end)
```

## Native API

| Method | Params | Answer |
| --- | --- | --- |
| `qr-scanner.scan` | `{}` | `{text}` |
