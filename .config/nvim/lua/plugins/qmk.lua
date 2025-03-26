return {
  {
    "codethread/qmk.nvim",
    config = function()
      ---@type qmk.UserConfig
      local conf = {
        name = "LAYOUT_iso_85",
        layout = {
          "x x x x x x x x x x x x x x x x",
          "x x x x x x x x x x x x x xx^ x",
          "x x x x x x x x x x x x x xx^ x",
          "x x x x x x x x x x x x x _ _ x",
          "x x x x x x x x x x x x xx^ x x",
          "x x x _ xxxx^xxxx _ x x x x x x",
        },
      }
      require("qmk").setup(conf)
    end,
  },
}
