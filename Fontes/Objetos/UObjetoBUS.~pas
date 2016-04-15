unit UObjetoBUS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoINI, ExtCtrls, RzPanel, Grids, DBGrids, RzDBGrid,
  RzRadGrp, RzButton, ComCtrls;

type
  TFrmObjetoBUS = class(TFrmObjetoINI)
    PANTITULO: TRzPanel;
    PnlCenter: TRzPanel;
    PANDADOS: TPanel;
    Grid: TRzDBGrid;
    RGordenar: TRzRadioGroup;
    RGsituacao: TRzRadioGroup;
    RGfiltra: TRzCheckGroup;
    BtnBuscar: TRzBitBtn;
    BtnImprimir: TRzBitBtn;
    PnlBotoes: TRzPanel;
    BtnSair: TRzBitBtn;
    BARRASTATUS: TStatusBar;
    procedure BtnSairClick(Sender: TObject);
    procedure tempoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     SqlInicial, SqlFiltro, SqlOrdem : String;
      QuemChama : String;
  end;

var
  FrmObjetoBUS: TFrmObjetoBUS;

implementation

{$R *.dfm}

procedure TFrmObjetoBUS.BtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TFrmObjetoBUS.tempoTimer(Sender: TObject);
begin
  inherited;
BARRASTATUS.Panels [0].Text := 'Data :' + ' '+datetostr(date);
BARRASTATUS.Panels [1].Text := 'Hora :' + TimeToStr(time);
end;

end.
