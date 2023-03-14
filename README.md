# nvim-swell

Make your windows **swole**, and then un-swell them, and then do it again!

nvim-swell let's you maximize a window without losing your current layout. When
you no longer want the window to be big, hit your swell keybind and your layout
returns!

https://user-images.githubusercontent.com/7297152/224915824-763f3bee-db63-4760-85bb-598e6ee6c52b.mp4

## Why?

Ever typed `:h foo` but when it opened it was too small to read? Well now you
can make it big without worrying about messing up your layout.

I decided to make this plugin after installing
[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui); the UI it shows is
awesome, but none of the windows are ever big enough to show the information
they contain. With swell I can now make that window big, interact with it and
return to my layout when I'm done.

## Installing

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{ "itsFrank/nvim-swell" }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "itsFrank/nvim-swell" }
```

## Usage

Set a keymap

```lua
vim.keymap.set("n", "<leader>z", "<Plug>(swell-toggle)")
```

Use the command

```text
:SwellToggle
```

Use the API

```lua
local swell = require("swell")

swell.toggle_current_window()
swell.toggle_current_window()

local window_handle = -- get a window handle somehow
swell.swell_window(window_handle)

if swell.is_swollen() then
    swell.unswell()
end
```

## Known Issues

- If you add a window while swollen, it will be tiny when unswollen
- Unswelling from a non-swollen window can occasionally lead to some windows not beign exactly like they were

## Alternatives

[NeoZoom.lua](https://github.com/nyngwang/NeoZoom.lua)

NeoZoom is a fantastic plugin that does something very similar to swell. However
insead of changing window sizes, it "pops" them out into a float. I really like
swell and, in fact, I still have it in my config mapped to `<leader>Z`.

The one reason I chose to build swell is because the way I use neozoom, my
status line is not visible, which means that if I want to "maximize" a window
for anything that involves editing, I always feel like I'm not getting the most
out of my config.

[maximize.nvim](https://github.com/declancm/maximize.nvim)

I tried maximize for a bit, but it doesnt work on some of the buffers I need it
to work on like [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) and
[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) so I did not try it for
long. It might do exactly what you want it to though. Unlike swell, it doesnt
"truly" maximizes the windows without any cluter from the non-swollen windows.
