unit UObjetoSTAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoINI, ExtCtrls, RzPanel, Grids, DBGrids, RzDBGrid,
  RzButton, RzRadGrp;

type
  TFrmObjetoSTA = class(TFrmObjetoINI)
    PnlCenter: TRzPanel;
    PnlConteudo: TPanel;
    RGfiltra: TRzCheckGroup;
    PnlBotoes: TRzPanel;
    BtnImprimir: TRzBitBtn;
    BtnBuscar: TRzBitBtn;
    BtnSair: TRzBitBtn;
    PnlTitle: TRzPanel;
    BARRASTATUS: TRzStatusBar;
    RGsituacao: TRzRadioGroup;
    RGordenar: TRzRadioGroup;
    Grid: TRzDBGrid;
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        SqlInicial, SqlFiltro, SqlOrdem : String;
      QuemChama : String;
  end;

var
  FrmObjetoSTA: TFrmObjetoSTA;

implementation

{$R *.dfm}

procedure TFrmObjetoSTA.BtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;

end.
