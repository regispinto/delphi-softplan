object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 301
  Width = 402
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Familia\Documents\workspace\delphi-softplan\Wi' +
        'n32\Debug\Database\logs.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 64
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 120
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 72
    Top = 184
  end
end
