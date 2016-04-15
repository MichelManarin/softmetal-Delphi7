unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoINI, jpeg, ExtCtrls, StdCtrls, RzButton, Mask, RzEdit,
  RzDBEdit, RzLabel, FMTBcd, DB, SqlExpr, Provider, DBClient, RzPanel;

type
  TFrmLogin = class(TFrmObjetoINI)
    Logo: TImage;
    PANDADOS: TPanel;
    DSfuncionarios: TDataSource;
    CDSFuncionarios: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLFuncionarios: TSQLDataSet;
    PANLOGIN: TRzPanel;
    LBLUSUARIO: TRzLabel;
    LBLSENHA: TRzLabel;
    DBUSUARIO: TRzDBEdit;
    DBSENHA: TRzDBEdit;
    BtnSair: TRzButton;
    BtnLogar: TRzButton;
    SQLFuncionariosLOGIN_FUN: TStringField;
    SQLFuncionariosSENHA_FUN: TStringField;
    CDSFuncionariosLOGIN_FUN: TStringField;
    CDSFuncionariosSENHA_FUN: TStringField;
    SQLFuncionariosNIVELACESSO_FUN: TIntegerField;
    CDSFuncionariosNIVELACESSO_FUN: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLogarClick(Sender: TObject);
    procedure DBUSUARIOEnter(Sender: TObject);
    procedure DBSENHAEnter(Sender: TObject);
    procedure DBSENHAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBUSUARIOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzURLLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses UDM, UMenu, U_Splash;

{$R *.dfm}

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
//FrmLogin.Color:=rgb(27,27,27);
//PnlEfeito.Color:=rgb(27,27,27);
 Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
    //Desligando os datasets
   PANLOGIN.Enabled:=true;

   CDSFuncionarios.close;
   SQLFuncionarios.Close;
//   SQLFuncionarios.Open;
  // CDSFuncionarios.open;


//   CDSFuncionarios.Edit;

    FrmSplash.close;

end;

procedure TFrmLogin.BtnSairClick(Sender: TObject);
begin
  if (CDSFuncionariosLOGIN_FUN.AsString= '') AND  (CDSFuncionariosSENHA_FUN.AsString= '') THEN

   BEGIN
    CDSFuncionarios.Close;
    
    close;

   END

   ELSE
    CLOSE;

end;

procedure TFrmLogin.BtnLogarClick(Sender: TObject);
begin
  inherited;
If (CDSFuncionariosLOGIN_FUN.AsString = '')  or (CDSFuncionariosSENHA_FUN.AsString = '') Then
   Begin
     ShowMessage('O Atributo em branco é Obrigatório...');
     PANDADOS.Enabled:=true;
     if (DBUSUARIO.Text= '') then
      begin
           if DBUSUARIO.CanFocus then FocusControl(DBUSUARIO);
            Exit;
      end
      else
         begin
           if DBSENHA.CanFocus then FocusControl(DBSENHA);
            Exit;
        end;
   End

 else
    BEGIN

                         DM.SqlAuxiliar.Close;
                         DM.SqlAuxiliar.CommandText := 'select login_fun, nivelacesso_fun from Funcionarios where login_fun = ' + QuotedStr(DBUSUARIO.Text)+
                                                ' and funcionarios.senha_fun = ' + QuotedStr(DBSENHA.Text);
                         DM.SqlAuxiliar.Open;
                         if (dm.SqlAuxiliar.IsEmpty) then
                         begin
                            ShowMessage('Usuario ou senha Incorretos !');
                            exit;
                         end
                             else
                             
                                 Application.CreateForm(TFrmMenu,FrmMenu);
                                 FrmMenu.ShowModal;
                                 FrmMenu.Free;
                                 FrmLogin.close;
                         end;

      end;

procedure TFrmLogin.DBUSUARIOEnter(Sender: TObject);
begin
  SQLFuncionarios.Open;
  CDSFuncionarios.Open;
    inherited;


end;

procedure TFrmLogin.DBSENHAEnter(Sender: TObject);
begin
//  SQLFuncionarios.Open;
 // CDSFuncionarios.Open;
  inherited;

end;

procedure TFrmLogin.DBSENHAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_Return) then begin
    FocusControl(BtnLogar);
    BtnLogarClick(Sender);
  end;
end;

procedure TFrmLogin.DBUSUARIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_Return) then begin
    FocusControl(DBSENHA);
    BtnLogarClick(Sender);
  end;
end;

procedure TFrmLogin.RzURLLabel1Click(Sender: TObject);
begin
  inherited;
ShowMessage('Contate o Desenvolvedor !');
end;

end.
