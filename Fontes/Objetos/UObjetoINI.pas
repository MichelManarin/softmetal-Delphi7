unit UObjetoINI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel,Inifiles, Menus;

type
  TFrmObjetoINI = class(TForm)
    tempo: TTimer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
     caminho:string;
  end;

var
  FrmObjetoINI: TFrmObjetoINI;
  ArquivoIni : TIniFile;

implementation

{$R *.dfm}

procedure TFrmObjetoINI.FormCreate(Sender: TObject);
begin

caminho:= ExtractFilePath(Application.ExeName) + 'configura.ini';
//ShowMessage(caminho);
ArquivoIni:=TIniFile.Create(caminho);
 ArquivoIni.Free;

  Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;



end;

end.
