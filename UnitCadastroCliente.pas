unit UnitCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, UnitConexao, FireDAC.Comp.Client,unitrelatorio;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    DBGridClientes: TDBGrid;
    ButtonNovo: TButton;
    ButtonExcluir: TButton;
    ButtonCancelar: TButton;
    ButtonSalvar: TButton;
    LabelName: TLabel;
    LabelTitulo: TLabel;
    LabelTelefone: TLabel;
    EditNome: TEdit;
    EditTelefone: TEdit;
    EditIdCliente: TEdit;
    LabelID: TLabel;
    EditEmail: TEdit;
    LabelEmail: TLabel;
    ButtonRelatorio: TButton;
    procedure FormShow(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonRelatorioClick(Sender: TObject);
  private
    procedure LimparCampos;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.LimparCampos;
begin
  EditIdCliente.Clear;
  EditNome.Clear;
  EditTelefone.Clear;
  EditEmail.Clear;
end;

procedure TForm2.ButtonNovoClick(Sender: TObject);
var
  QTemp: TFDQuery;
  ProxID: Integer;
begin
  LimparCampos;

  QTemp := TFDQuery.Create(nil);
  try
    QTemp.Connection := DataModule1.FDConnection1;
    QTemp.SQL.Text :=
      'SELECT NEXT VALUE FOR GEN_CLIENTE_ID AS PROXIMO FROM RDB$DATABASE';
    QTemp.Open;
    ProxID := QTemp.FieldByName('PROXIMO').AsInteger;
  finally
    QTemp.Free;
  end;

  EditIdCliente.Text := IntToStr(ProxID);
  DataModule1.FDQueryCliente.Append;
end;

procedure TForm2.ButtonRelatorioClick(Sender: TObject);
begin
  DataModule1.FDQueryCliente.Close;
  DataModule1.FDQueryCliente.SQL.Text := 'SELECT * FROM CLIENTE';
  DataModule1.FDQueryCliente.Open;

  Form4 := TForm4.Create(nil);
  Form4.RLReport1.DataSource  := DataModule1.DataSourceCliente;

  try
    Form4.RLDBText1.DataSource  := DataModule1.DataSourceCliente;
    Form4.RLDBText1.DataField   := 'ID_CLIENTE';

    Form4.RLDBText2.DataSource  := DataModule1.DataSourceCliente;
    form4.Label2.Caption:= 'Nome';
    Form4.RLDBText2.DataField   := 'NOME';

    Form4.RLDBText3.DataSource  := DataModule1.DataSourceCliente;
    form4.Label3.Caption:= 'Email';
    Form4.RLDBText3.DataField   := 'EMAIL';

    Form4.RLReport1.Preview;
  finally
    Form4.Free;
  end;
end;

procedure TForm2.ButtonExcluirClick(Sender: TObject);
begin
  // Verifica se há um registro selecionado
  if DataModule1.FDQueryCliente.IsEmpty then
  begin
    ShowMessage('Nenhum cliente selecionado.');
    Exit;
  end;

  // Pede confirmação
  if MessageDlg('Deseja realmente excluir o cliente "' +
     DataModule1.FDQueryCliente.FieldByName('NOME').AsString + '"?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      // Exclui o registro atual
      DataModule1.FDQueryCliente.Delete;
      DataModule1.FDQueryCliente.ApplyUpdates(0);
      DataModule1.FDConnection1.CommitRetaining;
      DataModule1.FDQueryCliente.Refresh;

      ShowMessage('Cliente excluído com sucesso!');
      LimparCampos;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir cliente: ' + E.Message);
    end;
  end;
end;

procedure TForm2.ButtonCancelarClick(Sender: TObject);
begin
  DataModule1.FDQueryCliente.Cancel;
  LimparCampos;
end;

procedure TForm2.ButtonSalvarClick(Sender: TObject);
begin
  if Trim(EditNome.Text) = '' then
  begin
    ShowMessage('Informe o nome do cliente.');
    Exit;
  end;

  with DataModule1.FDQueryCliente do
  begin
    if not (State in [dsInsert, dsEdit]) then
      Append;

    FieldByName('ID_CLIENTE').AsInteger := StrToInt(EditIdCliente.Text);
    FieldByName('NOME').AsString        := EditNome.Text;
    FieldByName('TELEFONE').AsString    := EditTelefone.Text;
    FieldByName('EMAIL').AsString       := EditEmail.Text;

    Post;
    ApplyUpdates(0);
  end;

  DataModule1.FDConnection1.CommitRetaining;
  DataModule1.FDQueryCliente.Refresh;

  ShowMessage('Cliente salvo com sucesso!');
  LimparCampos;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  with DataModule1.FDQueryCliente do
  begin
    Close;
    SQL.Text := 'SELECT * FROM CLIENTE';
    Open;
  end;
end;

end.
