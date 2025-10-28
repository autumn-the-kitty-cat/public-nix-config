{ config, pkgs, ... }:
{
  home.packages = [ pkgs.nix-your-shell ];

  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      formats
      polars
      gstat
      query
    ];
    settings = {
      show_banner = false;
      edit_mode = "vi";
      cursor_shape = {
        emacs = "line";
        vi_insert = "line";
        vi_normal = "block";
      };
    };
    shellAliases = {
      meow = "hyfetch";
    };
    extraConfig = with config.stylix.base16Scheme.palette; ''
      def _nix_your_shell (command: string, args: list<string>) {
          if not (which nix-your-shell | is-empty) {
              let args = ["--"] ++ $args
              run-external nix-your-shell nu $command ...$args
          } else {
              run-external $command ...$args
          }
      }

      def --wrapped nix-shell (...args) {
          _nix_your_shell nix-shell $args
      }

      def --wrapped nix (...args) {
          _nix_your_shell nix $args
      }


      let theme = {
          base00: "#${base00}"
          base01: "#${base01}"
          base02: "#${base02}"
          base03: "#${base03}"
          base04: "#${base04}"
          base05: "#${base05}"
          base06: "#${base06}"
          base07: "#${base07}"
          base08: "#${base08}"
          base09: "#${base09}"
          base0A: "#${base0A}"
          base0B: "#${base0B}"
          base0C: "#${base0C}"
          base0D: "#${base0D}"
          base0E: "#${base0E}"
          base0F: "#${base0F}"
      }

      let scheme = {
          recognized_command: $theme.base0D
          unrecognized_command: $theme.base08
          constant: $theme.base09
          punctuation: $theme.base04
          operator: $theme.base0C
          string: $theme.base0B
          virtual_text: $theme.base04
          variable: { fg: $theme.base0F attr: i }
          filepath: $theme.base0A
      }

      $env.config.color_config = {
          separator: { fg: $theme.base04 attr: b }
          leading_trailing_space_bg: { fg: $theme.base07 attr: u }
          header: { fg: $theme.base05 attr: b }
          row_index: $scheme.virtual_text
          record: $theme.base05
          list: $theme.base05
          hints: $scheme.virtual_text
          search_result: { fg: $theme.base00 bg: $theme.base0A }
          shape_closure: $theme.base0C
          closure: $theme.base0C
          shape_flag: { fg: $theme.base08 attr: i }
          shape_matching_brackets: { attr: u }
          shape_garbage: $theme.base08
          shape_keyword: $theme.base0E
          shape_match_pattern: $theme.base0B
          shape_signature: $theme.base0C
          shape_table: $scheme.punctuation
          cell-path: $scheme.punctuation
          shape_list: $scheme.punctuation
          shape_record: $scheme.punctuation
          shape_vardecl: $scheme.variable
          shape_variable: $scheme.variable
          empty: { attr: n }
          filesize: {||
              if $in < 1kb {
                  $theme.base0C
              } else if $in < 10kb {
                  $theme.base0B
              } else if $in < 100kb {
                  $theme.base0A
              } else if $in < 10mb {
                  $theme.base09
              } else if $in < 100mb {
                  $theme.base08
              } else if $in < 1gb {
                  $theme.base08
              } else {
                  $theme.base0E
              }
          }
          duration: {||
              if $in < 1day {
                  $theme.base0C
              } else if $in < 1wk {
                  $theme.base0B
              } else if $in < 4wk {
                  $theme.base0A
              } else if $in < 12wk {
                  $theme.base09
              } else if $in < 24wk {
                  $theme.base08
              } else if $in < 52wk {
                  $theme.base08
              } else {
                  $theme.base0E
              }
          }
          date: {|| (date now) - $in |
              if $in < 1day {
                  $theme.base0C
              } else if $in < 1wk {
                  $theme.base0B
              } else if $in < 4wk {
                  $theme.base0A
              } else if $in < 12wk {
                  $theme.base09
              } else if $in < 24wk {
                  $theme.base08
              } else if $in < 52wk {
                  $theme.base08
              } else {
                  $theme.base0E
              }
          }
          shape_external: $scheme.unrecognized_command
          shape_internalcall: $scheme.recognized_command
          shape_external_resolved: $scheme.recognized_command
          shape_block: $scheme.recognized_command
          block: $scheme.recognized_command
          shape_custom: $theme.base0F
          custom: $theme.base0F
          background: $theme.base00
          foreground: $theme.base05
          cursor: { bg: $theme.base06 fg: $theme.base00 }
          shape_range: $scheme.operator
          range: $scheme.operator
          shape_pipe: $scheme.operator
          shape_operator: $scheme.operator
          shape_base08irection: $scheme.operator
          glob: $scheme.filepath
          shape_directory: $scheme.filepath
          shape_filepath: $scheme.filepath
          shape_glob_interpolation: $scheme.filepath
          shape_globpattern: $scheme.filepath
          shape_int: $scheme.constant
          int: $scheme.constant
          bool: $scheme.constant
          float: $scheme.constant
          nothing: $scheme.constant
          binary: $scheme.constant
          shape_nothing: $scheme.constant
          shape_bool: $scheme.constant
          shape_float: $scheme.constant
          shape_binary: $scheme.constant
          shape_datetime: $scheme.constant
          shape_literal: $scheme.constant
          string: $scheme.string
          shape_string: $scheme.string
          shape_string_interpolation: $theme.base0F
          shape_raw_string: $scheme.string
          shape_externalarg: $scheme.string
      }
      $env.config.highlight_resolved_externals = true
      $env.config.explore = {
          status_bar_background: { fg: $theme.base05, bg: $theme.base01 },
          command_bar_text: { fg: $theme.base05 },
          highlight: { fg: $theme.base00, bg: $theme.base0A },
          status: {
              error: $theme.base08,
              warn: $theme.base0A,
              info: $theme.base0D,
          },
          selected_cell: { bg: $theme.base0D fg: $theme.base00 },
      }
    '';
  };
}
