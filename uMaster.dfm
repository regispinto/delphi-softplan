object fMaster: TfMaster
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Trace Downloads'
  ClientHeight = 377
  ClientWidth = 510
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMaster: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 377
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 305
    ExplicitWidth = 505
    ExplicitHeight = 376
    object gbxLink: TGroupBox
      Left = 1
      Top = 1
      Width = 508
      Height = 78
      Align = alTop
      Caption = ' [Link para dowload] '
      Color = cl3DLight
      Ctl3D = True
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 503
      object edtLink: TEdit
        Left = 9
        Top = 32
        Width = 485
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edtLinkChange
      end
    end
    object gbxOptions: TGroupBox
      Left = 1
      Top = 79
      Width = 508
      Height = 250
      Margins.Bottom = 10
      Align = alClient
      Caption = ' [Op'#231#245'es] '
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      ExplicitHeight = 290
      object btnStart: TBitBtn
        Left = 2
        Top = 18
        Width = 504
        Height = 46
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Iniciar Download'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnStartClick
        ExplicitWidth = 499
      end
      object btnDisplayMessage: TBitBtn
        Left = 2
        Top = 64
        Width = 504
        Height = 46
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Exibir mensagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnDisplayMessageClick
        ExplicitWidth = 499
      end
      object btnStop: TBitBtn
        Left = 2
        Top = 110
        Width = 504
        Height = 46
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Parar download'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnStopClick
        ExplicitWidth = 499
      end
      object btnClose: TBitBtn
        Left = 2
        Top = 202
        Width = 504
        Height = 46
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Fechar sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnCloseClick
        ExplicitWidth = 499
      end
      object btnDisplayHistory: TBitBtn
        Left = 2
        Top = 156
        Width = 504
        Height = 46
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Exibir hist'#243'rico de downloads'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnDisplayHistoryClick
        ExplicitWidth = 499
      end
    end
    object pnlProgressBar: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 332
      Width = 502
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = cl3DLight
      Ctl3D = True
      ParentBackground = False
      ParentCtl3D = False
      ShowCaption = False
      TabOrder = 2
      ExplicitTop = 331
      ExplicitWidth = 497
      object ProgressBar: TProgressBar
        Left = 0
        Top = 0
        Width = 502
        Height = 41
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 145
      end
    end
  end
end
