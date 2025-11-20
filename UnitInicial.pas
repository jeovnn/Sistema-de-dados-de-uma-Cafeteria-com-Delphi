unit UnitInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,UnitConexao, Vcl.Menus, Vcl.StdCtrls,unitcadastrocliente,unitcadastropedido,unitrelatorio,
  Vcl.Imaging.jpeg,unit2heranca;

type
  TForm1 = class(TForm)
    PanelPrincipal: TPanel;
    DBGridCardapio: TDBGrid;
    MainMenu1: TMainMenu;
    Cadastrar1: TMenuItem;
    Cadastrar2: TMenuItem;
    Cliente1: TMenuItem;
    ButtonAlterarAtendente: TButton;
    DBGridAtendentes: TDBGrid;
    LabelNomeAtendente: TLabel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    ButtonRelatorio: TButton;
    Atendente1: TMenuItem;
    ButtonSelecionar: TButton;
    EditPesquisa: TEdit;
    LabelLupa: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    procedure ButtonoSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridAtendentesCellClick(Column: TColumn);
    procedure Cadastrar2Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure ButtonRelatorioClick(Sender: TObject);
    procedure Atendente1Click(Sender: TObject);
    procedure ButtonSelecionarClick(Sender: TObject);
    procedure EditPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Atendente1Click(Sender: TObject);
begin
TelaCadastroAtendente.Show;
end;

procedure TForm1.ButtonRelatorioClick(Sender: TObject);
begin
  DataModule1.FDQueryCardapio.Close;
  DataModule1.FDQueryCardapio.SQL.Text := 'SELECT * FROM CARDAPIO';
  DataModule1.FDQueryCardapio.Open;

  Form4 := TForm4.Create(nil);
  try
    Form4.RLReport1.DataSource := DataModule1.DataSourceCardapio;

    Form4.RLDBText1.DataSource := DataModule1.DataSourceCardapio;
    Form4.RLDBText1.DataField  := 'ID_ITEM';

    Form4.RLDBText2.DataSource := DataModule1.DataSourceCardapio;
    Form4.RLDBText2.DataField  := 'NOME';

    Form4.RLDBText3.DataSource := DataModule1.DataSourceCardapio;
    Form4.RLDBText3.DataField  := 'PRECO';

    Form4.RLReport1.Preview;
  finally
    Form4.Free;
  end;
end;

procedure TForm1.ButtonSelecionarClick(Sender: TObject);
begin
dbgridatendentes.visible:= false;
buttonselecionar.visible:= false;
image1.visible:= true;
end;

Procedure TForm1.ButtonoSelecionarClick(Sender: TObject);
begin
dbgridatendentes.visible:= true;
buttonselecionar.visible:= true;
image1.visible:= false;
end;

procedure TForm1.Cadastrar2Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.Cliente1Click(Sender: TObject);
begin
form3.show;
end;

procedure TForm1.DBGridAtendentesCellClick(Column: TColumn);
begin
    LabelNomeAtendente.Caption := 'Atendente: ' +
    DBGridAtendentes.DataSource.DataSet.FieldByName('NOME').AsString;
end;


procedure TForm1.EditPesquisaChange(Sender: TObject);
begin
  DataModule1.FDQueryCardapio.Close;
  DataModule1.FDQueryCardapio.SQL.Text :=
    'SELECT * FROM CARDAPIO WHERE UPPER(NOME) LIKE UPPER(:PESQ)';
  DataModule1.FDQueryCardapio.ParamByName('PESQ').AsString :=
    '%' + Trim(EditPesquisa.Text) + '%';
  DataModule1.FDQueryCardapio.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
ButtonSelecionar.visible:= false;
  with DataModule1.FDQuerycardapio do
  begin
    Close;
    SQL.Text := 'SELECT * from cardapio';
    Open;
  end;

  begin
  with DataModule1.FDQueryatendente do
  begin
    Close;
    SQL.Text := 'SELECT nome from atendente';
    Open;
  end;
end;

end;

end.
