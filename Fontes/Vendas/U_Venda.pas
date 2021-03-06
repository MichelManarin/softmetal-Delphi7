unit U_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  FMTBcd, DB, DBClient, Provider, SqlExpr,IniFiles, jPEG, Buttons, RzPanel,
  RzButton, RzEdit, RzDBEdit, RzLabel;

type
  TFrmVenda = class(TForm)
    PANGRID: TPanel;
    Panel3: TPanel;
    PanDados: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Bevel2: TBevel;
    DbProduto: TDBImage;
    SQLNF: TSQLDataSet;
    PROVIDER: TDataSetProvider;
    CDSNF: TClientDataSet;
    DSNF: TDataSource;
    SQLITEM: TSQLDataSet;
    CDSITEM: TClientDataSet;
    DSITEM: TDataSource;
    DsLiga: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LabStatus: TLabel;
    LabNf: TLabel;
    Label9: TLabel;
    SQLAUXLOCAL: TSQLDataSet;
    CDSITEMTotal: TAggregateField;
    Label7: TLabel;
    Panfecha: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    SQLREC: TSQLDataSet;
    CDSREC: TClientDataSet;
    DSREC: TDataSource;
    SQLESTOQUE: TSQLDataSet;
    PROVIDERESTOQUE: TDataSetProvider;
    CDSESTOQUE: TClientDataSet;
    DSESTOQUE: TDataSource;
    SQLITEMIDITENSVENDAS: TIntegerField;
    SQLITEMIDNFVENDA: TIntegerField;
    SQLITEMIDPRODUTOFIN: TIntegerField;
    SQLITEMQTD_ITVEN: TBCDField;
    SQLITEMPRECO_ITVEN: TBCDField;
    SQLITEMSTATUS_ITVEN: TStringField;
    SQLITEMDESC_PRODF: TStringField;
    SQLITEMSTATUS_PRODF: TStringField;
    SQLITEMPRECOMED_PRODF: TBCDField;
    SQLESTOQUEIDMATEIAPRIMA: TIntegerField;
    SQLESTOQUEPRECODECUSTO_MATP: TBCDField;
    SQLESTOQUEDESCRICAO_MATP: TStringField;
    SQLESTOQUEQTDMIN_MATP: TIntegerField;
    SQLESTOQUEQTDMAX_MATP: TIntegerField;
    SQLESTOQUEQTDEST_MATP: TBCDField;
    SQLESTOQUEOBS_MATP: TStringField;
    SQLESTOQUESTATUS_MATP: TStringField;
    PANANUNCIOS: TRzPanel;
    Bevel1: TBevel;
    IMAGEMPROMOCIONAL: TImage;
    SQLRECIDRECEB: TIntegerField;
    SQLRECIDNFVENDA: TIntegerField;
    SQLRECVALOR_RC: TBCDField;
    SQLRECDTVENC_RC: TDateField;
    SQLRECOBS__RC: TStringField;
    SQLRECSTATS_RC: TStringField;
    SQLNFIDNFVENDA: TIntegerField;
    SQLNFIDCLIENTE: TIntegerField;
    SQLNFIDCONDI_COND: TIntegerField;
    SQLNFIDFUNCIONARIO: TIntegerField;
    SQLNFSERIE_NFV: TStringField;
    SQLNFTIPO_NFV: TStringField;
    SQLNFDATA_NFV: TDateField;
    SQLNFHORA_NFV: TTimeField;
    SQLNFVALOR_NFV: TBCDField;
    SQLNFDTENT_NFV: TDateField;
    SQLNFSTATUS_NFV: TStringField;
    SQLNFOBS_NFV: TStringField;
    SQLNFNOMEFAN_CLIEN: TStringField;
    SQLNFCPF_CLIEN: TStringField;
    SQLNFSTATUS_CLIEN: TStringField;
    SQLNFNOME_FUN: TStringField;
    SQLNFSTATUS_FUN: TStringField;
    SQLNFNUMPAR_COND: TIntegerField;
    SQLNFDIASPRI_COND: TIntegerField;
    SQLNFDIASENTRE_COND: TIntegerField;
    SQLNFPERJUROS_COND: TBCDField;
    SQLNFSTATUS_COND: TStringField;
    SQLNFDESCRI_COND: TStringField;
    dbdescricond: TRzDBEdit;
    dbcodcond: TRzDBEdit;
    CDSITEMIDITENSVENDAS: TIntegerField;
    CDSITEMIDNFVENDA: TIntegerField;
    CDSITEMIDPRODUTOFIN: TIntegerField;
    CDSITEMQTD_ITVEN: TBCDField;
    CDSITEMPRECO_ITVEN: TBCDField;
    CDSITEMSTATUS_ITVEN: TStringField;
    CDSITEMDESC_PRODF: TStringField;
    CDSITEMSTATUS_PRODF: TStringField;
    CDSITEMPRECOMED_PRODF: TBCDField;
    CDSRECIDRECEB: TIntegerField;
    CDSRECIDNFVENDA: TIntegerField;
    CDSRECVALOR_RC: TBCDField;
    CDSRECDTVENC_RC: TDateField;
    CDSRECOBS__RC: TStringField;
    CDSRECSTATS_RC: TStringField;
    CDSITEMsubtotalATIVO: TFloatField;
    CDSITEMsubtotal: TFloatField;
    DBPRODUT: TRzDBEdit;
    DBNOMECLI: TRzDBEdit;
    novocli: TRzButton;
    buscacli: TRzButton;
    dbcodcli: TRzDBEdit;
    dbcpfcli: TRzDBEdit;
    buscacondi: TRzButton;
    novacondi: TRzButton;
    dbcodfun: TRzDBEdit;
    buscafunci: TRzButton;
    novofunci: TRzButton;
    DBNOMEFUN: TRzDBEdit;
    BuscaProduto: TRzMaskEdit;
    SQLITEMCODBARRA_PRODF: TStringField;
    CDSITEMCODBARRA_PRODF: TStringField;
    SQLITEMTAMANHO_PRODF: TStringField;
    CDSNFIDNFVENDA: TIntegerField;
    CDSNFIDCLIENTE: TIntegerField;
    CDSNFIDCONDI_COND: TIntegerField;
    CDSNFIDFUNCIONARIO: TIntegerField;
    CDSNFSERIE_NFV: TStringField;
    CDSNFTIPO_NFV: TStringField;
    CDSNFDATA_NFV: TDateField;
    CDSNFHORA_NFV: TTimeField;
    CDSNFVALOR_NFV: TBCDField;
    CDSNFDTENT_NFV: TDateField;
    CDSNFSTATUS_NFV: TStringField;
    CDSNFOBS_NFV: TStringField;
    CDSNFNOMEFAN_CLIEN: TStringField;
    CDSNFCPF_CLIEN: TStringField;
    CDSNFSTATUS_CLIEN: TStringField;
    CDSNFNOME_FUN: TStringField;
    CDSNFSTATUS_FUN: TStringField;
    CDSNFNUMPAR_COND: TIntegerField;
    CDSNFDIASPRI_COND: TIntegerField;
    CDSNFDIASENTRE_COND: TIntegerField;
    CDSNFPERJUROS_COND: TBCDField;
    CDSNFSTATUS_COND: TStringField;
    CDSNFDESCRI_COND: TStringField;
    CDSNFSQLREC: TDataSetField;
    CDSNFSQLITEM: TDataSetField;
    Label8: TLabel;
    CDSITEMPERDESCO: TFloatField;
    SQLRECDATA_EMISSAO: TDateField;
    CDSRECDATA_EMISSAO: TDateField;
    RzLabel1: TRzLabel;
    DBQTDE: TRzEdit;
    CDSESTOQUEIDMATEIAPRIMA: TIntegerField;
    CDSESTOQUEPRECODECUSTO_MATP: TBCDField;
    CDSESTOQUEDESCRICAO_MATP: TStringField;
    CDSESTOQUEQTDMIN_MATP: TIntegerField;
    CDSESTOQUEQTDMAX_MATP: TIntegerField;
    CDSESTOQUEQTDEST_MATP: TBCDField;
    CDSESTOQUEOBS_MATP: TStringField;
    CDSESTOQUESTATUS_MATP: TStringField;
    SQLNFIDCEP_CEP: TIntegerField;
    SQLNFCEP_CEP: TStringField;
    SQLNFLOG_CEP: TStringField;
    CDSNFIDCEP_CEP: TIntegerField;
    CDSNFCEP_CEP: TStringField;
    CDSNFLOG_CEP: TStringField;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    SQLNFSTATUS_CEP: TStringField;
    CDSNFSTATUS_CEP: TStringField;
    DBCEP: TRzDBEdit;
    DBLOGCEP: TRzDBEdit;
    Label20: TLabel;
    DBDTENT: TRzDBDateTimeEdit;
    PANFINNF: TRzPanel;
    DBIDCEP: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CDSITEMCODBARRA_ESTValidate(Sender: TField);
    procedure BuscaProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CDSITEMCalcFields(DataSet: TDataSet);
    procedure CDSITEMCODBARRA_PRODFValidate(Sender: TField);
    procedure BtnSairClick(Sender: TObject);
    procedure CDSNFIDFUNCIONARIOValidate(Sender: TField);
    procedure CDSNFIDCONDI_CONDValidate(Sender: TField);
    procedure CDSNFIDCLIENTEValidate(Sender: TField);
    procedure CDSNFIDCEP_CEPValidate(Sender: TField);
  private
    { Private declarations }
  public
     { Public declarations }
  end;

var
  FrmVenda: TFrmVenda;

implementation

uses UDM, U_BusProduto, Math;

{$R *.dfm}

procedure TFrmVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  TAM           :  INTEGER;
  PercentualDes : Real;
  I, CONTX, AA  : Integer;
  varqtd        : integer;
  varbarra      : string[13];

begin
      // testando o alt f4
      IF (ssAlt in Shift) and (Key = VK_F4)  THEN
        BEGIN
          close;
          exit;
        END;


     ////Codificando os eventos do form de vendas
      IF (KEY = VK_F1)  THEN
        BEGIN
          IF (LabStatus.Caption  = 'Status da NF.: Stand By' ) THEN
           BEGIN
             //Trocando o texto que identifica o Status da NF
             LabStatus.Caption  := 'Status da NF.: Incluindo';

            //Abrindo os Datasets e incluindo um novo registro de NF
             CDSITEM.Close;
             CDSREC.Close;
             CDSNF.Close;

             SQLITEM.Close;
             SQLREC.Close;
             SQLNF.Close;

             SQLNF.ParamByName('PARNFVENDA').AsInteger := 0;

             SQLNF.Open;
             SQLREC.Open;
             SQLITEM.Open;

             CDSNF.Open;
             CDSREC.Open;
             CDSITEM.Open;
             CDSNF.Append;

             //Gerando o c�digo da nova NF
             DM.SqlAuxiliar.Close;
             DM.SqlAuxiliar.CommandText := ' SELECT MAX(NFVENDAS.IDNFVENDA) FROM NFVENDAS ' ;
             DM.SqlAuxiliar.Open;

             CDSNFIDNFVENDA.AsInteger   := DM.SqlAuxiliar.fieldbyname('MAX').AsInteger +1;
             CDSNFSTATUS_NFV.AsString   := 'A';
             LabNf.Caption              := 'N� da NF.:' + inttostr(CDSNFIDNFVENDA.AsInteger);
             CDSNFDATA_NFV.AsDateTime   := DATE;

             CDSNF.Post;
             CDSNF.ApplyUpdates(0);

             CDSNF.Edit;
              //AGORA VOU HABILITAR O PANEL DO C�DIGO DE BARRAS

             PanDados.Enabled := true;
             BuscaProduto.Clear;
             PANGRID.Enabled := TRUE;

             FocusControl(BuscaProduto);


             END
           ELSE
            BEGIN
            ShowMessage('Opera��o n�o Autorizada,' + #13+#10+'Venda em Aberto!');
         END;
      END;
     //////////////////////////    F1 CONCLUIDO   \\\\\\\\\\\\\\\\\\

     //CRIANDO O EVENTO ONKEYDOWN PARA A TECLA ENTER
  IF (KEY = VK_RETURN)  THEN
    BEGIN
           varqtd:= StrToInt(DBQTDE.Text);
          IF (LabStatus.Caption ='Status da NF.: Incluindo') THEN
                 BEGIN
                  TAM := LENGTH(Trim(BuscaProduto.Text));

                 IF (TAM = 13) THEN
                    BEGIN
                  // PROCURAR O PRODUTO PELO C�DIGO DE BARRA DIGITADO...
                      DM.SqlAuxiliar.Close;
                      DM.SqlAuxiliar.CommandText := ' SELECT PRODUTOFINAL.IDPRODUTOFIN, PRODUTOFINAL.CODBARRA_PRODF, PRODUTOFINAL.STATUS_PRODF '+
                                                      ' FROM  PRODUTOFINAL' +
                                                      ' WHERE PRODUTOFINAL.CODBARRA_PRODF = ' + QuotedStr(TRIM(BuscaProduto.Text));

                      DM.SqlAuxiliar.Open;

                 IF (DM.SqlAuxiliar.FieldByName('CODBARRA_PRODF').AsString <> '') THEN
                    BEGIN
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_PRODF').AsString = 'A') THEN
                          BEGIN
                              //INCLUIR REGISTRO NO ITEM DA NF

                              //CRIAR O C�DIGO AUTOM�TICO NO �TEM
                              SQLAUXLOCAL.Close;
                              SQLAUXLOCAL.CommandText := ' SELECT MAX(ITENSVENDAS.IDITENSVENDAS) FROM ITENSVENDAS';
                              SQLAUXLOCAL.Open;
                               CDSITEM.Append;

                              CDSITEMIDITENSVENDAS.AsInteger := SQLAUXLOCAL.FIELDBYNAME('MAX').AsInteger + 1 ;
                              CDSITEMCODBARRA_PRODF.AsString   := BuscaProduto.Text;
                              CDSITEMIDPRODUTOFIN.AsInteger := DM.SqlAuxiliar.FIELDBYNAME('IDPRODUTOFIN').AsInteger;

                              CDSITEMSTATUS_ITVEN.AsString   := 'A';
                              CDSITEMQTD_ITVEN.AsFloat       :=StrToFloat(DBQTDE.Text) ;

                              //TRAZER O PRE�O DO PRODUTO DIRETO PARA O CAMPO...
                              //n�O ESQUECER DE FAZER O ONVALIDATE QUE ATUALIZA OS OUTROS
                              //DADOS DOS ITENS DA VENDA
                              DM.SqlAuxiliar.Close;
                              DM.SqlAuxiliar.CommandText := ' SELECT PRODUTOFINAL.PRECOMED_PRODF FROM PRODUTOFINAL' +
                                                            ' WHERE PRODUTOFINAL.CODBARRA_PRODF = ' + QuotedStr(BuscaProduto.Text);
                              DM.SqlAuxiliar.Open;
                              CDSITEMPRECO_ITVEN.AsFloat := DM.SqlAuxiliar.FIELDBYNAME('PRECOMED_PRODF').AsFloat;



                              CDSITEM.Post;
                              CDSITEM.ApplyUpdates(0);
                              BuscaProduto.Clear;
                             IF BuscaProduto.CanFocus THEN FocusControl(BuscaProduto);
                          END
                        ELSE
                          BEGIN
                              ShowMessage('Produto Desativado !');
                              BuscaProduto.Clear;
                              IF BuscaProduto.CanFocus THEN FocusControl(BuscaProduto);
                          END;
                    END
                  ELSE
                    BEGIN
                        ShowMessage('Produto Desativado !');
                        BuscaProduto.Clear;
                        FocusControl(BuscaProduto);
                    END;
              END
            ELSE IF (TAM > 13) THEN
              BEGIN

                        ShowMessage('Produto Inv�lido !');
                        BuscaProduto.Clear;
                        EXIT;
                        FocusControl(BuscaProduto);

              // agora seguindo, vamos separar o c�digo de barra da qtd
              TRY
                varbarra := Copy(BuscaProduto.Text,(Tam - 13 + 1 ),13);
                varqtd   := StrtoInt(Copy(BuscaProduto.Text,1, TAM - 13 - 1 ));
              EXCEPT
                ShowMessage('Produto Inv�lido !');
                BuscaProduto.Clear;
             //    FocusControl(BuscaProduto);    o foco tira a outras op��es
              END;

              //LAN�AR O REGISTRO  NA TABELA DE ITENS
              //CRIANDO O REGISTRO EM BRANCO
              CDSITEM.Append;

              //C�DIGO AUTOM�TICO
              DM.SqlAuxiliar.Close;
              DM.SqlAuxiliar.CommandText := ' SELECT MAX(ITENSVENDAS.IDITENSVENDAS) FROM ITENSVENDAS';
              DM.SqlAuxiliar.Open;
              CDSITEMIDITENSVENDAS.AsInteger := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

              //ATRIBUIR VALOR PARA OS ATRIBUTOS
              CDSITEMCODBARRA_PRODF.AsString   := varbarra;
              CDSITEMSTATUS_ITVEN.AsString   := 'A';
              CDSITEMQTD_ITVEN.AsFloat       := varqtd;

              DM.SqlAuxiliar.Close;
              DM.SqlAuxiliar.CommandText := ' SELECT PRODUTOFINAL.PRECOMED_PRODF FROM PRODUTOFINAL' +
                                            ' LEFT OUTER JOIN MATERIA_PRIMA ON (PRODUTO.IDPRODUTO = MATERIA_PRIMA.IDMATEIAPRIMA) '+
                                            ' WHERE PRODUTOFINAL.CODBARRA_PRODF = ' + QuotedStr(varbarra);
              DM.SqlAuxiliar.Open;
              CDSITEMPRECO_ITVEN.AsFloat := DM.SqlAuxiliar.FIELDBYNAME('PRECOMED_PRODF').AsFloat;



              //GRAVAR AS INFORMA��ES
              CDSITEM.Post;
              CDSITEM.ApplyUpdates(0);

              //PERMITIR A DIGFITA��O DE UM NOVO PRODUTO
              BuscaProduto.Clear;
             if BuscaProduto.CanFocus then FocusControl(BuscaProduto);
              END; //END DO ELSE QUANDO � UM CODIGO DE BARRA COM MAIS DE 13 DIGITOS

        END;//END DO IF SE EST� EM MODO DE INCLUSAO
    END; //1   //END DO KEY DO ENTER




    //F4 - eXCLUIR �TEM
 IF (KEY = VK_F4)  AND (LabStatus.Caption = 'Status da NF.: Incluindo')THEN
   BEGIN
      IF (CDSITEMIDITENSVENDAS.AsInteger > 0) THEN
        BEGIN
           IF (CDSITEMSTATUS_ITVEN.AsString = 'A') THEN
             BEGIN
                 IF (MessageDlg('Confirma a Exclus�o do �tem ?',mtConfirmation,[MBYES,MBNO],0)  =  MRYES) THEN
                   BEGIN
                       CDSITEM.Edit;
                       CDSITEMSTATUS_ITVEN.AsString := 'C';
                       CDSITEM.Post;
                       CDSITEM.ApplyUpdates(0);

                       FocusControl(BuscaProduto);
                   END;//END DO IF SE DESEJA DESATIVA O ITEM
             END
           ELSE
             BEGIN
                 SHOWMESSAGE('Aten��o !' + #13+#10+'�tem Desativado !');
                 EXIT;
             END; //END DO ELSE SE O STATUS DO �TEM EST� FALSE
        END//END DO IF SE ACHOU UM �TEM NA GRID
      ELSE
        BEGIN
           SHOWMESSAGE('Aten��o !' + #13+#10+'N�o Existem �tens Para Excluir !');
           EXIT;
        END;//END DO ELSE   QUE N�O ACHOU REGISTRO PARA EXCLUIR


   END;// END DO IF DO F4 - eXCLUIR �TEM

  IF (KEY = VK_F2) and ( LabStatus.Caption='Status da NF.: Incluindo') THEN
   BEGIN // 1
      IF (MESSAGEDLG('Confirma Exclus�o do Faturamento ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
        BEGIN //2
            //POSICIONANDO O ONTEIRO NO PRIMEIRO REGISTRO DOS ITENS
            CDSITEM.First;

            //REPITA ENQUANTO N�O FOR O FINAL DA ENTIDADE ITENS DA VENDA
            WHILE(NOT CDSITEM.Eof) DO
              BEGIN //3
                 IF (CDSITEMSTATUS_ITVEN.AsString = 'A') THEN
                   BEGIN
                        //EDITANDO O REGISTRO, TROCANDO O VALOR E APLICANDO AS ALTERA��ES
                        CDSITEM.Edit;
                        CDSITEMSTATUS_ITVEN.AsString :='C';
                        CDSITEM.Post;
                        CDSITEM.ApplyUpdates(0);
                   END;

                 //POSICIONANDO NO PR�XIMO REGISTRO DO �TEM DA VENDA
                 CDSITEM.Next;
              END;

            //AGORA VOU CANCELAR A VENDA TAMB�M(STATUS)
            CDSNF.Edit;
            CDSNFSTATUS_NFV.AsString :='C';
            CDSNF.Post;
              CDSNF.ApplyUpdates(0);

            //aGORA DESLIGANDO OS DATASETS E RETORNANDO
            CDSITEM.Close;
            CDSREC.Close;
            CDSNF.Close;

            SQLITEM.Close;
            SQLREC.Close;
            SQLNF.Close;

            PanDados.Enabled := FALSE;
            BuscaProduto.Clear;
            PANGRID.Enabled := FALSE;

            LabStatus.Caption := 'Status da NF.: Stand By';
            LabNf.Caption     := 'N� da NF.:';
            



        END;//END DO IF SAE DESEJA CANCELAR A VENDA?
   //F2, CANCELAMENTO DA VENDA

   END;
   //F5 - aTRIBIUINDO DESCONO POR �TEM
 IF (KEY = VK_F5) AND (LabStatus.Caption = 'Status da NF.: Incluindo') THEN
   BEGIN
      IF (CDSITEMSTATUS_ITVEN.AsString = 'A') THEN
        BEGIN
            CDSITEM.Edit;
            Try
             PercentualDes := StrToFloat(InputBox('SoftMetal','Informe o % de Desconto ','0'));
            Except
             PercentualDes := 0;
            End;

           CDSITEMPERDESCO.AsFloat := PercentualDes;

            CDSITEM.Post;
            CDSITEM.ApplyUpdates(0);
            BuscaProduto.Clear;
            FocusControl(BuscaProduto);
        END
      ELSE
        BEGIN
            ShowMessage('�tem Cancelado ou Inexistente ! ');
            BuscaProduto.Clear;
            FocusControl(BuscaProduto);
            Exit;
        END;
   END;//END DO F5

   // F6, BUSCA DE PRODUTO
 IF (KEY = VK_F6) AND (LabStatus.Caption = 'Status da NF.: Incluindo') THEN
   BEGIN
      Application.CreateForm(TFrmBusProd,FrmBusProd);
      FrmBusProd.QuemChama := 'VENDAS';
      FrmBusProd.ShowModal;
      FrmBusProd.Free;
      FocusControl(BuscaProduto);
   END;//END DA BUSCA DE PRODUTOS

    IF (KEY = VK_F3) AND (LabStatus.Caption = 'Status da NF.: Incluindo') THEN
   BEGIN
       IF (Panfecha.Enabled = FALSE) THEN
         BEGIN

              Panfecha.Enabled := TRUE;
              PanDados.Enabled := FALSE;
              if dbcodcli.CanFocus then FocusControl(dbcodcli);
         END //END DA 1A VEZ DO F3
       ELSE
         BEGIN
               //testar os atributos de fechamento
              IF (CDSNFNOMEFAN_CLIEN.AsString = '') THEN
                BEGIN
                      ShowMessage('Atributo Obrigat�rio ! ');
                      FocusControl(dbcodcli);
                      Exit;
                END;
              IF (CDSNFDESCRI_COND.AsString = '') THEN
                BEGIN
                      ShowMessage('Atributo Obrigat�rio ! ');
                      FocusControl(dbcodcond);
                      Exit;
                END;
              IF (CDSNFNOME_FUN.AsString = '') THEN
                BEGIN
                      ShowMessage('Atributo Obrigat�rio ! ');
                      FocusControl(dbcodfun);
                      Exit;
                END;

         //encerrar a venda, geras o contas a receber e baixar o estoque
         IF (DSNF.State IN [DSINSERT,DSEDIT]) THEN
           BEGIN
              CDSNFVALOR_NFV.AsFloat := CDSITEMsubtotalATIVO.AsFloat;
              CDSNFHORA_NFV.AsDateTime :=  time;
              CDSNF.Post;
              CDSNF.ApplyUpdates(0);
           END;

         //GERANDO O CONTAS A RECEBER
         FOR AA := 1 TO CDSNFNUMPAR_COND.ASINTEGER DO
           BEGIN

                 //CRIANDO O REGISTRO NA TABELA DE RECEBER
                 CDSREC.Append;


                 CDSRECDATA_EMISSAO.AsDateTime := CDSNFDATA_NFV.AsDateTime;
                 CDSRECVALOR_RC.AsCurrency     := CDSITEMTotal.Value / CDSNFNUMPAR_COND.AsInteger;
                 CDSRECSTATS_RC.AsString       := 'A';
                 CDSRECDTVENC_RC.AsDateTime    := CDSNFDATA_NFV.AsDateTime + CDSNFDIASPRI_COND.AsInteger +
                                                  (CDSNFDIASENTRE_COND.AsInteger * (AA-1));

                 //C�DIGO AUTOM�TICO
                 DM.SqlAuxiliar.Close;
                 DM.SqlAuxiliar.CommandText := 'SELECT MAX(RECEBER.IDRECEB) FROM RECEBER';
                 DM.SqlAuxiliar.Open;
                 CDSRECIDRECEB.AsInteger := DM.SqlAuxiliar.FIELDBYName('MAX').AsInteger + 1 ;

                 //GRAVANDO O REGISTRO NO BANCO
                 CDSREC.Post;
                 CDSREC.ApplyUpdates(0);
           END;


         //BAIXAR O ESTOQUE

            //POSICIONANDO O ONTEIRO NO PRIMEIRO REGISTRO DOS ITENS
            CDSITEM.First;

            //REPITA ENQUANTO N�O FOR O FINAL DA ENTIDADE ITENS DA VENDA
            WHILE(NOT CDSITEM.Eof) DO
              BEGIN
                 IF (CDSITEMSTATUS_ITVEN.AsString = 'A') THEN
                   BEGIN
                     CDSESTOQUE.Close;
                     SQLESTOQUE.Close;
                     SQLESTOQUE.ParamByName('PARMATP').AsInteger := CDSITEMIDPRODUTOFIN.AsInteger;
                     SQLESTOQUE.Open;
                     CDSESTOQUE.Open;

                     CDSESTOQUE.Edit;

                     CDSESTOQUEQTDEST_MATP.AsFloat := CDSESTOQUEQTDEST_MATP.AsFloat - CDSITEMQTD_ITVEN.AsFloat;
                     CDSESTOQUE.Post;
                     CDSESTOQUE.ApplyUpdates(0);

                   END;
                 //POSICIONANDO NO PR�XIMO REGISTRO DO �TEM DA VENDA
                 CDSITEM.Next;
              END;

         //VOLTAR O FORM A SITUA��O ORIGINAL...
         CDSITEM.Close;
         CDSREC.Close;
         CDSNF.Close;

         SQLITEM.Close;
         SQLREC.Close;
         SQLNF.Close;

         Panfecha.Enabled := FALSE;
         PanDados.Enabled := FALSE;
         PANGRID.Enabled  := FALSE;
         LabStatus.Caption:= 'Status da NF.: Stand By';
         LabNf.Caption    := 'N� da NF.:';
         ShowMessage('Venda Efetuada Com Sucesso !');


         END;//END DA 2A VEZ DO F3
   END;//END DO F3, ENCERRAMENTO DA VENDA






end;


procedure TFrmVenda.FormCreate(Sender: TObject);
var
 caminho:String;
begin
Panfecha.Enabled:=false;
 {if (LabStatus.Caption = 'Status da NF.: Stand By') then
  begin
     BtnSair.Enabled:= True;
  end

  else
   BEGIN
    BtnSair.Enabled:= FALSE;

  end;}


end;

procedure TFrmVenda.CDSITEMCODBARRA_ESTValidate(Sender: TField);
VAR
  BARRA : STRING[13];
begin
  Showmessage(QuotedStr(BuscaProduto.text));
  IF (TRIM(BuscaProduto.Text) <> '') THEN
    BEGIN
      BARRA := COPY(BuscaProduto.Text,(LENGTH(BuscaProduto.Text)-13+1),13);
      ShowMessage(QuotedStr(BARRA));
      SQLAUXLOCAL.Close;
      SQLAUXLOCAL.CommandText := ' SELECT ' +
                                 ' PRODUTOFINAL.IDPRODUTOFIN,'+
                                 ' PRODUTOFINAL.DESC_PRODF,'+
                                 ' PRODUTOFINAL.TAMANHO_PRODF,'+
                                 ' PRODUTOFINAL.PRECOMED_PRODF,'+
                                 ' FROM PRODUTOFINAL'+
                                 ' WHERE PRODUTOFINAL.CODBARRA_PRODF = '+ QuotedStr(BARRA) ;
      SQLAUXLOCAL.Open;

      CDSITEMIDPRODUTOFIN.AsInteger    := SQLAUXLOCAL.FIELDBYNAME('IDPRODUTOFIN').AsInteger;
    //CDSITETAMANHO_PRODF.AsString     := SQLAUXLOCAL.FIELDBYNAME('TAMANHO_PRODF').AsString;
      CDSITEMPRECOMED_PRODF.AsFloat    := SQLAUXLOCAL.FIELDBYNAME('PRECOMED_PRODF').AsFloat;
      CDSITEMDESC_PRODF.AsString       := SQLAUXLOCAL.FIELDBYNAME('DESC_PRODF').AsString;
    //CDSITEMFOTO_PROD.Value           := SQLAUXLOCAL.FIELDBYNAME('FOTO_PROD').VALUE;
    END
  ELSE
    BEGIN
      SQLAUXLOCAL.Close;
    SQLAUXLOCAL.CommandText := ' SELECT ' +
                                 ' PRODUTOFINAL.IDPRODUTOFIN,'+
                                 ' PRODUTOFINAL.DESC_PRODF,'+
                                 ' PRODUTOFINAL.TAMANHO_PRODF,'+
                                 ' PRODUTOFINAL.PRECOMED_PRODF,'+
                                 ' FROM PRODUTOFINAL'+
                                 ' WHERE PRODUTOFINAL.CODBARRA_PRODF = '+ QuotedStr(BARRA) ;
      SQLAUXLOCAL.Open;

      CDSITEMIDPRODUTOFIN.AsInteger    := SQLAUXLOCAL.FIELDBYNAME('IDPRODUTOFIN').AsInteger;
    //CDSITETAMANHO_PRODF.AsString     := SQLAUXLOCAL.FIELDBYNAME('TAMANHO_PRODF').AsString;
      CDSITEMPRECOMED_PRODF.AsFloat    := SQLAUXLOCAL.FIELDBYNAME('PRECOMED_PRODF').AsFloat;
      CDSITEMDESC_PRODF.AsString       := SQLAUXLOCAL.FIELDBYNAME('DESC_PRODF').AsString;
    //CDSITEMFOTO_PROD.Value           := SQLAUXLOCAL.FIELDBYNAME('FOTO_PROD').VALUE;

    END;
end;


procedure TFrmVenda.BuscaProdutoKeyPress(Sender: TObject; var Key: Char);
begin

    IF NOT (KEY IN ['0'..'9','x','X',CHR(13),CHR(27),CHR(127),CHR(8)] ) THEN
      BEGIN
          key := #0;
      END;
end;

procedure TFrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF (LabStatus.Caption <> 'Status da NF.: Stand By') THEN
    BEGIN
         ACTION := CANONE;
    END;
end;

procedure TFrmVenda.CDSITEMCalcFields(DataSet: TDataSet);
VAR
 MONTANTE : REAL;
 DESCONTO : REAL;
begin

  MONTANTE := CDSITEMQTD_ITVEN.AsFloat * CDSITEMPRECO_ITVEN.AsFloat;
  DESCONTO := (MONTANTE * CDSITEMPERDESCO.AsFloat)/100;

  CDSITEMSubTotal.AsCurrency := MONTANTE - DESCONTO;

  IF (CDSITEMSTATUS_ITVEN.AsString = 'A') THEN
    BEGIN
       CDSITEMSubTotalAtivo.AsCurrency := MONTANTE - DESCONTO;
    END
  ELSE
    BEGIN
       CDSITEMSubTotalAtivo.AsCurrency := 0;
    END;


end;

procedure TFrmVenda.CDSITEMCODBARRA_PRODFValidate(Sender: TField);
VAR
  BARRA : STRING[13];
begin
  Showmessage(QuotedStr(BuscaProduto.text));
  IF (TRIM(BuscaProduto.Text) <> '') THEN
    BEGIN
      BARRA := COPY(BuscaProduto.Text,(LENGTH(BuscaProduto.Text)-13+1),13);
      ShowMessage(QuotedStr(BARRA));
      SQLAUXLOCAL.Close;
      SQLAUXLOCAL.CommandText := ' SELECT ' +
                                 ' PRODUTOFINAL.IDPRODUTOFIN,'+
                                 ' PRODUTOFINAL.DESC_PRODF,'+
                                 ' PRODUTOFINAL.TAMANHO_PRODF,'+
                                 ' PRODUTOFINAL.PRECOMED_PRODF '+
                                 ' FROM PRODUTOFINAL'+
                                 ' WHERE PRODUTOFINAL.CODBARRA_PRODF = '+ QuotedStr(BARRA) ;
      SQLAUXLOCAL.Open;

      CDSITEMIDPRODUTOFIN.AsInteger    := SQLAUXLOCAL.FIELDBYNAME('IDPRODUTOFIN').AsInteger;
    //CDSITETAMANHO_PRODF.AsString     := SQLAUXLOCAL.FIELDBYNAME('TAMANHO_PRODF').AsString;
      CDSITEMPRECOMED_PRODF.AsFloat    := SQLAUXLOCAL.FIELDBYNAME('PRECOMED_PRODF').AsFloat;
      CDSITEMDESC_PRODF.AsString       := SQLAUXLOCAL.FIELDBYNAME('DESC_PRODF').AsString;
    //CDSITEMFOTO_PROD.Value           := SQLAUXLOCAL.FIELDBYNAME('FOTO_PROD').VALUE;
    END
  ELSE
    BEGIN
      SQLAUXLOCAL.Close;
    SQLAUXLOCAL.CommandText := ' SELECT ' +
                                 ' PRODUTOFINAL.IDPRODUTOFIN,'+
                                 ' PRODUTOFINAL.DESC_PRODF,'+
                                 ' PRODUTOFINAL.TAMANHO_PRODF,'+
                                 ' PRODUTOFINAL.PRECOMED_PRODF '+
                                 ' FROM PRODUTOFINAL'+
                                 ' WHERE PRODUTOFINAL.CODBARRA_PRODF = '+ QuotedStr(BARRA) ;
      SQLAUXLOCAL.Open;

      CDSITEMIDPRODUTOFIN.AsInteger    := SQLAUXLOCAL.FIELDBYNAME('IDPRODUTOFIN').AsInteger;
    //CDSITETAMANHO_PRODF.AsString     := SQLAUXLOCAL.FIELDBYNAME('TAMANHO_PRODF').AsString;
      CDSITEMPRECOMED_PRODF.AsFloat    := SQLAUXLOCAL.FIELDBYNAME('PRECOMED_PRODF').AsFloat;
      CDSITEMDESC_PRODF.AsString       := SQLAUXLOCAL.FIELDBYNAME('DESC_PRODF').AsString;
    //CDSITEMFOTO_PROD.Value           := SQLAUXLOCAL.FIELDBYNAME('FOTO_PROD').VALUE;

    END;
end;

procedure TFrmVenda.BtnSairClick(Sender: TObject);
begin
close;
end;

procedure TFrmVenda.CDSNFIDFUNCIONARIOValidate(Sender: TField);
begin
dm.SqlAuxiliar.Close;
  DM.SqlAuxiliar.CommandText := ' SELECT ' +
                                ' FUNCIONARIOS.NOME_FUN,' +
                                ' FUNCIONARIOS.STATUS_FUN' +
                                ' FROM FUNCIONARIOS' +
                                ' WHERE FUNCIONARIOS.IDFUNCIONARIO = ' + QuotedStr (IntToStr(CDSNFIDFUNCIONARIO.ASINTEGER));

  DM.SqlAuxiliar.Open;

  IF (DM.SqlAuxiliar.FieldByName('STATUS_FUN').AsString = 'A') THEN
    BEGIN
      CDSNFNOME_FUN.AsString := dm.SqlAuxiliar.fieldbyname('NOME_FUN').AsString;
      CDSNFSTATUS_FUN.AsString := dm.SqlAuxiliar.fieldbyname('STATUS_FUN').AsString;
    END
  ELSE
    BEGIN
      CDSNFNOME_FUN.AsString := '';
      CDSNFSTATUS_FUN.AsString  := '';

        ShowMessage('Funcion�rio Inexistente ou Desativado !');
        FocusControl(dbcodfun);
    END;
end;

procedure TFrmVenda.CDSNFIDCONDI_CONDValidate(Sender: TField);
begin
 dm.SqlAuxiliar.Close;
  DM.SqlAuxiliar.CommandText := ' SELECT ' +
                                ' CONDICOES.IDCONDI_COND,' +
                                ' CONDICOES.DESCRI_COND,' +
                                ' CONDICOES.NUMPAR_COND,' +
                                ' CONDICOES.DIASPRI_COND,' +
                                ' CONDICOES.DIASENTRE_COND,' +
                                ' CONDICOES.PERJUROS_COND,' +
                                ' CONDICOES.STATUS_COND' +
                                ' FROM CONDICOES' +
                                ' WHERE CONDICOES.IDCONDI_COND = ' + QuotedStr (IntToStr(CDSNFIDCONDI_COND.ASINTEGER));

  DM.SqlAuxiliar.Open;

  IF (DM.SqlAuxiliar.FieldByName('STATUS_COND').AsString = 'A') THEN
    BEGIN
      CDSNFDESCRI_COND.AsString     := dm.SqlAuxiliar.fieldbyname('DESCRI_COND').AsString;
      CDSNFNUMPAR_COND.AsInteger    := dm.SqlAuxiliar.fieldbyname('NUMPAR_COND').AsInteger;
      CDSNFDIASPRI_COND.AsInteger   := dm.SqlAuxiliar.fieldbyname('DIASPRI_COND').AsInteger;
      CDSNFDIASENTRE_COND.AsInteger := dm.SqlAuxiliar.fieldbyname('DIASENTRE_COND').AsInteger;
      CDSNFPERJUROS_COND.AsFloat    := dm.SqlAuxiliar.fieldbyname('PERJUROS_COND').AsFloat;
      CDSNFSTATUS_COND.AsString     := dm.SqlAuxiliar.fieldbyname('STATUS_COND').AsString;
    END
  ELSE
    BEGIN
      CDSNFDESCRI_COND.AsString     := '';
      CDSNFNUMPAR_COND.AsInteger    :=  0;
      CDSNFDIASPRI_COND.AsInteger   :=  0;
      CDSNFDIASENTRE_COND.AsInteger :=  0;;
      CDSNFPERJUROS_COND.AsFloat    :=  0;
      CDSNFSTATUS_COND.AsString     := '';

        ShowMessage('Funcion�rio Inexistente ou Desativado !');
        FocusControl(dbcodfun);
    END;
end;

procedure TFrmVenda.CDSNFIDCLIENTEValidate(Sender: TField);
begin
  DM.SqlAuxiliar.Close;
  DM.SqlAuxiliar.CommandText := ' SELECT ' +
                                ' CLIENTES.NOMEFAN_CLIEN,' +
                                ' CLIENTES.CPF_CLIEN,' +
                                ' CLIENTES.STATUS_CLIEN' +
                                ' FROM CLIENTES' +
                                ' WHERE CLIENTES.IDCLIENTE = ' + QuotedStr(IntToStr(CDSNFIDCLIENTE.ASINTEGER));

  DM.SqlAuxiliar.Open;

  IF (DM.SqlAuxiliar.FieldByName('STATUS_CLIEN').AsString = 'A') THEN
    BEGIN
      CDSNFNOMEFAN_CLIEN.AsString := dm.SqlAuxiliar.fieldbyname('NOMEFAN_CLIEN').AsString;
      CDSNFCPF_CLIEN.AsString := dm.SqlAuxiliar.fieldbyname('CPF_CLIEN').AsString;
      CDSNFSTATUS_CLIEN.AsString := dm.SqlAuxiliar.fieldbyname('STATUS_CLIEN').AsString;
    END
  ELSE
    BEGIN
      CDSNFNOMEFAN_CLIEN.AsString := '';
      CDSNFSTATUS_CLIEN.AsString  := '';

        ShowMessage('Cliente Inexistente ou Desativado !');
        if dbcodcli.CanFocus then FocusControl(dbcodcli);
    END;


end;

procedure TFrmVenda.CDSNFIDCEP_CEPValidate(Sender: TField);
begin
  DM.SqlAuxiliar.Close;
  DM.SqlAuxiliar.CommandText := ' SELECT ' +
                                ' CEPS.CEP_CEP,' +
                                ' CEPS.LOG_CEP,' +
                                ' CEPS.STATUS_CEP' +
                                ' FROM CEPS' +
                                ' WHERE CEPS.IDCEP_CEP = ' + QuotedStr(IntToStr(CDSNFIDCEP_CEP.ASINTEGER));

  DM.SqlAuxiliar.Open;

  IF (DM.SqlAuxiliar.FieldByName('STATUS_CEP').AsString = 'A') THEN
    BEGIN
      CDSNFCEP_CEP.AsString := dm.SqlAuxiliar.fieldbyname('CEP_CEP').AsString;
      CDSNFLOG_CEP.AsString := dm.SqlAuxiliar.fieldbyname('LOG_CEP').AsString;
      CDSNFSTATUS_CLIEN.AsString := dm.SqlAuxiliar.fieldbyname('STATUS_CEP').AsString;
    END
  ELSE
    BEGIN
      CDSNFNOMEFAN_CLIEN.AsString := '';
      CDSNFSTATUS_CLIEN.AsString  := '';

        ShowMessage('Cliente Inexistente ou Desativado !');
        if dbcodcli.CanFocus then FocusControl(dbcodcli);
    END;

end;

end.
