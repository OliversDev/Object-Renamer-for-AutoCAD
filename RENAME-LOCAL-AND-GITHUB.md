# Rename the local repository and GitHub repository

The application is **Object Renamer**. The local repository folder is **Object Renamer for AutoCAD**, and GitHub's URL-safe repository name and slug are **Object-Renamer-for-AutoCAD**.

## 1. Replace or update the local copy

1. Close AutoCAD and Visual Studio.
2. Extract this updated repository beside the current repository.
3. Rename the extracted top-level folder to `Object Renamer for AutoCAD`.
4. Open `Object Renamer.sln` and confirm the solution loads `Object Renamer\Object Renamer.csproj`.
5. Run `Apply-Build-Install-Object-Renamer-2026-2027.bat` to build both supported AutoCAD versions, install the local test bundle, and create the Marketplace ZIP.
6. Start AutoCAD, run `APPAUTOLOADER`, and choose **Reload** if required. Confirm that **Object Renamer** appears on the standard **Add-ins** tab.
7. Hover over the **Object Renamer** ribbon command and press **F1**. Confirm that the Object Renamer help page opens.

If you are merging this archive into the existing Git working copy instead of replacing it, preserve the existing `.git` directory and copy the updated files into that working copy. Then remove obsolete tracked paths only after confirming their Object Renamer replacements are present.

## 2. Rename the GitHub repository

1. Open `https://github.com/OliversDev/Renamer-App-for-AutoCAD`.
2. Select **Settings** > **General**.
3. Under **Repository name**, enter `Object-Renamer`, then select **Rename**.
4. In the local repository, update the remote URL:

   ```powershell
   git remote set-url origin https://github.com/OliversDev/Object-Renamer-for-AutoCAD.git
   git remote -v
   ```

5. Review and commit the renamed files:

   ```powershell
   git status
   git add -A
   git commit -m "Rename app and repository to Object Renamer"
   git push origin master
   ```

If the default branch is `main`, use `git push origin main` instead. GitHub normally redirects the old repository URL, but updating the local remote avoids relying on that redirect.

## 3. Marketplace resubmission

Build and submit `AppStore\artifacts\Object-Renamer-1.0.0-Autodesk-Marketplace.zip`. The icon no longer contains text, the application UI uses the same Object Renamer icon instead of the previous logo, and the bundle validates the matching contextual F1 help target before packaging.

The installer remains unsigned. Autodesk stated that code signing is recommended but is not mandatory for publication.
