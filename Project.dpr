program Project;

uses
  Vcl.Forms,
  UnitInicial in 'UnitInicial.pas' {Form1},
  UnitConexao in 'UnitConexao.pas' {DataModule1: TDataModule},
  UnitCadastroCliente in 'UnitCadastroCliente.pas' {Form2},
  UnitCadastroPedido in 'UnitCadastroPedido.pas' {Form3},
  UnitRelatorio in 'UnitRelatorio.pas' {Form4},
  Unit2Heranca in 'Unit2Heranca.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
