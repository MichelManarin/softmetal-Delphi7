inherited FrmCadProdFin: TFrmCadProdFin
  Left = 302
  Top = 148
  Caption = 'SOFTMETAL - Cadastro de Produto Final'
  Font.Name = 'Arial'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PANBOTOES: TPanel
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Height = 57
    Caption = 'Produto Final'
  end
  inherited PANDADOS: TRzPanel
    Top = 57
    Height = 332
  end
  inherited EdtBusca: TRzEdit
    Top = 88
    Height = 22
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
      'FINAL.STATUS_PRODF'#13#10#13#10'FROM PRODUTOFINAL'#13#10#13#10'WHERE PRODUTOFINAL.ID' +
      'PRODUTOFIN = :PARPRODUTOFINAL'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARPRODUTOFINAL'
        ParamType = ptInput
        Value = '0'
      end>
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
