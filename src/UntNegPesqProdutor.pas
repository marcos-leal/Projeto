unit UntNegPesqProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.FMTBcd, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider;

type
  TFrmNegPesqProdutor = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EdtNOME: TEdit;
    BttnLOCALIZAR: TButton;
    EdtCNPJ: TEdit;
    DBGrid1: TDBGrid;
    DtStPrvdrPRODUTOR: TDataSetProvider;
    ClntDtStPRODUTOR: TClientDataSet;
    ClntDtStPRODUTORCODPRODUTOR: TFMTBCDField;
    ClntDtStPRODUTORCPFCNPJ: TWideStringField;
    ClntDtStPRODUTORNOME: TWideStringField;
    ClntDtStPRODUTORDTCADASTRO: TSQLTimeStampField;
    ClntDtStPRODUTORDTULTALTER: TSQLTimeStampField;
    SQLQryPRODUTOR: TSQLQuery;
    DtSrcPRODUTOR: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BttnLOCALIZARClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNegPesqProdutor: TFrmNegPesqProdutor;

implementation

uses
  Unt0002, UntPrincipal, UntNegociacao;

{$R *.dfm}

procedure TFrmNegPesqProdutor.BttnLOCALIZARClick(Sender: TObject);
begin
    ClntDtStPRODUTOR.Close;

    with SQLQryPRODUTOR do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CODPRODUTOR, CPFCNPJ, NOME, DTCADASTRO, DTULTALTER  ');
        SQL.Add('  FROM PRODUTOR');
        SQL.Add(' WHERE CODPRODUTOR <> 0 ');

        if EdtNOME.Text <> '' then
        begin
            SQL.Add('  AND NOME LIKE :NOME');
            Params.ParamByName('NOME').AsString := EdtNOME.Text + '%';
        end;

        if EdtCNPJ.Text <> '' then
        begin
            SQL.Add('  AND REPLACE(REPLACE(REPLACE(CPFCNPJ,''.'',''''),''/'',''''),''-'','''') = :CPFCNPJ');
            Params.ParamByName('CPFCNPJ').AsString := FrmPrincipal.RemoveChars(EdtCNPJ.Text, './-');
        end;

        SQL.Add(' ORDER BY NOME');

    end;

    ClntDtStPRODUTOR.Open;
end;

procedure TFrmNegPesqProdutor.DBGrid1DblClick(Sender: TObject);
begin

    if ClntDtStPRODUTOR.RecordCount = 0 then
        Abort;

    FrmNegociacao.CrrncyEdtCOD_PRODUTOR.Value := ClntDtStPRODUTORCODPRODUTOR.AsCurrency;
    FrmNegociacao.EdtNOME_PRODUTOR.Text := ClntDtStPRODUTORNOME.AsString;
    FrmNegociacao.EdtCPFCNPJ_PRODUTOR.Text := ClntDtStPRODUTORCPFCNPJ.AsString;

    //Limpar os dados do distribuidor
    if (FrmNegociacao.CrrncyEdtCOD_DISTRIB.Value <> 0) and (FrmNegociacao.EdtNOME_DISTRIB.Text <> '') then
    begin
        FrmNegociacao.CrrncyEdtCOD_DISTRIB.Value := 0;
        FrmNegociacao.EdtNOME_DISTRIB.Text := '';
        FrmNegociacao.EdtCNPJ_DISTRIB.Text := '';
        FrmNegociacao.CrrncyEdtLIMITECRED.Value := 0;
    end;

    Close;
end;

procedure TFrmNegPesqProdutor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (ssCtrl in Shift) and (Key = VK_DELETE) then
        Key := 0;
end;

procedure TFrmNegPesqProdutor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmNegPesqProdutor.FormCreate(Sender: TObject);
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
