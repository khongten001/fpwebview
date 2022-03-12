# fpwebview

*fpwebview* is Free Pascal binding for [webview](https://github.com/webview/webview),
a tiny cross-platform library for building modern cross-platform GUIs using web technology.
fpwebview supports two-way Javascript-Pascal bindings: calling Pascal from Javascript,
and calling Javascript from Pascal.

## Demos

- [simple web browser opening to a specific web site](/demo/browser_cli)
- [invoking Javascript from Pascal](/demo/js_eval)
- [bidirectional Javascript-Pascal calling](/demo/js_bidir)
- [embedded web server serving](/demo/webserv)

![fpwebview GUI](/screenshot/fpwv_embeddedserver_gui.png?raw=true "fpwebview GUI")

## Getting Started

Binary support files for x86_64 for Linux, macOS and Windows are provided
with this repo. See the files in the [```/dll/x86_64```](/dll/x86_64) folder.

### Linux

```
% git clone https://github.com/PierceNg/fpwebview
% cd fpwebview/demo/browser_cli
% ./linbuild.sh
<output>
% ./linrun.sh
```

### macOS

```
% git clone https://github.com/PierceNg/fpwebview
% cd fpwebview/demo/browser_cli
% ./macbuild.sh
<output>
% ./macrun.sh
```

### Windows

```
C:\> git clone https://github.com/PierceNg/fpwebview
C:\> cd fpwebview\demo\browser_cli
C:\fpwebview\demo\browser_cli> winbuild.bat
<output>
C:\fpwebview\demo\browser_cli> winrun.bat
```

## Copyright and License

Copyright (c) 2022 Pierce Ng. This repo is under MIT license, except for the following:

- Microsoft's ```WebView2Loader.dll``` is distributed as per ```LICENSE.Microsoft```.

