inherited FrmStatusProdFin: TFrmStatusProdFin
  Left = 280
  Top = 171
  Caption = 'SOFTMETAL - Status de Produto Final'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    inherited PnlConteudo: TPanel
      object LblCODINICIAL: TLabel [0]
        Left = 464
        Top = 16
        Width = 81
        Height = 16
        Caption = ' Codigo Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [1]
        Left = 608
        Top = 16
        Width = 76
        Height = 16
        Caption = ' Codigo Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'Codigo')
      end
      inherited RGfiltra: TRzCheckGroup
        object CheckCod: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'CODIGO'
          TabOrder = 0
          OnClick = CheckCodClick
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      object CODFINAL: TRzEdit
        Left = 608
        Top = 32
        Width = 137
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 4
      end
      object CODINICIAL: TRzEdit
        Left = 464
        Top = 32
        Width = 137
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 5
      end
    end
    inherited Grid: TRzDBGrid
      DataSource = DSPF
      Columns = <
        item
          Expanded = False
          FieldName = 'IDPRODUTOFIN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDGRUPO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOCUSTO_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOMIN_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOMED_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOMAX_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBARRA_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDMIN_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDMAX_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDEST_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAMANHO_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_PRODF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_PRODF'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Produto Final'
  end
  object DSPF: TDataSource
    DataSet = CDSPF
    Left = 112
    Top = 8
  end
  object CDSPF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSPFIDPRODUTOFIN: TIntegerField
      FieldName = 'IDPRODUTOFIN'
      Required = True
    end
    object CDSPFIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object CDSPFPRECOCUSTO_PRODF: TBCDField
      FieldName = 'PRECOCUSTO_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPFPRECOMIN_PRODF: TBCDField
      FieldName = 'PRECOMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPFPRECOMED_PRODF: TBCDField
      FieldName = 'PRECOMED_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPFPRECOMAX_PRODF: TBCDField
      FieldName = 'PRECOMAX_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPFDESC_PRODF: TStringField
      FieldName = 'DESC_PRODF'
      Size = 100
    end
    object CDSPFCODBARRA_PRODF: TStringField
      FieldName = 'CODBARRA_PRODF'
      Size = 13
    end
    object CDSPFQTDMIN_PRODF: TBCDField
      FieldName = 'QTDMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPFQTDMAX_PRODF: TBCDField
      FieldName = 'QTDMAX_PRODF'
      Precision = 9
      Size = 2
    end
    object CDSPFQTDEST_PRODF: TIntegerField
      FieldName = 'QTDEST_PRODF'
    end
    object CDSPFTAMANHO_PRODF: TStringField
      FieldName = 'TAMANHO_PRODF'
      Size = 3
    end
    object CDSPFOBS_PRODF: TStringField
      FieldName = 'OBS_PRODF'
      Size = 200
    end
    object CDSPFSTATUS_PRODF: TStringField
      FieldName = 'STATUS_PRODF'
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLPF
    Left = 48
    Top = 8
  end
  object SQLPF: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'PRODUTOFINAL.IDPRODUTOFIN,'#13#10'PRODUTOFINAL.IDGRUPO,'#13#10'PRO' +
      'DUTOFINAL.PRECOCUSTO_PRODF,'#13#10'PRODUTOFINAL.PRECOMIN_PRODF,'#13#10'PRODU' +
      'TOFINAL.PRECOMED_PRODF,'#13#10'PRODUTOFINAL.PRECOMAX_PRODF,'#13#10'PRODUTOFI' +
      'NAL.DESC_PRODF,'#13#10'PRODUTOFINAL.CODBARRA_PRODF,'#13#10'PRODUTOFINAL.QTDM' +
      'IN_PRODF,'#13#10'PRODUTOFINAL.QTDMAX_PRODF,'#13#10'PRODUTOFINAL.QTDEST_PRODF' +
      ','#13#10'PRODUTOFINAL.TAMANHO_PRODF,'#13#10'PRODUTOFINAL.OBS_PRODF,'#13#10'PRODUTO' +
      'FINAL.STATUS_PRODF'#13#10#13#10'FROM PRODUTOFINAL'#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLPFIDPRODUTOFIN: TIntegerField
      FieldName = 'IDPRODUTOFIN'
      Required = True
    end
    object SQLPFIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object SQLPFPRECOCUSTO_PRODF: TBCDField
      FieldName = 'PRECOCUSTO_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPFPRECOMIN_PRODF: TBCDField
      FieldName = 'PRECOMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPFPRECOMED_PRODF: TBCDField
      FieldName = 'PRECOMED_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPFPRECOMAX_PRODF: TBCDField
      FieldName = 'PRECOMAX_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPFDESC_PRODF: TStringField
      FieldName = 'DESC_PRODF'
      Size = 100
    end
    object SQLPFCODBARRA_PRODF: TStringField
      FieldName = 'CODBARRA_PRODF'
      Size = 13
    end
    object SQLPFQTDMIN_PRODF: TBCDField
      FieldName = 'QTDMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPFQTDMAX_PRODF: TBCDField
      FieldName = 'QTDMAX_PRODF'
      Precision = 9
      Size = 2
    end
    object SQLPFQTDEST_PRODF: TIntegerField
      FieldName = 'QTDEST_PRODF'
    end
    object SQLPFTAMANHO_PRODF: TStringField
      FieldName = 'TAMANHO_PRODF'
      Size = 3
    end
    object SQLPFOBS_PRODF: TStringField
      FieldName = 'OBS_PRODF'
      Size = 200
    end
    object SQLPFSTATUS_PRODF: TStringField
      FieldName = 'STATUS_PRODF'
      Size = 1
    end
  end
end
