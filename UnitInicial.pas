unit UnitInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,UnitConexao, Vcl.Menus, Vcl.StdCtrls,unitcadastrocliente,unitcadastropedido,
  Vcl.Imaging.jpeg;

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
    Label2: TLabel;
    ButtonSelecionar: TButton;
    GroupBox1: TGroupBox;
    Image1: TImage;
    procedure ButtonSelecionarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridAtendentesCellClick(Column: TColumn);
    procedure Cadastrar2Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
dbgridatendentes.visible:= false;
buttonselecionar.visible:= false;
dbgridatendentes.visible:= false;
image1.visible:= true;
end;

procedure TForm1.ButtonSelecionarClick(Sender: TObject);
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


procedure TForm1.FormShow(Sender: TObject);
begin
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
