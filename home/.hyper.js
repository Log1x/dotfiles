// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // Update channel
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: 'Hack',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(255, 255, 255, 0.8)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // Blink the cursor
    cursorBlink: false,

    // Color of the text
    foregroundColor: '#f4f4f4',

    // Terminal background color
    backgroundColor: '#141414',

    // Border color (window, tabs)
    borderColor: '#111111',

    // Custom Window CSS
    css: '',

    // Custom Terminal CSS
    termCSS: '',

    // Show the Hamburger menu
    showHamburgerMenu: '',

    // Show the minimize, maximize and close buttons
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '0.75em',

    // Color Palette
    colors: {},

    // Default Shell
    shell: '',

    // Shell Arguments
    shellArgs: [],

    // Environment Variables
    env: {},

    // Bell
    bell: 'false',

    // Copy text on selection
    copyOnSelect: true,
  },

  // Plugins
  plugins: ["hyperterm-tabs", "hyperlinks", "hyper-tab-icons", "hyperblue-vibrancy"],
  localPlugins: [],

  // Keybinds
  keymaps: {}
};
