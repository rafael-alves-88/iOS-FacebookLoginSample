# iOS-FacebookLoginSample

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
