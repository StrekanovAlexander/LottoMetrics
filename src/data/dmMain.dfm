object DM: TDM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=Embedded'
      
        'Database=D:\dev\delphi\delphi12ce\LottoMetrics\dist\data\LOTTOME' +
        'TRICS.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object FBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'D:\dev\delphi\delphi12ce\PawnDesk\dist\data\fbclient.dll'
    Embedded = True
    Left = 136
    Top = 24
  end
  object FDQuerySelect: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM lotteries')
    Left = 32
    Top = 112
  end
  object FDQueryExec: TFDQuery
    Connection = FDConnection
    Left = 32
    Top = 192
  end
end
