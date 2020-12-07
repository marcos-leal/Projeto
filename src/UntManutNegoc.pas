unit UntManutNegoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit, StrUtils, frxClass, frxDBSet;

type
  TFrmManutNegoc = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    BttnLOCALIZAR: TButton;
    CrrncyEdtNUMNEGOC: TCurrencyEdit;
    RdGrpSTATUS: TRadioGroup;
    DBGrid1: TDBGrid;
    SQLQryLISTARNEGOC: TSQLQuery;
    DtStPrvdrLISTARNEGOC: TDataSetProvider;
    DtSrcLISTARNEGOC: TDataSource;
    ClntDtStLISTARNEGOC: TClientDataSet;
    ClntDtStLISTARNEGOCNUMNEGOC: TFMTBCDField;
    ClntDtStLISTARNEGOCCODPRODUTOR: TFMTBCDField;
    ClntDtStLISTARNEGOCPRODUTOR: TWideStringField;
    ClntDtStLISTARNEGOCCODDISTRIB: TFMTBCDField;
    ClntDtStLISTARNEGOCDISTRIBUIDOR: TWideStringField;
    ClntDtStLISTARNEGOCTOTAL: TFMTBCDField;
    ClntDtStLISTARNEGOCSTATUS: TWideStringField;
    Panel1: TPanel;
    Image2: TImage;
    BttnIMPRIMIR: TButton;
    Label1: TLabel;
    CrrncyEdtCODPRODUTOR: TCurrencyEdit;
    Label2: TLabel;
    EdtNOMEPRODUTOR: TEdit;
    Label5: TLabel;
    CrrncyEdtCODDISTRIB: TCurrencyEdit;
    Label3: TLabel;
    Label6: TLabel;
    EdtNOMEDISTRIB: TEdit;
    BttnFECHAR: TButton;
    Label4: TLabel;
    frxRprtREL_NEGOC: TfrxReport;
    frxDBDtstREL_NEGOC: TfrxDBDataset;
    ClntDtStLISTARNEGOCDTEMISSAO: TSQLTimeStampField;
    ClntDtStLISTARNEGOCDTAPROVACAO: TSQLTimeStampField;
    ClntDtStLISTARNEGOCDTCONCLUSAO: TSQLTimeStampField;
    ClntDtStLISTARNEGOCDTCANCEL: TSQLTimeStampField;
    ClntDtStLISTARNEGOCDATA: TSQLTimeStampField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BttnLOCALIZARClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BttnIMPRIMIRClick(Sender: TObject);
    procedure BttnFECHARClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutNegoc: TFrmManutNegoc;

implementation

uses
  Unt0002, UntPrincipal, UntManuNegocAux;

{$R *.dfm}

procedure TFrmManutNegoc.BttnFECHARClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmManutNegoc.BttnIMPRIMIRClick(Sender: TObject);
begin

    frxRprtREL_NEGOC.PrepareReport;
    frxRprtREL_NEGOC.ShowPreparedReport;

end;

procedure TFrmManutNegoc.BttnLOCALIZARClick(Sender: TObject);
begin

    ClntDtStLISTARNEGOC.Close;

    with SQLQryLISTARNEGOC do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT N.NUMNEGOC, N.CODPRODUTOR, P.NOME AS PRODUTOR, N.CODDISTRIB, D.NOME AS DISTRIBUIDOR, SUM(N.PRECO * N.QT) AS TOTAL, ');
        SQL.Add('       N.DTEMISSAO, N.DTAPROVACAO, N.DTCONCLUSAO, N.DTCANCEL,');
        SQL.Add('       DECODE(N.STATUS,''P'', ''Pendente'', ''A'',''Aprovado'',''S'',''Concluido'',''C'',''Cancelado'') AS STATUS,    ');
        SQL.Add('       DECODE(N.STATUS,''P'',N.DTEMISSAO, ''A'',N.DTAPROVACAO,''S'',N.DTCONCLUSAO,''C'',N.DTCANCEL) AS DATA');
        SQL.Add('  FROM NEGOCIACAO N, PRODUTOR P, DISTRIBUIDOR D');
        SQL.Add(' WHERE N.CODPRODUTOR = P.CODPRODUTOR');
        SQL.Add('   AND N.CODDISTRIB = D.CODDISTRIB  ');

        if CrrncyEdtNUMNEGOC.Value <> 0 then
        begin
            SQL.Add('   AND N.NUMNEGOC = :NUMNEGOC ');
            Params.ParamByName('NUMNEGOC').AsBCD := CrrncyEdtNUMNEGOC.Value;
        end;

        if CrrncyEdtCODPRODUTOR.Value <> 0 then
        begin
            SQL.Add('   AND N.CODPRODUTOR = :CODPRODUTOR ');
            Params.ParamByName('CODPRODUTOR').AsBCD := CrrncyEdtCODPRODUTOR.Value;
        end;

        if EdtNOMEPRODUTOR.Text <> '' then
        begin
            SQL.Add('  AND P.NOME LIKE :NOME');
            Params.ParamByName('NOME').AsString := EdtNOMEPRODUTOR.Text + '%';
        end;

        if CrrncyEdtCODDISTRIB.Value <> 0 then
        begin
            SQL.Add('   AND N.CODDISTRIB = :CODDISTRIB ');
            Params.ParamByName('CODDISTRIB').AsBCD := CrrncyEdtCODDISTRIB.Value;
        end;

        if EdtNOMEDISTRIB.Text <> '' then
        begin
            SQL.Add('  AND D.NOME LIKE :NOME');
            Params.ParamByName('NOME').AsString := EdtNOMEDISTRIB.Text + '%';
        end;

        case RdGrpSTATUS.ItemIndex of
            0:
                ;

            1:
                SQL.Add('   AND N.STATUS = ''P'' ');

            2:
                SQL.Add('   AND N.STATUS = ''A'' ');

            3:
                SQL.Add('   AND N.STATUS = ''S'' ');

            4:
                SQL.Add('   AND N.STATUS = ''C'' ');

        end;

        SQL.Add(' GROUP BY N.NUMNEGOC, N.CODPRODUTOR, P.NOME, N.CODDISTRIB, D.NOME, N.STATUS,   ');
        SQL.Add('       N.DTEMISSAO, N.DTAPROVACAO, N.DTCONCLUSAO, N.DTCANCEL');
        SQL.Add(' ORDER BY N.NUMNEGOC, N.CODPRODUTOR, N.CODDISTRIB, N.STATUS   ');

    end;

    ClntDtStLISTARNEGOC.Open;

end;

procedure TFrmManutNegoc.DBGrid1DblClick(Sender: TObject);
begin

    if ClntDtStLISTARNEGOC.IsEmpty then
       Abort;

    try
        FrmManuNegocAux := TFrmManuNegocAux.Create(Application);
        FrmManuNegocAux.Caption := Caption;
        FrmManuNegocAux.ShowModal;
    finally
        FrmManuNegocAux.Free;
    end;

end;

procedure TFrmManutNegoc.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

   if DataCol = 0 then
    begin
        case AnsiIndexStr(ClntDtStLISTARNEGOCSTATUS.AsString, ['Pendente', 'Aprovado', 'Concluido', 'Cancelado']) of
            0:
                TDBGrid(Sender).Canvas.Font.Color := $0080511C;
            1:
                TDBGrid(Sender).Canvas.Font.Color := clBlue;
            2:
                TDBGrid(Sender).Canvas.Font.Color := clGreen;
            3:
                TDBGrid(Sender).Canvas.Font.Color := clRed;

        end;
    end;

    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);

end;

procedure TFrmManutNegoc.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //N�o permite excluir registro da grid
    if (Shift = [ssCtrl]) and (Key = 46) then
        Key := 0;
end;

procedure TFrmManutNegoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmManutNegoc.FormCreate(Sender: TObject);
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
