# Repository Cleanup Audit

## Removed

- Duplicate top-level footer images, the unused legacy ICO/config files, stale designer metadata, and legacy Layer Renamer artwork were removed during cleanup and rebranding.

## Intentionally retained

- `Renamer App for AutoCAD/Resources/Logo_BW-NOBG.png` is publisher-owned footer artwork referenced by `Properties/Resources.resx`.
- `Renamer App for AutoCAD/Resources/LI-In-Bug.png` and `github-mark-white.png` are intentionally retained, referenced by `Properties/Resources.resx`, and used by the footer. Their license is documented in `THIRD-PARTY-NOTICES.txt`; they are not covered by the MIT License.
- The project and Marketplace copies of `RenamerIcon.ico` are identical but required in separate source and submission locations.
- Root `LICENSE.html` and bundled `Contents/Help/license.html` are identical by design; the build copies the root source into the staged bundle.
- `LICENSE.txt` is retained as the conventional plain-text repository license; the application and Marketplace bundle open the HTML version.
- The partial CUI files under `AppStore/Ribbon/Renamer` are all required by `build-app-store.ps1` when constructing the ribbon CUIX.
- `UseWPF` is enabled for both targets because the AutoCAD 2026 and 2027 managed assemblies depend on their matching Windows Desktop `WindowsBase` reference sets. The application UI remains WinForms.

No third-party executable DLLs are distributed with Renamer.
