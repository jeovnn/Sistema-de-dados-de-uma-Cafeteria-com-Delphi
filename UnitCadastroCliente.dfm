object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 653
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1056
    Height = 653
    Align = alClient
    TabOrder = 0
    object LabelName: TLabel
      Left = 40
      Top = 120
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object LabelTitulo: TLabel
      Left = 40
      Top = 24
      Width = 150
      Height = 23
      Caption = 'Cadastro de Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelTelefone: TLabel
      Left = 41
      Top = 170
      Width = 45
      Height = 15
      Caption = 'Telefone'
    end
    object LabelID: TLabel
      Left = 40
      Top = 70
      Width = 50
      Height = 15
      Caption = 'Id Cliente'
    end
    object LabelEmail: TLabel
      Left = 41
      Top = 226
      Width = 29
      Height = 15
      Caption = 'Email'
    end
    object DBGridClientes: TDBGrid
      Left = 40
      Top = 336
      Width = 985
      Height = 265
      DataSource = DataModule1.DataSourceCliente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object ButtonNovo: TButton
      Left = 41
      Top = 288
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = ButtonNovoClick
    end
    object ButtonExcluir: TButton
      Left = 137
      Top = 288
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = ButtonExcluirClick
    end
    object ButtonCancelar: TButton
      Left = 232
      Top = 288
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = ButtonCancelarClick
    end
    object ButtonSalvar: TButton
      Left = 329
      Top = 288
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = ButtonSalvarClick
    end
    object EditNome: TEdit
      Left = 40
      Top = 141
      Width = 241
      Height = 23
      TabOrder = 5
    end
    object EditTelefone: TEdit
      Left = 40
      Top = 191
      Width = 241
      Height = 23
      TabOrder = 6
    end
    object EditIdCliente: TEdit
      Left = 40
      Top = 91
      Width = 241
      Height = 23
      TabOrder = 7
    end
    object EditEMail: TEdit
      Left = 40
      Top = 247
      Width = 241
      Height = 23
      TabOrder = 8
    end
    object ButtonRelatorio: TButton
      Left = 888
      Top = 288
      Width = 137
      Height = 25
      Caption = 'Gerar Relatorio'
      TabOrder = 9
      OnClick = ButtonRelatorioClick
    end
  end
end
