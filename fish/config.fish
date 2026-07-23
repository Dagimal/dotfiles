if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    cd ~
end

zoxide init fish | source
set -gx PATH $HOME/.local/bin $PATH

set -x GPG_TTY (tty)


# Added by Antigravity CLI installer
set -gx PATH "/home/dagimal/.local/bin" $PATH

# Claude Code / DeepSeek Configuration
set -gx ANTHROPIC_BASE_URL https://api.deepseek.com/anthropic
set -gx ANTHROPIC_AUTH_TOKEN "sk-59f99f71447444b3bb591a95ef455fb6"
set -gx ANTHROPIC_MODEL "deepseek-v4-pro[1m]"
set -gx ANTHROPIC_DEFAULT_OPUS_MODEL "deepseek-v4-pro[1m]"
set -gx ANTHROPIC_DEFAULT_SONNET_MODEL "deepseek-v4-pro[1m]"
set -gx ANTHROPIC_DEFAULT_HAIKU_MODEL "deepseek-v4-flash"
set -gx CLAUDE_CODE_SUBAGENT_MODEL "deepseek-v4-flash"
set -gx CLAUDE_CODE_EFFORT_LEVEL "high"
