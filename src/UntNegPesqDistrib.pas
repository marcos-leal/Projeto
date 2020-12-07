unit UntNegPesqDistrib;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmNegPesqDistrib = class(TForm)
    Image2: TImage;
    Image1: TImage;
    Panel1: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EdtNOME: TEdit;
    BttnLOCALIZAR: TButton;
    EdtCNPJ: TEdit;
    DBGrid1: TDBGrid;
    DtSrcDISTRIB: TDataSource;
    ClntDtStDISTRIB: TClientDataSet;
    ClntDtStDISTRIBCODDISTRIB: TFMTBCDField;
    ClntDtStDISTRIBCNPJ: TWideStringField;
    ClntDtStDISTRIBNOME: TWideStringField;
    ClntDtStDISTRIBDTCADASTRO: TSQLTimeStampField;
    ClntDtStDISTRIBDTULTALTER: TSQLTimeStampField;
    DtStPrvdrDISTRIB: TDataSetProvider;
    SQLQryDISTRIB: TSQLQuery;
    ClntDtStDISTRIBLIMITECRED: TFMTBCDField;
    procedure BttnLOCALIZARClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNegPesqDistrib: TFrmNegPesqDistrib;

implementation

uses
  Unt0002, UntPrincipal, UntNegociacao;

{$R *.dfm}

procedure TFrmNegPesqDistrib.BttnLOCALIZARClick(Sender: TObject);
begin

    ClntDtStDISTRIB.Close;

    with SQLQryDISTRIB do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTRIBUIDOR.CODDISTRIB, DISTRIBUIDOR.CNPJ, DISTRIBUIDOR.NOME, ');
        SQL.Add('       DISTRIBUIDOR.DTCADASTRO, DISTRIBUIDOR.DTULTALTER, LIMITECREDITO.LIMITECRED ');
        SQL.Add('  FROM DISTRIBUIDOR, LIMITECREDITO');
        SQL.Add(' WHERE DISTRIBUIDOR.CODDISTRIB = LIMITECREDITO.CODDISTRIB ');
        SQL.Add('   AND LIMITECREDITO.CODPRODUTOR = :CODPRODUTOR');
        Params.ParamByName('CODPRODUTOR').AsBCD := FrmNegociacao.CrrncyEdtCOD_PRODUTOR.Value;

        if EdtNOME.Text <> '' then
        begin
            SQL.Add('  AND DISTRIBUIDOR.NOME LIKE :NOME');
            Params.ParamByName('NOME').AsString := EdtNOME.Text + '%';
        end;

        if EdtCNPJ.Text <> '' then
        begin
            SQL.Add('  AND REPLACE(REPLACE(REPLACE(DISTRIBUIDOR.CNPJ,''.'',''''),''/'',''''),''-'','''') = :CNPJ');
            Params.ParamByName('CNPJ').AsString := FrmPrincipal.RemoveChars(EdtCNPJ.Text, './-');
        end;

        SQL.Add(' ORDER BY NOME');

    end;

    ClntDtStDISTRIB.Open;

end;

procedure TFrmNegPesqDistrib.DBGrid1DblClick(Sender: TObject);
begin
    if ClntDtStDISTRIB.RecordCount = 0 then
        Abort;

    FrmNegociacao.CrrncyEdtCOD_DISTRIB.Value := ClntDtStDISTRIBCODDISTRIB.AsCurrency;

    FrmNegociacao.CrrncyEdtCOD_DISTRIBExit(Sender);

    //FrmNegociacao.EdtNOME_DISTRIB.Text := ClntDtStDISTRIBNOME.AsString;
    //FrmNegociacao.EdtCNPJ_DISTRIB.Text := ClntDtStDISTRIBCNPJ.AsString;
    //FrmNegociacao.CrrncyEdtLIMITECRED.Value := ClntDtStDISTRIBLIMITECRED.AsCurrency;

    Close;
end;

procedure TFrmNegPesqDistrib.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (ssCtrl in Shift) and (Key = VK_DELETE) then
        Key := 0;
end;

procedure TFrmNegPesqDistrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmNegPesqDistrib.FormCreate(Sender: TObject);
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


