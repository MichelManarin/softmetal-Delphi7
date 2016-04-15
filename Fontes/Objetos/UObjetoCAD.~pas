unit UObjetoCAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoINI, ExtCtrls, RzPanel, RzButton, Menus, StdCtrls, Mask,
  RzEdit, RzLabel, ComCtrls,Inifiles;

type
  TFrmObjetoCAD = class(TFrmObjetoINI)
    PANBOTOES: TPanel;
    PANTITULO: TRzPanel;
    BtnNovo: TRzButton;
    PANDADOS: TRzPanel;
    BtnGravar: TRzButton;
    BtnCancelar: TRzButton;
    BtnBuscar: TRzButton;
    BtnStatus: TRzButton;
    BtnSair: TRzButton;
    EdtBusca: TRzEdit;
    LBLCOD: TRzLabel;
    BARRASTATUS: TStatusBar;
    procedure BtnSairClick(Sender: TObject);
    procedure HabilitaEdicao;
    procedure DesabilitaEdicao;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtBuscaEnter(Sender: TObject);
    procedure EdtBuscaExit(Sender: TObject);
    procedure tempoTimer(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
      end;

var
  FrmObjetoCAD: TFrmObjetoCAD;

implementation

{$R *.dfm}

procedure TFrmObjetoCAD.BtnSairClick(Sender: TObject);
begin
close;
end;

procedure TFrmObjetoCAD.HabilitaEdicao;
begin
 BtnNovo.Enabled  := False;
 BtnCancelar.Enabled := True;
 BtnGravar.Enabled   := True;
 BtnBuscar.Enabled   := False;
 BtnStatus.Enabled   := False;
 BtnSair.Enabled     := False;
 PANDADOS.Enabled   := True;
 EdtBusca.Enabled    := False;
end;

procedure TFrmObjetoCAD.DesabilitaEdicao;
begin
 BtnNovo.Enabled  := True;
 BtnCancelar.Enabled := False;
 BtnGravar.Enabled   := False;
 BtnBuscar.Enabled   := True;
 BtnStatus.Enabled   := True;
 BtnSair.Enabled     := True;
 EdtBusca.Enabled    := True;
 FocusControl(EdtBusca);

end;

procedure TFrmObjetoCAD.BtnNovoClick(Sender: TObject);
begin

HabilitaEdicao;
end;

procedure TFrmObjetoCAD.BtnCancelarClick(Sender: TObject);
 begin
  DesabilitaEdicao;
 end;

procedure TFrmObjetoCAD.BtnGravarClick(Sender: TObject);
begin
DesabilitaEdicao;
end;

procedure TFrmObjetoCAD.EdtBuscaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if NOT (key IN ['0'..'9',#8, #13]) then
key := #0;
end;

procedure TFrmObjetoCAD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
If (BtnSair.Enabled = False) Then
   Begin
     Action := CaNone;
   End;
end;


procedure TFrmObjetoCAD.EdtBuscaEnter(Sender: TObject);
begin
EdtBusca.Color:= clSilver;
end;

procedure TFrmObjetoCAD.EdtBuscaExit(Sender: TObject);
begin
EdtBusca.Color:=clWindow;
end;

procedure TFrmObjetoCAD.tempoTimer(Sender: TObject);
begin
  inherited;
BARRASTATUS.Panels [0].Text := 'Data:' + ' '+datetostr(date);
BARRASTATUS.Panels [1].Text := 'Hora:' + ' '+TimeToStr(time);
end;

end.
