object fHistory: TfHistory
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Lista de downloads realizados'
  ClientHeight = 536
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object dbgHistory: TDBGrid
    Left = 0
    Top = 0
    Width = 956
    Height = 492
    Align = alClient
    DataSource = DataSource
    DrawingStyle = gdsGradient
    FixedColor = clGradientActiveCaption
    GradientEndColor = clGradientActiveCaption
    GradientStartColor = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Color = cl3DLight
        Expanded = False
        FieldName = 'URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 709
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAINICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Caption = 'Data In'#237'cio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Color = cl3DLight
        Expanded = False
        FieldName = 'DATAFIM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Caption = 'Data Fim'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object dbnHistory: TDBNavigator
    Left = 0
    Top = 492
    Width = 956
    Height = 25
    DataSource = DataSource
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alBottom
    Hints.Strings = (
      'First record'
      'Prior record'
      'Next record'
      'Last record'
      'Insert record'
      'Delete record --?'
      'Edit record'
      'Post edit'
      'Cancel edit'
      'Refresh data'
      'Apply updates'
      'Cancel updates')
    TabOrder = 1
    ExplicitTop = 255
    ExplicitWidth = 564
  end
  object stbMessage: TStatusBar
    Left = 0
    Top = 517
    Width = 956
    Height = 19
    Margins.Top = 20
    Margins.Bottom = 20
    Panels = <
      item
        Text = 'Tecla [ESC] retorna a tela anterior'
        Width = 800
      end
      item
        Text = 'Registro 0/0'
        Width = 50
      end>
    ExplicitTop = 515
  end
  object FDQuery: TFDQuery
    AfterScroll = FDQueryAfterScroll
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT Codigo, Url, DATAINICIO, DataFim FROM logsdownload')
    Left = 104
    Top = 40
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 104
    Top = 96
  end
end
