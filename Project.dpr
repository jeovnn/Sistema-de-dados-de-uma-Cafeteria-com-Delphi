program Project;

uses
  Vcl.Forms,
  UnitInicial in '..\Sistema-de-dados-de-uma-Cafeteria-com-Delphi-b0d87e456e7b661f6be16cc4b39f023220bf99f0\UnitInicial.pas' {Form1},
  UnitConexao in '..\Sistema-de-dados-de-uma-Cafeteria-com-Delphi-b0d87e456e7b661f6be16cc4b39f023220bf99f0\UnitConexao.pas' {DataModule1: TDataModule},
  UnitCadastroCliente in '..\Sistema-de-dados-de-uma-Cafeteria-com-Delphi-b0d87e456e7b661f6be16cc4b39f023220bf99f0\UnitCadastroCliente.pas' {Form2},
  UnitCadastroPedido in '..\Sistema-de-dados-de-uma-Cafeteria-com-Delphi-b0d87e456e7b661f6be16cc4b39f023220bf99f0\UnitCadastroPedido.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
