set PATH $HOME/bin $HOME/.local/bin /opt/node/bin/ $PATH

set fish_function_path $fish_function_path "/usr/share/powerline/fish/"

function bd
  cd (/home/snnw/bin/bd -s $argv 2>/dev/null)
end

function mutt
  bash --login -c 'cd ~/tmp; mutt' $argv;
end

function fish_prompt --description 'Write out the prompt'
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  switch $USER

    case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

    echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '# '

    case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    # set __fish_prompt_inbox (notmuch count --output=threads tag:inbox)
    set __fish_prompt_inbox 0
    if [ $__fish_prompt_inbox -eq 0 ]
      set -e __fish_prompt_inbox
    else
      set __fish_prompt_inbox (set_color red)"($__fish_prompt_inbox) "
    end

    echo -n -s "$__fish_prompt_inbox" "$__fish_prompt_normal" "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '> '

  end
end

powerline-setup
