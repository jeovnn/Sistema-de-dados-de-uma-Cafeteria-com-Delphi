unit UnitRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB,unitconexao;

type
  TForm4 = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    DataSource1: TDataSource;
    RLLabelPedido: TRLLabel;
    RLBand3: TRLBand;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText1: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

end.
