# Object Renamer

## Short description

Batch rename layers, blocks, dimension styles, linetypes, table styles, and text styles.

## Description

Object Renamer provides one consistent workflow for renaming six types of named AutoCAD drawing objects. Choose a category tab, select objects, and apply a prefix, suffix, case-insensitive find-and-replace rule, or an exact name for one selected object. Add commands from multiple categories to one editable script and review everything before execution.

Generated names are checked for invalid characters, empty or over-length values, duplicate results, and collisions with existing objects in the same category. Protected and externally dependent records are not offered. Before running, Object Renamer warns about same-category duplicate destinations and repeated source objects while ignoring comments and unrelated manual lines.

## General usage

Open **Object Renamer** from AutoCAD's standard **Add-ins** ribbon tab or enter `OW:ObjectRenamer`. Select a category tab, choose objects, enter rename options, and select **Add To Script List**. Repeat across other categories, review or edit the script, then copy, save, or select **Rename**. Use **Rename To (single object)** when exactly one object is selected.

Manually entered script lines run as written. Review them before execution.

## Installation

Download and run the Autodesk Design and Make Marketplace installer. Restart AutoCAD, open **Add-ins**, and select **Object Renamer**, or enter `OW:ObjectRenamer`.

## Uninstallation

Close AutoCAD. Open **Windows Settings > Apps > Installed apps**, select **Object Renamer**, and choose **Uninstall**.

## Support

https://github.com/OliversDev/Object-Renamer-for-AutoCAD/issues

Email: owackenreuther@gmail.com

Include the AutoCAD version, Object Renamer version, reproducible steps, and any displayed error. Do not include confidential drawings or object names.

## Compatibility and limitations

Object Renamer supports 64-bit AutoCAD 2026 and AutoCAD 2027. AutoCAD may reject a rename based on drawing state or dependencies. Anonymous blocks, layout blocks, xref-dependent records, layer `0`, `Defpoints`, reserved linetypes, and the protected Standard table and text styles are excluded. Maintain current drawing backups and review scripts before production use.

## Commands

- `OW:ObjectRenamer` â€” opens Object Renamer.

## Privacy

Object Renamer processes drawing data locally and does not collect, transmit, sell, rent, or share personal information, drawing information, object names, usage information, telemetry, or analytics.

https://github.com/OliversDev/Object-Renamer-for-AutoCAD/blob/master/PRIVACY.md

## Artwork

- `Assets/ObjectRenamerIcon-100.png`
- `Assets/ObjectRenamerIcon-120.png`
- `Assets/ObjectRenamerIcon-1024.png`
- `Assets/ObjectRenamerIcon.ico`
- `Assets/ObjectRenamerIcon.svg`
- `Assets/RenamerRibbon.svg`

