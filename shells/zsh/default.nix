{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion = {
      enable = true;
    };
    initContent = lib.mkMerge [
      (lib.mkAfter ''
        CURSOR_BLOCK=$'\e[1 q'
        CURSOR_BAR=$'\e[5 q'

        function zle-keymap-select {
          if [[ $KEYMAP = vicmd ]]; then
            echo -ne "$CURSOR_BLOCK"
          else
            echo -ne "$CURSOR_BAR"
          fi
        }

        function zle-line-init {
          printf "$CURSOR_BAR"
        }

        zle -N zle-keymap-select
        zle -N zle-line-init
        bindkey '^?' backward-delete-char
        bindkey '^H' backward-delete-char

        zmodload zsh/complist
        zstyle ':completion:*' menu select
        zstyle ':completion:*' matcher-list \
          'm:{a-zA-Z}={A-Za-z}' \
          'r:|=*'
        zstyle ':completion:*' list-colors "ma=0;7:''${(s.:.)LS_COLORS}"
        zstyle ':completion:*' verbose yes
        zstyle ':completion:*' group-name '''
        bindkey '^[[Z' reverse-menu-complete
        bindkey -M menuselect '^[[Z' reverse-menu-complete
        setopt COMPLETE_IN_WORD
        setopt ALWAYS_TO_END
      '')
    ];
  };
}
