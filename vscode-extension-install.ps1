# Verificar se o Chocolatey está instalado
if ($null -eq (Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    # Se não estiver instalado, instale o Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Verificar se o Lua está instalado
if (-eq $null(choco list --local-only lua | Select-String 'lua')) {
    # Se não estiver instalado, instale o Lua
    choco install lua -y
}

$extensions = @(
    "13xforever.language-x86-64-assembly",
    "aaron-bond.better-comments",
    "alefragnani.separators",
    "arcensoth.language-mcfunction",
    "bmewburn.vscode-intelephense-client",
    "christian-kohler.npm-intellisense",
    "christian-kohler.path-intellisense",
    "cschlosser.doxdocgen",
    "dan-c-underwood.arm",
    "dbaeumer.vscode-eslint",
    "dtsvet.vscode-wasm",
    "eamodio.gitlens",
    "ecmel.vscode-html-css",
    "EnkelDigital.relative-goto",
    "geequlim.godot-tools",
    "GitHub.github-vscode-theme",
    "GitHub.remotehub",
    "humao.rest-client",
    "jasonnutter.search-node-modules",
    "jeff-hykin.better-cpp-syntax",
    "kleber-swf.unity-code-snippets",
    "leizongmin.node-module-intellisense",
    "mark-wiemer.vscode-autohotkey-plus-plus",
    "medo64.render-crlf",
    "ms-azuretools.vscode-docker",
    "ms-dotnettools.csharp",
    "ms-python.isort",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "ms-toolsai.jupyter",
    "ms-toolsai.jupyter-keymap",
    "ms-toolsai.jupyter-renderers",
    "ms-toolsai.vscode-jupyter-cell-tags",
    "ms-toolsai.vscode-jupyter-slideshow",
    "ms-vscode-remote.remote-wsl",
    "ms-vscode.azure-repos",
    "ms-vscode.cmake-tools",
    "ms-vscode.cpptools",
    "ms-vscode.cpptools-extension-pack",
    "ms-vscode.cpptools-themes",
    "ms-vscode.hexeditor",
    "ms-vscode.remote-repositories",
    "ms-vscode.vscode-serial-monitor",
    "ms-vscode.vscode-typescript-next",
    "ms-vsliveshare.vsliveshare",
    "NoesisTechnologies.noesisgui-tools",
    "quicktype.quicktype",
    "redhat.java",
    "rolandostar.tabletopsimulator-lua",
    "rust-lang.rust-analyzer",
    "shardulm94.trailing-spaces",
    "slevesque.shader",
    "SPGoding.datapack-language-server",
    "sumneko.lua",
    "SuperAnt.mc-dp-icons",
    "tamasfe.even-better-toml",
    "tintinweb.vscode-decompiler",
    "vadimcn.vscode-lldb",
    "VisualStudioExptTeam.intellicode-api-usage-examples",
    "VisualStudioExptTeam.vscodeintellicode",
    "vsciot-vscode.vscode-arduino",
    "vscjava.vscode-java-debug",
    "vscjava.vscode-java-dependency",
    "vscjava.vscode-java-pack",
    "vscjava.vscode-java-test",
    "vscjava.vscode-maven",
    "waderyan.nodejs-extension-pack",
    "xabikos.JavaScriptSnippets",
    "Zerasul.genesis-code"
)

$installedExtensions = code --list-extensions

foreach ($extension in $extensions) {
    if ($installedExtensions -notcontains $extension) {
        code --install-extension $extension
    }
}
