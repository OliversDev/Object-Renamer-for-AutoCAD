# Renamer Autodesk Marketplace compliance

## Package and compatibility

- Product name, namespace, product/upgrade codes, assembly, bundle, command, help, CUIX, icon, and documentation use Renamer identifiers.
- `CompanyDetails` includes the documented `Name`, `URL`, and `Email` attributes. The same support email appears in the privacy policy, bundled help, listing copy, and Marketplace form.
- AutoCAD 2026 uses .NET 8 and exact series `R25.1`; AutoCAD 2027 uses .NET 10 and exact series `R26.0`.
- `OW:Renamer` is demand-loaded and mapped to local contextual F1 help.

## User experience

- The partial CUIX merges only into `ID_ADDINSTAB` using `AddToWorkspace` and `MergeTabOnly`.
- No custom ribbon tab is created and no command name is injected into the tooltip.
- Bundled Help, Privacy, License, and third-party notices work offline.
- Six object tabs share one consistent selection, filtering, rename, validation, script, and execution workflow.

## Privacy and dependencies

- Processing is local; no telemetry, analytics, cloud processing, advertising, tracking, or application logs are used.
- No third-party executable DLL is included. Runtime dependencies are Autodesk's managed AutoCAD API, Microsoft .NET, and Windows system libraries used for UI theming.
- The licensed Dazzle GitHub and LinkedIn footer images are embedded application resources. They are identified in `THIRD-PARTY-NOTICES.txt` and expressly excluded from the repository's MIT License grant.
- The application reads the Windows app-theme registry value but does not create, change, or delete registry values.

## Build safeguards

- `build-app-store.ps1` validates both AutoCAD API installations, publisher contact details, privacy/support content, dependency and asset policy, ribbon merge and F1 configuration, manifest ranges, command registration, required files, and final archive contents.
- `Apply-Build-Install-Renamer-2026-2027.bat` creates no source-file backups, builds both targets, removes only known Renamer test bundles, installs the current user-level bundle, verifies hashes, and preserves all output in a visible CMD window.

## Publisher actions before submission

- Confirm the public privacy-policy and support URLs resolve without authentication.
- Enter `owackenreuther@gmail.com` in the Marketplace form exactly as it appears in `PackageContents.xml`.
- Test both supported AutoCAD versions and contextual F1 help.
- Upload the 120 Ã— 120 icon and at least three captioned screenshots: the main dark-theme UI, the detailed Layers grid, and another object category/script workflow. Add a light-theme screenshot if space permits.
- Claim only AutoCAD versions and industry verticals that were actually tested.

## Future versions

- Keep `UpgradeCode` stable across releases.
- Generate a new `ProductCode` whenever `AppVersion` changes.
- Update `FriendlyVersion`, listing copy, changelog, screenshots, and compatibility ranges together.

