object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 588
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnShow = FormShow
  TextHeight = 15
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 588
    Align = alClient
    TabOrder = 0
    DesignSize = (
      804
      588)
    object Label1: TLabel
      Left = 465
      Top = 18
      Width = 61
      Height = 15
      Caption = 'Atendente: '
    end
    object Label2: TLabel
      Left = 532
      Top = 18
      Width = 3
      Height = 15
    end
    object DBGridCardapio: TDBGrid
      Left = 16
      Top = 224
      Width = 769
      Height = 336
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataModule1.DataSourceCardapio
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object ButtonSelecionar: TButton
      Left = 704
      Top = 166
      Width = 81
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 1
      Visible = False
      OnClick = Button1Click
    end
  end
  object ButtonAlterarAtendente: TButton
    Left = 465
    Top = 41
    Width = 105
    Height = 25
    Caption = 'Alterar Atendente'
    TabOrder = 1
    OnClick = ButtonSelecionarClick
  end
  object DBGridAtendentes: TDBGrid
    Left = 465
    Top = 72
    Width = 320
    Height = 88
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 24
    object Cadastrar1: TMenuItem
      Caption = 'Cadastrar'
      object Cadastrar2: TMenuItem
        Caption = 'Cliente'
      end
      object Cliente1: TMenuItem
        Caption = 'Pedido'
      end
    end
  end
end
