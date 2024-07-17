return {
    'sbdchd/neoformat',
    config = function()
        vim.g.neoformat_enabled_ps1 = {'PSScriptAnalyzer'}

        vim.g.neoformat_ps1_psscriptanalyzer = {
            exe = '/usr/bin/pwsh',
            args = {'-Command', 'Invoke-Formatter -ScriptDefinition (Get-Content -Raw -Path -)'},
            stdin = 1
        }

        vim.cmd [[
        augroup fmt
            autocmd!
            autocmd BufWritePre *.ps1 Neoformat
        augroup END
        ]]
    end
}
