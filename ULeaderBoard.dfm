object fLeaderBoard: TfLeaderBoard
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'LeaderBoard'
  ClientHeight = 353
  ClientWidth = 366
  Color = clTeal
  TransparentColor = True
  TransparentColorValue = clOlive
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clMaroon
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SGLeaderBoard: TStringGrid
    Left = 12
    Top = 65
    Width = 343
    Height = 277
    ColCount = 3
    DrawingStyle = gdsGradient
    Enabled = False
    FixedCols = 0
    RowCount = 11
    ScrollBars = ssNone
    TabOrder = 0
    ColWidths = (
      34
      189
      120)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object STTitleLeaderBoard: TStaticText
    Left = 85
    Top = 3
    Width = 202
    Height = 58
    Caption = 'Best scouts'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Transparent = False
  end
end
