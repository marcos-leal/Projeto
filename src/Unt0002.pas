unit Unt0002;

interface

uses
  System.SysUtils, System.Classes, Data.DBXOracle, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TDtM0002 = class(TDataModule)
    sqcORALOGIN: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    TD: TTransactionDesc;
  end;

var
  DtM0002: TDtM0002;

implementation

uses
  UntProdutor, UntDistribuidor;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
