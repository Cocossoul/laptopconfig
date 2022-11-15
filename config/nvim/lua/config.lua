local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

au('TextYankPost', {
    group = ag('yank_highlight', {}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch', timeout=300 }
        end,
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "rust", "go" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}

-- require('colorful-winsep').setup{}
require('leap').add_default_mappings()
