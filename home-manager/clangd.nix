{pkgs, ...}:
{
    home.packages = with pkgs; [
        clang
    ];

    home.file.".clang-format".text = ''
---
BasedOnStyle: WebKit
AlignAfterOpenBracket: Align
BraceWrapping:
  AfterCaseLabel: true
  AfterClass: true
  AfterControlStatement: Always
  AfterEnum: true
  AfterFunction: true
  AfterNamespace: true
  AfterObjCDeclaration: true
  AfterStruct: true
  AfterUnion: true
  AfterExternBlock: true
  BeforeCatch: true
  BeforeElse: true
  BeforeLambdaBody: true
  BeforeWhile: true
  IndentBraces: false
  SplitEmptyFunction: true
  SplitEmptyRecord: true
  SplitEmptyNamespace: true
BreakBeforeBraces: Custom
ColumnLimit: 80
IndentCaseLabels: true
InsertBraces: true
TabWidth: 4

    '';
}
