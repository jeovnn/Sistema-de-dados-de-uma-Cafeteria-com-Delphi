inherited Form5: TForm5
  Caption = 'Form5'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 8
    ExplicitHeight = 645
    inherited LabelNome: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited LabelTitulo: TLabel
      Width = 177
      Caption = 'Cadastro de Atendente'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 177
    end
    inherited LabelTelefone: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited LabelIDCliente: TLabel
      Width = 68
      Caption = 'Id Atendente'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 68
    end
    inherited LabelEmail: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited DBGridClientes: TDBGrid
      DataSource = DataModule1.DataSourceAtendente
    end
    inherited EditNome: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited EditTelefone: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited EditIdCliente: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited EditEMail: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    object Button1: TButton
      Left = 656
      Top = 288
      Width = 137
      Height = 25
      Caption = 'Relatorio Funcionarios'
      TabOrder = 9
    end
  end
end
