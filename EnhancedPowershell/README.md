## Enhancing Powershell with Oh My Posh

### Defining Console Theme

In your terminal's parameters, select the "Open JSON file" option and paste the following JSON block at the end of the themes. Then, set this Dracula theme as the default theme for your console.

```json
{
  "background": "#272935",
  "black": "#272935",
  "blue": "#BD93F9",
  "brightBlack": "#555555",
  "brightBlue": "#BD93F9",
  "brightCyan": "#8BE9FD",
  "brightGreen": "#50FA7B",
  "brightPurple": "#FF79C6",
  "brightRed": "#FF5555",
  "brightWhite": "#FFFFFF",
  "brightYellow": "#F1FA8C",
  "cursorColor": "#FFFFFF",
  "cyan": "#6272A4",
  "foreground": "#F8F8F2",
  "green": "#50FA7B",
  "name": "Dracula",
  "purple": "#6272A4",
  "red": "#FF5555",
  "selectionBackground": "#FFFFFF",
  "white": "#F8F8F2",
  "yellow": "#FFB86C"
}
```

Also, enable acrylic materials for your terminal.

### Defining Font

Download a nerd font from this [repo](https://github.com/ryanoasis/nerd-fonts). I recommend using a font like Fira Code. Font releases are available [here](https://github.com/ryanoasis/nerd-fonts/releases).

After downloading a font pack, unzip the pack, select all fonts, and install them using `Right Click > Install`.

Then, in your console's parameters, you can set the font you just downloaded as the default font.

### Installing Oh My Posh

Install it using `winget`:

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

Restart your terminal, and then run:

```powershell
$env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"
```

Updates:

```powershell
winget upgrade JanDeDobbeleer.OhMyPosh -s winget
```

Create a profile for your shell:

```powershell
New-Item -Path $PROFILE -Type File -Force
```

To open your shell profile:

```powershell
notepad $PROFILE
```

Choose your favorite Oh My Posh theme with the command:

```powershell
Get-PoshThemes
```

And then, set it as the default for your shell in the shell profile:

```powershell
#notepad $PROFILE
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\THEME_NAME.omp.json" | Invoke-Expression
```

### Defining Your Functions

If you want to define your own functions, you can create them in the `$PROFILE` file as follows:

```powershell
function github{
    Set-Location -Path 'C:PATH\TO\GitHub'
}
```
