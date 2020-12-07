unit UntListaProdPreco;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
    Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit,
    Vcl.ExtCtrls;

type
    TFrmListaProdPreco = class(TForm)
        Image1: TImage;
        Panel2: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        CrrncyEdtCODIGO: TCurrencyEdit;
        EdtNOME: TEdit;
        BttnLOCALIZAR: TButton;
        BttnVERIFICAR: TButton;
        Image2: TImage;
        DBGrid1: TDBGrid;
        procedure BttnLOCALIZARClick(Sender: TObject);
    procedure BttnVERIFICARClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmListaProdPreco: TFrmListaProdPreco;

implementation

uses
  UntProdutoPreco;

{$R *.dfm}

procedure TFrmListaProdPreco.BttnLOCALIZARClick(Sender: TObject);
begin

    FrmProdutoPreco.ClntDtStPRODUTO.Close;

    with FrmProdutoPreco.SQLQryPRODUTO do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CODPROD, NOME, PRECO, DTCADASTRO, DTULTALTER');
        SQL.Add('  FROM PRODUTO');
        SQL.Add(' WHERE CODPROD <> 0 ');

        if CrrncyEdtCODIGO.Value <> 0 then
        begin
            SQL.Add('   AND CODPROD = :CODPROD ');
            Params.ParamByName('CODPROD').AsBCD := CrrncyEdtCODIGO.Value;
        end;

        if EdtNOME.Text <> '' then
        begin
            SQL.Add('  AND NOME LIKE :NOME');
            Params.ParamByName('NOME').AsString := EdtNOME.Text + '%';
        end;

    end;

    FrmProdutoPreco.ClntDtStPRODUTO.Open;

end;

procedure TFrmListaProdPreco.BttnVERIFICARClick(Sender: TObject);
begin
    if FrmProdutoPreco.ClntDtStPRODUTO.RecordCount = 0 then
        Abort;

    FrmProdutoPreco.BttnALTERARClick(Sender);
    Close;
end;

procedure TFrmListaProdPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmListaProdPreco.FormCreate(Sender: TObject);
begin
    //Form no centro da tela
    Left := (GetSystemMetrics(SM_CXSCREEN) - Width - 2) div 2;
    Top := (GetSystemMetrics(SM_CYSCREEN) - Height - 30) div 2;

    //carregar as imagens de layout em (C:\Projeto\src\Interface\cabecalho.bmp )
    try
        Image1.Picture.LoadFromFile('C:\Projeto\src\Interface\cabecalho.bmp');
        Image2.Picture.LoadFromFile('C:\Projeto\src\Interface\rodape.bmp');
    except
        Application.MessageBox('Plataforma de interface desatualizada', 'Aviso!', MB_ICONEXCLAMATION + MB_OK);
    end;

end;

end.

