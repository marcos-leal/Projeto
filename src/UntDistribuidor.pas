unit UntDistribuidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr;

type
  TFrmDistribuidor = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    GroupBox1: TGroupBox;
    BttnNOVO: TButton;
    BttnLISTARPRODUTOR: TButton;
    BttnALTERAR: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox3: TGroupBox;
    BttnFINALIZAR: TButton;
    BttnCANCELAR: TButton;
    BttnFECHAR: TButton;
    SQLQryDISTRIB: TSQLQuery;
    DtStPrvdrDISTRIB: TDataSetProvider;
    ClntDtStDISTRIB: TClientDataSet;
    DtSrcDISTRIB: TDataSource;
    ClntDtStDISTRIBCODDISTRIB: TFMTBCDField;
    ClntDtStDISTRIBCNPJ: TWideStringField;
    ClntDtStDISTRIBNOME: TWideStringField;
    ClntDtStDISTRIBDTCADASTRO: TSQLTimeStampField;
    ClntDtStDISTRIBDTULTALTER: TSQLTimeStampField;
    SQLQryAUX: TSQLQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DtSrcDISTRIBStateChange(Sender: TObject);
    procedure BttnNOVOClick(Sender: TObject);
    procedure BttnALTERARClick(Sender: TObject);
    procedure BttnFINALIZARClick(Sender: TObject);
    procedure BttnLISTARPRODUTORClick(Sender: TObject);
    procedure ClntDtStDISTRIBAfterPost(DataSet: TDataSet);
    procedure BttnCANCELARClick(Sender: TObject);
    procedure BttnFECHARClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDistribuidor: TFrmDistribuidor;

implementation

uses
  Unt0002, UntPrincipal, UntListaDistribuidor;

{$R *.dfm}

procedure TFrmDistribuidor.BttnALTERARClick(Sender: TObject);
begin

    ClntDtStDISTRIB.Edit;
    ClntDtStDISTRIBDTULTALTER.AsString := FrmPrincipal.SQLQryAUX.FieldByName('DTHOJE').AsString;

end;

procedure TFrmDistribuidor.BttnCANCELARClick(Sender: TObject);
begin

    //Varificar se o componente esta em inser��o ou edi��o
    if not (ClntDtStDISTRIB.State in [DsInsert, DsEdit]) then
        Abort;


    if Application.MessageBox(pchar('Confirma cancelamento?'), pchar('Aviso!'), MB_ICONQUESTION + MB_YESNO + + MB_DEFBUTTON2) = ID_YES then
        ClntDtStDISTRIB.CancelUpdates;

    ClntDtStDISTRIB.Close;
    with SQLQryDISTRIB do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CODDISTRIB, CNPJ, NOME, DTCADASTRO, DTULTALTER');
        SQL.Add('  FROM DISTRIBUIDOR');
        SQL.Add(' WHERE CODDISTRIB = 0 ');
    end;
    ClntDtStDISTRIB.Open;


end;

procedure TFrmDistribuidor.BttnFECHARClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmDistribuidor.BttnFINALIZARClick(Sender: TObject);
begin

    //Valida��es
    if DBEdit2.Field.Text = '' then
    begin
        Application.MessageBox(pchar('Por favor, preencha o campo Distribuidor!'), pchar('Aviso!'), MB_ICONEXCLAMATION);
        Abort;
    end;

    if DBEdit3.Field.Text = '' then
    begin
        Application.MessageBox(pchar('Por favor, preencha o campo CNPJ!'), pchar('Aviso!'), MB_ICONEXCLAMATION);
        Abort;
    end
    else
    begin
        if FrmPrincipal.ValidarCpfCnpj(DBEdit3.Field.Text) = False then
        begin
            Application.MessageBox(pchar('Campo CNPJ Inv�lido!'), pchar('Aviso!'), MB_ICONEXCLAMATION);
            Abort;
        end;

        with SQLQryAUX do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT COUNT(*) AS QT, CODDISTRIB ||'' - ''|| NOME AS DISTRIBUIDOR ');
            SQL.Add('  FROM DISTRIBUIDOR');
            SQL.Add(' WHERE REPLACE(REPLACE(REPLACE(CNPJ,''.'',''''),''/'',''''),''-'','''') = :CNPJ');
            SQL.Add(' GROUP BY CODDISTRIB, NOME');
            Params.ParamByName('CNPJ').AsString := FrmPrincipal.RemoveChars(DBEdit3.Field.Text, './-');
            Open;
        end;

        if SQLQryAUX.FieldByName('QT').AsCurrency <> 0 then
        begin
            Application.MessageBox(pchar('CNPJ j� Cadastrado.' +  #13#10 +'Produtor: ' + SQLQryAUX.FieldByName('DISTRIBUIDOR').AsString +'.'), pchar('Aviso!'), MB_ICONEXCLAMATION);
            Abort;
        end;

    end;


    ClntDtStDISTRIB.Post;

    //Limpar os campos
    ClntDtStDISTRIB.Close;
    with SQLQryDISTRIB do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT CODDISTRIB, CNPJ, NOME, DTCADASTRO, DTULTALTER');
        SQL.Add('  FROM DISTRIBUIDOR');
        SQL.Add(' WHERE CODDISTRIB = 0 ');
    end;
    ClntDtStDISTRIB.Open;

    FrmPrincipal.MsgFinal;

end;

procedure TFrmDistribuidor.BttnLISTARPRODUTORClick(Sender: TObject);
begin
    try
        FrmListaDistribuidor := TFrmListaDistribuidor.Create(Application);
        FrmListaDistribuidor.Caption := 'Listar distribuidor';
        FrmListaDistribuidor.ShowModal;
    finally
        FrmListaDistribuidor.Free;
    end;
end;

procedure TFrmDistribuidor.BttnNOVOClick(Sender: TObject);
begin

    with FrmPrincipal.SQLQryAUX1 do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTRIBUIDOR_DFSEQ.NEXTVAL');
        SQL.Add('  FROM DUAL');
        Open;
    end;

    ClntDtStDISTRIB.Insert;
    ClntDtStDISTRIBCODDISTRIB.AsCurrency := FrmPrincipal.SQLQryAUX1.FieldByName('NEXTVAL').AsCurrency;
    ClntDtStDISTRIBDTCADASTRO.AsString := FrmPrincipal.SQLQryAUX.FieldByName('DTHOJE').AsString;

end;

procedure TFrmDistribuidor.ClntDtStDISTRIBAfterPost(DataSet: TDataSet);
begin
    //Salvar os dados no banco.
    ClntDtStDISTRIB.ApplyUpdates(-1);
end;

procedure TFrmDistribuidor.DBEdit3Exit(Sender: TObject);
begin
    ClntDtStDISTRIBCNPJ.AsString := FrmPrincipal.FormatarCpfCnpj(DBEdit3.Field.Text);
end;

procedure TFrmDistribuidor.DtSrcDISTRIBStateChange(Sender: TObject);
begin
    BttnNOVO.Enabled := (Sender as TDataSource).State in [dsBrowse];
    BttnALTERAR.Enabled := ((Sender as TDataSource).State in [dsBrowse]) and not ((Sender as TDataSource).DataSet.IsEmpty);
    BttnFINALIZAR.Enabled := (Sender as TDataSource).State in [dsEdit, dsInsert];
    BttnCANCELAR.Enabled := (Sender as TDataSource).State in [dsEdit, dsInsert];
    BttnLISTARPRODUTOR.Enabled := (Sender as TDataSource).State in [dsBrowse];
    BttnFECHAR.Enabled := (Sender as TDataSource).State in [dsBrowse];

    GroupBox2.Enabled := (Sender as TDataSource).State in [dsEdit, dsInsert];
end;

procedure TFrmDistribuidor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmDistribuidor.FormCreate(Sender: TObject);
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

    ClntDtStDISTRIB.Open;
    FrmPrincipal.SQLQryAUX.Open;

end;

end.
