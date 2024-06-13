# ThreeBox

An attempt to make [Three.js](https://threejs.org/) useable in a native environment with [QuickJS](https://bellard.org/quickjs/) and [shajunxing's libffi bindings](https://github.com/shajunxing/quickjs-ffi).

The QuickJS submodule is a slightly modified fork that allows Windows

## Building

Run `make` in the project's root directory. Everything needed to run, including the `test.js` driver program should be in the resulting `dist/` folder.

MSVC is unfortunately unsupported at this time. This entire project was built in an MSYS2/MinGW/Clang environment. I have yet to see if things play nicely on actual Linux.


## Misc

Currently, the main branch does not have any code. Stuff in the dev branch will get squashed and merged when I get it to a nice demonstrable state.
