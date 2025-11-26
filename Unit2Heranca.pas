unit Unit2Heranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UnitCadastroCliente, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, UnitConexao, FireDAC.Comp.Client;

type

  TBaseCadastro = class
  public
    procedure ExibirMensagem; virtual;
    procedure MetodoObrigatorio; virtual; abstract;
    procedure CalcularTotal(A: Integer); overload;
    procedure CalcularTotal(A, B: Integer); overload;
  end;

  TCadastroAtendente = class(TBaseCadastro)
  public
    procedure MetodoObrigatorio; override;
  end;

  TTelaCadastroAtendente = class(TForm2)
    procedure FormShow(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonRelatorioClick(Sender: TObject);
  private
    procedure LimparCamposAtendente;
  public
    Cadastro: TCadastroAtendente;
  end;

var
  TelaCadastroAtendente: TTelaCadastroAtendente;

implementation

{$R *.dfm}

uses UnitRelatorio;


procedure TBaseCadastro.ExibirMensagem;
begin
  ShowMessage('Cadastro iniciado. Preencha os dados do atendente.');
end;

procedure TBaseCadastro.CalcularTotal(A: Integer);
begin
  ShowMessage('Valor informado: ' + A.ToString);
end;

procedure TBaseCadastro.CalcularTotal(A, B: Integer);
begin
  ShowMessage('Resultado da soma: ' + (A + B).ToString);
end;


procedure TCadastroAtendente.MetodoObrigatorio;
begin
  ShowMessage('Recurso obrigatório executado corretamente.');
end;


procedure TTelaCadastroAtendente.FormShow(Sender: TObject);
begin
  inherited;
  Cadastro := TCadastroAtendente.Create;
  LabelTitulo.Caption := 'Cadastro de Atendente';

  with DataModule1.FDQueryAtendente do
  begin
    Close;
    SQL.Text := 'SELECT * FROM ATENDENTE';
    Open;
  end;

  DBGridClientes.DataSource := DataModule1.DataSourceAtendente;
end;

procedure TTelaCadastroAtendente.LimparCamposAtendente;
begin
  EditIdCliente.Clear;
  EditNome.Clear;
  EditTelefone.Clear;
  EditEmail.Clear;
end;

procedure TTelaCadastroAtendente.ButtonNovoClick(Sender: TObject);
var
  QTemp: TFDQuery;
  ProxID: Integer;
begin
  LimparCamposAtendente;

  Cadastro.ExibirMensagem;
  Cadastro.MetodoObrigatorio;
  Cadastro.CalcularTotal(10);
  Cadastro.CalcularTotal(10, 20);

  QTemp := TFDQuery.Create(nil);
  try
    QTemp.Connection := DataModule1.FDConnection1;
    QTemp.SQL.Text :=
      'SELECT NEXT VALUE FOR GEN_ATENDENTE_ID AS PROXIMO FROM RDB$DATABASE';
    QTemp.Open;
    ProxID := QTemp.FieldByName('PROXIMO').AsInteger;
  finally
    QTemp.Free;
  end;

  EditIdCliente.Text := IntToStr(ProxID);
  DataModule1.FDQueryAtendente.Append;
end;

procedure TTelaCadastroAtendente.ButtonRelatorioClick(Sender: TObject);
begin
  DataModule1.FDQueryAtendente.Close;
  DataModule1.FDQueryAtendente.SQL.Text := 'SELECT * FROM ATENDENTE';
  DataModule1.FDQueryAtendente.Open;

  Form4 := TForm4.Create(nil);
  Form4.RLReport1.DataSource  := DataModule1.DataSourceAtendente;
  try
    Form4.RLDBText1.DataSource  := DataModule1.DataSourceAtendente;
    Form4.RLDBText1.DataField   := 'ID_ATENDENTE';

    Form4.RLDBText2.DataSource  := DataModule1.DataSourceAtendente;
    form4.Label2.Caption:= 'Nome';
    Form4.RLDBText2.DataField   := 'NOME';

    Form4.RLDBText3.DataSource  := DataModule1.DataSourceAtendente;
    form4.Label3.Caption:= 'Email';
    Form4.RLDBText3.DataField   := 'EMAIL';

    Form4.RLReport1.Preview;
  finally
    Form4.Free;
  end;
end;

procedure TTelaCadastroAtendente.ButtonSalvarClick(Sender: TObject);
begin
  if Trim(EditNome.Text) = '' then
  begin
    ShowMessage('O campo Nome é obrigatório.');
    Exit;
  end;

  with DataModule1.FDQueryAtendente do
  begin
    if not(State in [dsInsert, dsEdit]) then
      Append;

    FieldByName('ID_ATENDENTE').AsInteger := StrToInt(EditIdCliente.Text);
    FieldByName('NOME').AsString := EditNome.Text;
    FieldByName('TELEFONE').AsString := EditTelefone.Text;
    FieldByName('EMAIL').AsString := EditEmail.Text;

    Post;
    ApplyUpdates(0);
    DataModule1.FDConnection1.CommitRetaining;

    Close;
    Open;

    ShowMessage('Cadastro salvo com sucesso.');
    LimparCamposAtendente;
  end;
end;

procedure TTelaCadastroAtendente.ButtonExcluirClick(Sender: TObject);
begin
  if DataModule1.FDQueryAtendente.IsEmpty then
  begin
    ShowMessage('Nenhum atendente selecionado.');
    Exit;
  end;

  try
    DataModule1.FDQueryAtendente.Delete;
    DataModule1.FDQueryAtendente.ApplyUpdates(0);
    DataModule1.FDConnection1.CommitRetaining;

    DataModule1.FDQueryAtendente.Close;
    DataModule1.FDQueryAtendente.Open;

    ShowMessage('Registro excluído com sucesso.');
    LimparCamposAtendente;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir o registro: ' + E.Message);
  end;
end;

end.

