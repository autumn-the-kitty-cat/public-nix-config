{ config, ... }:
{
  home.file.".config/vesktop/themes/base16.css".text =
    with config.stylix.base16Scheme.palette;
    with config.stylix.fonts;
    ''
      @import url('https://refact0r.github.io/midnight-discord/build/midnight.css');  

      body {
          font-family: '${monospace.name}', '${emoji.name}';
      }

      :root {
          --font-primary: '${monospace.name}', '${emoji.name}';
          --font-display: '${monospace.name}', '${emoji.name}';
          --font-headline: '${monospace.name}', '${emoji.name}';
          --font-code: '${monospace.name}', '${emoji.name}';
          --font-clan-body: '${monospace.name}', '${emoji.name}';
          --font-clan-signature: '${monospace.name}', '${emoji.name}';
          --font-display-marketing: '${monospace.name}', '${emoji.name}';
          --font-display-marketing-header: '${monospace.name}', '${emoji.name}';
          --online-indicator: #${base0B};
          --dnd-indicator: #${base08};
          --idle-indicator: #${base08};
          --streaming-indicator: #${base0E};

          --accent-1: #${base0E}; /* links */
          --accent-2: #${base0E}; /* general unread/mention elements */
          --accent-3: #${base0E}; /* accent buttons */
          --accent-4: #${base0E}; /* accent buttons when hovered */
          --accent-5: #${base0E}; /* accent buttons when clicked */
          --accent-new: #${base0E}; /* new indicator */
          --mention: #${base06}1a; /* mentions & mention messages */
          --mention-hover: #${base06}1a; /* mentions & mention messages when hovered */

          --text-0: var(--bg-4); /* text on colored elements */
          --text-1: #${base05}; /* bright text on colored elements */
          --text-2: #${base05}; /* headings and important text */
          --text-3: #${base05}; /* normal text */
          --text-4: #${base05}; /* icon buttons and channels */
          --text-5: #${base05}; /* muted channels/chats and timestamps */

          --bg-1: #${base03}; /* dark buttons when clicked */
          --bg-2: #${base02}; /* dark buttons */
          --bg-3: #${base01}; /* spacing, secondary elements */
          --bg-4: #${base00}; /* main background color */
          --hover: #${base03}; /* channels and buttons when hovered */
          --active: #${base03}; /* channels and buttons when clicked or selected */
          --message-hover: #${base01}1a; /* messages when hovered */

          /* Unset unthemeable elements*/
          --login-bg-filter: none; /* login background artwork */
          --green-to-accent-3-filter: none; /* add friend page explore icon */
          --blurple-to-accent-3-filter: none; /* add friend page school icon */
      }
    '';

  programs.vesktop = {
    enable = true;
    vencord.settings = {
      autoUpdate = true;
      autoUpdateNotification = true;
      useQuickCss = true;
      themeLinks = [ ];
      enabledThemes = [ "base16.css" ];
      frameless = false;
      transparent = false;
      winCtrlQ = false;
      disableMinSize = false;
      winNativeTitleBar = false;
      plugins = {
        ChatInputButtonAPI.enabled = true;
        CommandsAPI.enabled = true;
        DynamicImageModalAPI.enabled = true;
        MemberListDecoratorsAPI.enabled = true;
        MessageAccessoriesAPI.enabled = true;
        MessageDecorationsAPI.enabled = true;
        MessageEventsAPI.enabled = true;
        MessagePopoverAPI.enabled = true;
        MessageUpdaterAPI.enabled = true;
        UserSettingsAPI.enabled = true;
        AlwaysExpandRoles.enabled = true;
        AnonymiseFileNames.enabled = true;
        BetterRoleContext.enabled = true;
        BetterRoleDot = {
          enabled = true;
          bothStyles = false;
          copyRoleColorInProfilePopout = false;
        };
        BetterSessions = {
          enabled = true;
          backgroundCheck = false;
        };
        BlurNSFW = {
          enabled = true;
          blurAmount = 10;
        };
        CallTimer.enabled = true;
        ClearURLs.enabled = true;
        ConsoleJanitor = {
          enabled = true;
          disableLoggers = false;
          disableSpotifyLogger = true;
          whitelistedLoggers = "GatewaySocket; Routing/Utils";
        };
        CopyEmojiMarkdown.enabled = true;
        CopyFileContents.enabled = true;
        CopyUserURLs.enabled = true;
        CrashHandler.enabled = true;
        ExpressionCloner.enabled = true;
        FakeNitro.enabled = true;
        FavoriteGifSearch.enabled = true;
        FixCodeblockGap.enabled = true;
        FixImagesQuality.enabled = true;
        FixSpotifyEmbeds.enabled = true;
        FixYoutubeEmbeds.enabled = true;
        ForceOwnerCrown.enabled = true;
        FriendsSince.enabled = true;
        FullSearchContext.enabled = true;
        iLoveSpam.enabled = true;
        ImplicitRelationships = {
          enabled = true;
          sortByAffinity = true;
        };
        LoadingQuotes = {
          enabled = true;
          replaceEvents = true;
          enableDiscordPresetQuotes = false;
          additionalQuotes = "";
          additionalQuotesDelimiter = "|";
          enablePluginPresetQuotes = true;
        };
        MemberCount = {
          enabled = true;
          memberList = true;
          toolTip = true;
        };
        MessageLinkEmbeds.enabled = true;
        MessageLogger = {
          enabled = true;
          deleteStyle = "overlay";
          logDeletes = true;
          collapseDeleted = false;
          logEdits = true;
          inlineEdits = true;
          ignoreBots = false;
          ignoreSelf = false;
          ignoreUsers = "";
          ignoreChannels = "";
          ignoreGuilds = "";
        };
        MoreCommands.enabled = true;
        MutualGroupDMs.enabled = true;
        NoDevtoolsWarning.enabled = true;
        NoMaskedUrlPaste.enabled = true;
        NoOnboardingDelay.enabled = true;
        NoProfileThemes.enabled = true;
        NormalizeMessageLinks.enabled = true;
        OnePingPerDM.enabled = true;
        OpenInApp = {
          enabled = true;
          spotify = true;
        };
        PermissionsViewer.enabled = true;
        petpet.enabled = true;
        PlatformIndicators = {
          enabled = true;
          colorMobileIndicator = true;
          list = true;
          badges = true;
          messages = true;
        };
        QuickMention.enabled = true;
        QuickReply.enabled = true;
        RelationshipNotifier.enabled = true;
        RevealAllSpoilers.enabled = true;
        ReverseImageSearch.enabled = true;
        SendTimestamps.enabled = true;
        ServerInfo.enabled = true;
        ShikiCodeblocks = {
          enabled = true;
          useDevIcon = "GREYSCALE";
          theme = "https =//raw.githubusercontent.com/shikijs/textmate-grammars-themes/2d87559c7601a928b9f7e0f0dda243d2fb6d4499/packages/tm-themes/themes/dark-plus.json";
        };
        ShowHiddenChannels = {
          enabled = true;
          showMode = 0;
          hideUnreads = true;
        };
        ShowHiddenThings = {
          enabled = true;
          showTimeouts = true;
          showInvitesPaused = true;
          showModView = true;
          disableDiscoveryFilters = true;
          disableDisallowedDiscoveryFilters = true;
        };
        SilentMessageToggle.enabled = true;
        SpotifyControls = {
          enabled = true;
          hoverControls = false;
        };
        Translate = {
          enabled = true;
          autoTranslate = false;
          showChatBarButton = true;
        };
        TypingIndicator = {
          enabled = true;
          includeMutedChannels = false;
          includeCurrentChannel = true;
        };
        TypingTweaks = {
          enabled = true;
          alternativeFormatting = true;
        };
        UnlockedAvatarZoom.enabled = true;
        UserVoiceShow = {
          enabled = true;
          showInUserProfileModal = true;
          showInMemberList = true;
          showInMessages = true;
        };
        ValidReply.enabled = true;
        ValidUser.enabled = true;
        VoiceChatDoubleClick.enabled = true;
        VcNarrator.enabled = true;
        ViewIcons.enabled = true;
        ViewRaw = {
          enabled = true;
          clickMethod = "Left";
        };
        VoiceDownload.enabled = true;
        VoiceMessages.enabled = true;
        VolumeBooster.enabled = true;
        WebKeybinds.enabled = true;
        WebScreenShareFixes.enabled = true;
        WhoReacted.enabled = true;
        YoutubeAdblock.enabled = true;
        NoTrack = {
          enabled = true;
          disableAnalytics = true;
        };
        WebContextMenus = {
          enabled = true;
          addBack = true;
        };
        Settings = {
          enabled = true;
          settingsLocation = "aboveNitro";
        };
        SupportHelper.enabled = true;
      };
    };
  };
}
