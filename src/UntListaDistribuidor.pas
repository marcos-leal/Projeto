unit UntListaDistribuidor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
    Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit,
    Vcl.ExtCtrls;

type
    TFrmListaDistribuidor = class(TForm)
        Image1: TImage;
        Image2: TImage;
        Panel2: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        CrrncyEdtCODIGO: TCurrencyEdit;
        EdtNOME: TEdit;
        EdtCNPJ: TEdit;
        BttnLOCALIZAR: TButton;
        BttnVERIFICAR: TButton;
        DBGrid1: TDBGrid;
        procedure BttnLOCALIZARClick(Sender: TObject);
        procedure BttnVERIFICARClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmListaDistribuidor: TFrmListaDistribuidor;

implementation

uses
    UntPrincipal, Unt0002, UntDistribuidor;

{$R *.dfm}

procedure TFrmListaDistribuidor.BttnLOCALIZARClick(Sender: TObject);
begin

    FrmDistribuidor.ClntDtStDISTRIB.Close;

    with FrmDistribuidor.SQLQryDISTRIB do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CODDISTRIB, CNPJ, NOME, DTCADASTRO, DTULTALTER');
        SQL.Add('  FROM DISTRIBUIDOR');
        SQL.Add(' WHERE CODDISTRIB <> 0 ');

        if CrrncyEdtCODIGO.Value <> 0 then
        begin
            SQL.Add('   AND CODDISTRIB = :CODDISTRIB ');
            Params.ParamByName('CODDISTRIB').AsBCD := CrrncyEdtCODIGO.Value;
        end;

        if EdtNOME.Text <> '' then
        begin
            SQL.Add('  AND NOME LIKE :NOME');
            Params.ParamByName('NOME').AsString := EdtNOME.Text + '%';
        end;

        if EdtCNPJ.Text <> '' then
        begin
            SQL.Add('  AND REPLACE(REPLACE(REPLACE(CNPJ,''.'',''''),''/'',''''),''-'','''') = :CNPJ');
            Params.ParamByName('CNPJ').AsString := FrmPrincipal.RemoveChars(EdtCNPJ.Text, './-');
        end;

        SQL.Add(' ORDER BY NOME');

    end;

    FrmDistribuidor.ClntDtStDISTRIB.Open;

end;

procedure TFrmListaDistribuidor.BttnVERIFICARClick(Sender: TObject);
begin

    if FrmDistribuidor.ClntDtStDISTRIB.RecordCount = 0 then
        Abort;

    FrmDistribuidor.BttnALTERARClick(Sender);
    Close;

end;

procedure TFrmListaDistribuidor.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    //Não permitr excluir o registro pela grid
    if (Shift = [ssCtrl]) and (Key = 46) then
        Key := 0;
end;

procedure TFrmListaDistribuidor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmListaDistribuidor.FormCreate(Sender: TObject);
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

