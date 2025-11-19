inherited TelaCadastroAtendente: TTelaCadastroAtendente
  Caption = 'TelaCadastroAtendente'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label2: TLabel
      Width = 177
      Caption = 'Cadastro de Atendente'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 177
    end
    inherited Label3: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label4: TLabel
      Width = 68
      Caption = 'Id Atendente'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 68
    end
    inherited Label5: TLabel
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
  end
end
