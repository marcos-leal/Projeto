unit UntPrincipal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
    Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
    TFrmPrincipal = class(TForm)
        Image1: TImage;
        Image2: TImage;
        Panel1: TPanel;
        SQLQryAUX: TSQLQuery;
        SQLQryAUX1: TSQLQuery;
        SQLQryAUXDTHOJE: TSQLTimeStampField;
        GroupBox1: TGroupBox;
        BttnPRODUTOR: TButton;
        BttnDISTRIBUIDOR: TButton;
        BttnPRODUTO_PRECO: TButton;
        GroupBox2: TGroupBox;
        BttnNEGOCIACAO: TButton;
        BttnMANTNEGOC: TButton;
        BttnFECHAR: TButton;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure BttnPRODUTORClick(Sender: TObject);
        procedure BttnDISTRIBUIDORClick(Sender: TObject);
        procedure BttnPRODUTO_PRECOClick(Sender: TObject);
        procedure BttnNEGOCIACAOClick(Sender: TObject);
        procedure BttnFECHARClick(Sender: TObject);
        procedure BttnMANTNEGOCClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }

        function RemoveChars(const Original: string; const Chars: string): string; //Remove caracters das strings
        function ValidarCpfCnpj(CPFCNPJ: string): Boolean;  //Validar quantidade de caracteres
        function FormatarCpfCnpj(CPFCNPJ: string): string; //Adicionar mascara ao campo de Cpf e Cnpj
        procedure MsgFinal();
    end;

var
    FrmPrincipal: TFrmPrincipal;

implementation

uses
    Unt0002, UntProdutor, UntDistribuidor, UntProdutoPreco, UntNegociacao,
    UntManutNegoc, UntManutecaoNegociacao;

{$R *.dfm}

procedure TFrmPrincipal.BttnDISTRIBUIDORClick(Sender: TObject);
begin

    try
        FrmDistribuidor := TFrmDistribuidor.Create(Application);
        FrmDistribuidor.Caption := 'Cadastro de distribuidor';
        FrmDistribuidor.ShowModal;
    finally
        FrmDistribuidor.Free;
    end;

end;

procedure TFrmPrincipal.BttnFECHARClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmPrincipal.BttnMANTNEGOCClick(Sender: TObject);
begin

    try
        FrmManutNegoc := TFrmManutNegoc.Create(Application);
        FrmManutNegoc.Caption := 'Manuten��o Negocia��o';
        FrmManutNegoc.ShowModal;
    finally
        FrmManutNegoc.Free;
    end;

end;

procedure TFrmPrincipal.BttnNEGOCIACAOClick(Sender: TObject);
begin

    try
        FrmNegociacao := TFrmNegociacao.Create(Application);
        FrmNegociacao.Caption := 'Negocia��o';
        FrmNegociacao.ShowModal;
    finally
        FrmNegociacao.Free;
    end;

end;

procedure TFrmPrincipal.BttnPRODUTORClick(Sender: TObject);
begin

    try
        FrmProdutor := TFrmProdutor.Create(Application);
        FrmProdutor.Caption := 'Cadastro de produtor';
        FrmProdutor.ShowModal;
    finally
        FrmProdutor.Free;
    end;

end;

procedure TFrmPrincipal.BttnPRODUTO_PRECOClick(Sender: TObject);
begin

    try
        FrmProdutoPreco := TFrmProdutoPreco.Create(Application);
        FrmProdutoPreco.Caption := 'Cadastro de produto / pre�o';
        FrmProdutoPreco.ShowModal;
    finally
        FrmProdutoPreco.Free;
    end;

end;

function TFrmPrincipal.FormatarCpfCnpj(CPFCNPJ: string): string;
var
    vsCPFCNPJ, vsCPFCNPJAUX: string;
begin

    Result := '';

    vsCPFCNPJ := RemoveChars(CPFCNPJ, './-');

    //Verifica quantidade de casas para CPF ou CNPJ
    if Length(vsCPFCNPJ) <= 11 then
    begin
        vsCPFCNPJAUX := '';
        vsCPFCNPJAUX := Copy(vsCPFCNPJ, 1, 3);
        vsCPFCNPJAUX := vsCPFCNPJAUX + '.';
        vsCPFCNPJAUX := vsCPFCNPJAUX + Copy(vsCPFCNPJ, 4, 3);
        vsCPFCNPJAUX := vsCPFCNPJAUX + '.';
        vsCPFCNPJAUX := vsCPFCNPJAUX + Copy(vsCPFCNPJ, 7, 3);
        vsCPFCNPJAUX := vsCPFCNPJAUX + '-';
        vsCPFCNPJAUX := vsCPFCNPJAUX + Copy(vsCPFCNPJ, 10, 2);
    end
    else
    begin
        vsCPFCNPJAUX := '';
        vsCPFCNPJAUX := Copy(vsCPFCNPJ, 1, 2);
        vsCPFCNPJAUX := vsCPFCNPJAUX + '.';
        vsCPFCNPJAUX := vsCPFCNPJAUX + Copy(vsCPFCNPJ, 3, 3);
        vsCPFCNPJAUX := vsCPFCNPJAUX + '.';
        vsCPFCNPJAUX := vsCPFCNPJAUX + Copy(vsCPFCNPJ, 6, 3);
        vsCPFCNPJAUX := vsCPFCNPJAUX + '/';
        vsCPFCNPJAUX := vsCPFCNPJAUX + Copy(vsCPFCNPJ, 9, 4);
        vsCPFCNPJAUX := vsCPFCNPJAUX + '-';
        vsCPFCNPJAUX := vsCPFCNPJAUX + Copy(vsCPFCNPJ, 13, 2);
    end;


    Result := vsCPFCNPJAUX;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
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

    Caption := 'Projeto � Controle de negocia��o';

    SQLQryAUX.Open;
end;

procedure TFrmPrincipal.MsgFinal;
begin
    Application.MessageBox(pchar('Finalizado com sucesso!'), pchar('Aviso'), MB_ICONINFORMATION);
end;

function TFrmPrincipal.RemoveChars(const Original, Chars: string): string;
var
    I: Integer;
begin
    Result := '';
    for I := 1 to Length(Original) do
    begin
        if Pos(Original[I], Chars) < 1 then
            Result := Result + Original[I];
    end;
end;

function TFrmPrincipal.ValidarCpfCnpj(CPFCNPJ: string): Boolean;
var
    vsCPFCNPJ: string;
begin

    Result := True;

    vsCPFCNPJ := RemoveChars(CPFCNPJ, './-');

    //Verifica quantidade de casas para CPF ou CNPJ
    if Length(vsCPFCNPJ) <= 11 then
    begin
        if Length(vsCPFCNPJ) <= 10 then
            Result := False;
    end
    else
    begin
        if Length(vsCPFCNPJ) <= 13 then
            Result := False;
    end;

end;

end.

