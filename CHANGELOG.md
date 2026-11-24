# Changelog

## 1.0.0 â€” November 6, 2026

- Introduced Object Renamer for layers, blocks, dimension styles, linetypes, table styles, and text styles.
- Added category tabs with independent filters and selections.
- Added prefix, suffix, case-insensitive find/replace, and exact single-object rename workflows.
- Added an editable mixed-category AutoCAD script with copy, save, clear, and run actions.
- Added category-aware validation and pre-run conflict warnings.
- Excluded protected, anonymous, layout, externally dependent, and reserved records.
- Added AutoCAD 2026/.NET 8 and AutoCAD 2027/.NET 10 targets.
- Added built-in Add-ins ribbon integration and contextual F1 help.
- Renamed the application to Object Renamer; the local repository folder is Object Renamer for AutoCAD and the GitHub slug is Object-Renamer-for-AutoCAD.
- Replaced the lettered icon with a text-free, enlarged bidirectional-arrow icon and used it consistently in the form, ribbon, bundle, and Marketplace assets.
- Corrected the contextual F1 command, tooltip help source, packaged help file, and HTML anchor so they resolve to one matching help target.
- Added a new generic Object Renamer icon family, Marketplace package, documentation, privacy policy, and license.
- Restored the detailed Layers grid columns for colour, linetype, frozen state, and locked state.
- Replaced the native category tabs with modern flat, theme-aware category buttons and removed the native white tab frame in dark mode.
- Enabled manual grid-column resizing and horizontal scrolling for wide column layouts.
- Joined the category controls into a larger tab-style strip and increased spacing below the wildcard hint.
- Themed the grid scrollbar intersection and enabled sorting on the Frozen and Locked columns.
- Reapplied the themed scrollbar corner after native grid layout, scrolling, resizing, and data binding so WinForms cannot repaint it white.
- Excluded the protected Standard table style from the Table Styles tab.
- Enlarged the ribbon artwork to match the visual scale of Batch Scripter.
- Added the publisher support email to the package manifest, privacy policy, help, and Marketplace listing.
- Retained the licensed LinkedIn and GitHub footer images and documented their exclusion from the MIT License.
- Added package validation for publisher contact details, privacy/support content, and licensed footer assets.
- Corrected Text Styles script generation to use AutoCAD's valid `Style` keyword.
- Excluded the protected Standard text style from the Text Styles tab.
- Corrected three UTF-8 documentation characters damaged by an earlier update.
