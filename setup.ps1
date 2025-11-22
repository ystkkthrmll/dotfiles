# - Purpose: for Windows
# - Targets:
#   - Typst
#   - Visual Studio Code
# - Usage:
#   1.  Run PowerShell as an administrator
#   2.  `> .\xxx.ps1`

# #region Typst
$dst_base = "$env:APPDATA\typst\packages\local"
# mkdir $dst
ls $dst

foreach ($package in $packages) {
  $dst = "$dst_base\$package\0.0.0"
  "Copy $package to $dst"
  # mkdir $dst
  # cp $src $dst
}
# #endregion Typst

# #region Visual Studio Code
$dst = "$env:APPDATA\Code\User"
$src = "."
$target_files = @(
    "keybindings.json"
    "settings.json"
)

foreach ($file in $target_files) {
    "Copy $src/$file to $dst"
    # cp "$src/$file" $dst
}

$src = "."
$target_files = @(
    "all.code-snippets"
    "python.json"
    "quarto.json"
)
foreach ($file in $target_files) {
    "Copy $src/$file to $dst\snippets"
    # cp "$src/$file" $dst\snippets
}
# #endregion Visual Studio Code
