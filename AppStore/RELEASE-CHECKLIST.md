# Autodesk Marketplace release checklist

## Build and package

- Close AutoCAD 2026 and 2027.
- Install the .NET 8 and .NET 10 SDKs and both AutoCAD managed API sets.
- Run `Apply-Build-Install-Object-Renamer-2026-2027.bat`.
- Confirm `AppStore\artifacts\Object-Renamer-1.0.0-Autodesk-Marketplace.zip` opens correctly.
- Confirm the ZIP contains one top-level `ObjectRenamer.bundle` folder and no PDB, source, or backup files.

## Functional testing

- Confirm the Object Renamer panel appears only on AutoCAD's standard Add-ins tab.
- Hover over the ribbon button and press F1; confirm Object Renamer help opens.
- Test the ribbon button and `OW:ObjectRenamer` in AutoCAD 2026 and 2027.
- Test all tabs: Layers, Blocks, Dimension Styles, Linetypes, Table Styles, and Text Styles.
- Confirm the category selector has no light native-tab frame in either Windows theme and the active category has the accent outline.
- Drag each visible grid-column divider, narrow the window, and confirm the horizontal scrollbar exposes the complete grid.
- With both grid scrollbars visible, confirm their lower-right intersection matches the application theme.
- Sort Layers by Frozen and Locked in both ascending and descending order.
- Test exact and `*` filters, independent tab selections, prefix, suffix, find/replace, exact single-object naming, mixed-category staging, manual edits, comments, copy, save, clear, execution, and Undo.
- Verify same-category collision warnings do not incorrectly flag identical names in different categories.
- Verify layer `0`, Defpoints, reserved linetypes, the Standard table style, the Standard text style, layout/anonymous blocks, and dependent xref records are excluded.
- Test Windows light/dark themes and 100%, 125%, and 150% scaling.
- Verify Help, License, Privacy, GitHub, and LinkedIn links.

## Documentation and listing

- Confirm `PackageContents.xml` contains `CompanyDetails Name`, uppercase `URL`, and `Email="owackenreuther@gmail.com"`.
- Confirm the privacy policy, bundled privacy page, bundled help, store listing, GitHub support page, and support email all resolve and agree.
- Confirm the privacy policy states no collection, transmission, third-party sharing, telemetry, advertising, or application logging; it also explains optional user-selected script saving and support-data deletion requests.
- Confirm the license covers named drawing objects and limits the MIT grant to publisher-authored software and assets.
- Confirm the GitHub and LinkedIn footer images display correctly and `THIRD-PARTY-NOTICES.txt` identifies their Dazzle license and exclusion from the MIT License.

## Submission

- Enter `owackenreuther@gmail.com` in the Marketplace form.
- Upload the 120 × 120 icon.
- Upload at least three captioned screenshots: main dark-theme UI, detailed Layers grid, and another category with the combined script. Add a light-theme screenshot if space permits.
- Claim only tested AutoCAD versions and industry verticals.
- Submit `Object-Renamer-1.0.0-Autodesk-Marketplace.zip`.
- For future releases, keep the UpgradeCode stable and generate a new ProductCode when AppVersion changes.

