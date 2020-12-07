unit UntListaProdutor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
    Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit,
    Vcl.Grids, Vcl.DBGrids;

type
    TFrmListaProdutor = class(TForm)
        Image1: TImage;
        Panel1: TPanel;
        Image2: TImage;
        DBGrid1: TDBGrid;
        Panel2: TPanel;
        CrrncyEdtCODIGO: TCurrencyEdit;
        Label4: TLabel;
        Label5: TLabel;
        EdtNOME: TEdit;
        EdtCPFCNPJ: TEdit;
        Label6: TLabel;
        BttnLOCALIZAR: TButton;
        BttnVERIFICAR: TButton;
    Panel3: TPanel;
    BttnLIMITECRED: TButton;
        procedure BttnLOCALIZARClick(Sender: TObject);
        procedure BttnVERIFICARClick(Sender: TObject);
        procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BttnLIMITECREDClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmListaProdutor: TFrmListaProdutor;

implementation

uses
    Unt0002, UntProdutor, UntPrincipal, UntLimiteCreditoProdutor;

{$R *.dfm}

procedure TFrmListaProdutor.BttnLOCALIZARClick(Sender: TObject);
begin

    FrmProdutor.ClntDtStPRODUTOR.Close;

    with FrmProdutor.SQLQryPRODUTOR do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CODPRODUTOR, CPFCNPJ, NOME, DTCADASTRO, DTULTALTER');
        SQL.Add('  FROM PRODUTOR');
        SQL.Add(' WHERE CODPRODUTOR <> 0 ');

        if CrrncyEdtCODIGO.Value <> 0 then
        begin
            SQL.Add('   AND CODPRODUTOR = :CODPRODUTOR ');
            Params.ParamByName('CODPRODUTOR').AsBCD := CrrncyEdtCODIGO.Value;
        end;

        if EdtNOME.Text <> '' then
        begin
            SQL.Add('  AND NOME LIKE :NOME');
            Params.ParamByName('NOME').AsString := EdtNOME.Text + '%';
        end;

        if EdtCPFCNPJ.Text <> '' then
        begin
            SQL.Add('  AND REPLACE(REPLACE(REPLACE(CPFCNPJ,''.'',''''),''/'',''''),''-'','''') = :CPFCNPJ');
            Params.ParamByName('CPFCNPJ').AsString := FrmPrincipal.RemoveChars(EdtCPFCNPJ.Text, './-');
        end;

        SQL.Add(' ORDER BY NOME');

    end;

    FrmProdutor.ClntDtStPRODUTOR.Open;

end;

procedure TFrmListaProdutor.BttnVERIFICARClick(Sender: TObject);
begin

    if FrmProdutor.ClntDtStPRODUTOR.RecordCount = 0 then
        Abort;

    FrmProdutor.BttnALTERARClick(Sender);
    Close;

end;

procedure TFrmListaProdutor.BttnLIMITECREDClick(Sender: TObject);
begin

    if FrmProdutor.ClntDtStPRODUTOR.RecordCount = 0 then
        Abort;

    try
        FrmLimiteCreditoProdutor := TFrmLimiteCreditoProdutor.Create(Application);
        FrmLimiteCreditoProdutor.Caption := 'Cadastro de limite de cr�dito';
        FrmLimiteCreditoProdutor.ShowModal;
    finally
        FrmLimiteCreditoProdutor.Free;
    end;

end;

procedure TFrmListaProdutor.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    //N�o permite excluir registro da grid
    if (Shift = [ssCtrl]) and (Key = 46) then
        Key := 0;
end;

procedure TFrmListaProdutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmListaProdutor.FormCreate(Sender: TObject);
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

