object DataModule1: TDataModule1
  Height = 551
  Width = 1057
  object FDConnection1: TFDConnection
    Params.Strings = (
<<<<<<< HEAD
      'Database=COFFEELOG.FDB'
=======
      'Database=C:\Users\jeova\Bancos\COFFEELOG.FDB'
>>>>>>> b0d87e456e7b661f6be16cc4b39f023220bf99f0
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Left = 56
    Top = 32
  end
  object FDQueryCliente: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    Left = 56
    Top = 104
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 192
    Top = 24
  end
  object DataSourceCliente: TDataSource
    DataSet = FDQueryCliente
    Left = 192
    Top = 104
  end
  object FDQueryPedido: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 160
  end
  object DataSourcePedido: TDataSource
    DataSet = FDQueryPedido
    Left = 184
    Top = 160
  end
  object FDQueryAtendente: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 216
  end
  object DataSourceAtendente: TDataSource
    DataSet = FDQueryAtendente
    Left = 200
    Top = 216
  end
  object FDQueryCardapio: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 272
  end
  object DataSourceCardapio: TDataSource
    DataSet = FDQueryCardapio
    Left = 192
    Top = 272
  end
  object FDQueryPagamento: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 328
  end
  object DataSourcePagamento: TDataSource
    DataSet = FDQueryPagamento
    Left = 192
    Top = 328
  end
end
