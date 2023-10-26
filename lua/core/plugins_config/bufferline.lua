local bufferline = require('bufferline')
bufferline.setup {
options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
    indicator = {
	icon = '▎', -- this should be omitted if indicator style is not 'icon'
	style = 'icon',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    }
}
