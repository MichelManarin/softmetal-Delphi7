unit UConfigura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoINI, ExtCtrls, RzPanel, RzButton, RzRadGrp, Menus,
  StdCtrls, Mask, RzEdit, ComCtrls, Inifiles, RzRadChk;
type
  TFrmConfigura = class(TFrmObjetoINI)
    PnlTitle: TRzPanel;
    PnlCenter: TRzPanel;
    PnlBotoes: TPanel;
    BtnGravar: TRzButton;
    BtnSair: TRzButton;
    EdtBanco: TRzEdit;
    Label2: TLabel;
    BtnAbrirCamBD: TRzButton;
    BtnSalvarBD: TRzButton;
    StatusBar1: TStatusBar;
    OD: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnAbrirCamClick(Sender: TObject);
  private
    { Private declarations }
  public
  
     ArquivoIni : TIniFile;
     FORMULARIO : RECORD
                     CORFUNDOTITULO : String[50];
                     CORFONTETITULO : String[50];
                     TAMFONTETITULO : INTEGER;
                     TIPOFONTETITULO: String[50];
                     SOFTWARE       : String[20];
                     VERSAO         : String[10];
                     CLIENTE        : String[50];
                  END;
    { Public declarations }
  end;

var
  FrmConfigura: TFrmConfigura;

implementation

uses Math;

{$R *.dfm}

procedure TFrmConfigura.FormCreate(Sender: TObject);
var
  caminho : String;
  vl :integer;
begin


 ArquivoIni.Free;

  inherited;

end;

procedure TFrmConfigura.BtnGravarClick(Sender: TObject);
begin
  inherited;

  IF FileExists('C:\Users\adm\Desktop\TCC - SoftMetal\Metalurgica - SoftMetal\configura.ini')  then
 begin
  ArquivoIni := TIniFile.Create('C:\Users\adm\Documents\SOFTMETAL - Alterações\Metalurgica - SoftMetal\configura.ini');


 ArquivoIni.Free;

 end;
end;

procedure TFrmConfigura.BtnAbrirCamClick(Sender: TObject);
begin
  inherited;
OD.Execute;

end;

end.
