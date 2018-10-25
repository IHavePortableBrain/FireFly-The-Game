object FPlayForm: TFPlayForm
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  ParentCustomHint = False
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 1000
  ClientWidth = 900
  Color = clBlack
  Ctl3D = False
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblHP: TLabel
    Left = 11
    Top = 945
    Width = 60
    Height = 40
    Caption = 'HP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -35
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object lblTitleScore: TLabel
    Left = 330
    Top = 947
    Width = 120
    Height = 40
    Caption = 'Score:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -35
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object lblScore: TLabel
    Left = 471
    Top = 949
    Width = 20
    Height = 40
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -35
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object lblPlayerName: TLabel
    Left = 109
    Top = 555
    Width = 202
    Height = 40
    Caption = 'Enter Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -40
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lblLevelTitle: TLabel
    Left = 540
    Top = 948
    Width = 120
    Height = 40
    Caption = 'Level:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -35
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object lblLevel: TLabel
    Left = 680
    Top = 949
    Width = 20
    Height = 40
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -35
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object lblTop10: TLabel
    Left = 285
    Top = 457
    Width = 320
    Height = 40
    Caption = 'You fought well.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -33
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object STGameStatus: TLabel
    Left = 281
    Top = 356
    Width = 382
    Height = 60
    Caption = 'Press any key ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -53
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object PBFireFlyHP: TProgressBar
    Left = 85
    Top = 960
    Width = 227
    Height = 22
    BarColor = clRed
    BackgroundColor = clRed
    TabOrder = 0
  end
  object edtPlayerName: TEdit
    Left = 110
    Top = 618
    Width = 383
    Height = 54
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'Player_Unknown'
    Visible = False
    OnKeyPress = edtPlayerNameKeyPress
  end
  object btnSaveScore: TButton
    Left = 533
    Top = 607
    Width = 236
    Height = 86
    Caption = 'Save Score'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = btnSaveScoreClick
  end
  object btnRestart: TButton
    Left = 531
    Top = 711
    Width = 236
    Height = 86
    Caption = 'Restart'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = btnRestartClick
  end
  object MainMenu: TMainMenu
    Left = 268
    Top = 205
    object Quit: TMenuItem
      Caption = 'Back to main'
      OnClick = QuitClick
    end
    object Pause: TMenuItem
      Caption = 'Pause'
      OnClick = PauseClick
    end
    object keys: TMenuItem
      Caption = 'Keys'
      OnClick = keysClick
    end
  end
  object AEenemies: TApplicationEvents
    OnIdle = AEenemiesIdle
    Left = 305
    Top = 237
  end
  object AEMissleMove: TApplicationEvents
    OnIdle = AEMissleMoveIdle
    Left = 268
    Top = 237
  end
  object AEexplosions: TApplicationEvents
    OnIdle = AEexplosionsIdle
    Left = 234
    Top = 237
  end
  object AEmoveFirefly: TApplicationEvents
    OnIdle = AEmoveFireflyIdle
    Left = 306
    Top = 274
  end
  object AEcd: TApplicationEvents
    OnIdle = AEcdIdle
    Left = 233
    Top = 272
  end
end
