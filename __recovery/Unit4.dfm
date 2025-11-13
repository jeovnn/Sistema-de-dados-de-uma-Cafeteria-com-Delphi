object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 729
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 2
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataModule1.DataSourceCardapio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      object RLDBText1: TRLDBText
        Left = 128
        Top = 0
        Width = 53
        Height = 16
        DataField = 'ID_ITEM'
        DataSource = DataModule1.DataSourceCardapio
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 368
        Top = 0
        Width = 43
        Height = 16
        DataField = 'NOME'
        DataSource = DataModule1.DataSourceCardapio
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 600
        Top = 0
        Width = 50
        Height = 16
        DataField = 'PRECO'
        DataSource = DataModule1.DataSourceCardapio
        Text = ''
      end
    end
  end
end
