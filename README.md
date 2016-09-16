# iOS-FacebookLoginSample

## Getting Started

### 1. Configuring Facebook SDK

- Download Facebook SDK from https://developers.facebook.com/docs/ios;
- Create a new folder <i>"Documents/FacebookSDK"</i>;
- Copy <i>"FBSDKCoreKit.framework", "FBSDKLoginKit.framework", "FBSDKShareKit.framework", "Bolts.framework"</i> into this folder;
- In project structure, create a new folder called <i>"Facebook"</i>;
- Drag and Drop the 4 FB frameworks into this new folder in XCode, then UNSELECT option <i>"Copy items if needed"</i> and select <i>"Create folder references"</i>.


### 2. Build.settings

Go to <i>"Build Settings"</i> and search for <i>"Frameworks Search Paths"</i>, then add the path of your <i>"FacebookSDK"</i> folder.


### 3. Configuring info.plist

Add this to the end of info.plist file with the app's information from Developers Facebook Console:

```xml
<key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>fb{app-id}</string>
            </array>
        </dict>
    </array>
    <key>FacebookAppID</key>
    <string>{app-id}</string>
    <key>FacebookDisplayName</key>
    <string>{app-display-name}</string>
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>fbapi</string>
        <string>fb-messenger-api</string>
        <string>fbauth2</string>
        <string>fbshareextension</string>
    </array>
```
