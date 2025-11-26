inherited TelaCadastroAtendente: TTelaCadastroAtendente
  Caption = 'TelaCadastroAtendente'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited LabelName: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited LabelTitulo: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited LabelTelefone: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited LabelID: TLabel
      StyleElements = [seFont, seClient, seBorder]
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
  end
end
