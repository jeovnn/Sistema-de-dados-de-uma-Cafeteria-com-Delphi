object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = -80
    Top = -320
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 16
    end
  end
  object RLBand3: TRLBand
    Left = 24
    Top = 48
    Width = 569
    Height = 361
    Transparent = False
  end
  object RLLabelPedido: TRLLabel
    Left = 272
    Top = 72
    Width = 126
    Height = 21
    Caption = 'Relatorio Pedidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object RLDetailGrid1: TRLDetailGrid
    Left = 64
    Top = 152
    Width = 481
    Height = 233
    Transparent = False
  end
  object RLDBText1: TRLDBText
    Left = 104
    Top = 176
    Width = 44
    Height = 15
    DataField = 'PEDIDO'
    DataSource = DataModule1.DataSourcePedido
    Text = ''
    Transparent = False
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.FDQueryPedido
    Left = 536
    Top = 104
  end
end
