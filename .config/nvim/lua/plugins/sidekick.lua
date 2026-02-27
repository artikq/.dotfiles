return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if opts.servers then
        opts.servers.copilot = nil
      end
    end,
  },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
      prompts = {
        changes = "No Yapping. Review my changes!",
        diagnostics = "No Yapping. Help me fix the diagnostics in {file}\n{diagnostics}",
        diagnostics_all = "No Yapping. Help me fix these diagnostics\n{diagnostics_all}",
        document = "No Yapping. Add documentation to {function|line}",
        explain = "Explain {this}",
        fix = "No Yapping. Fix {this}",
        optimize = "How can {this} be optimized?",
        review = "Review {file} for any issues or improvements",
        tests = "Write tests for {this}",
      },
      copilot = {
        status = {
          enabled = false,
          level = vim.log.levels.OFF,
        },
      },
    },
  },
}
