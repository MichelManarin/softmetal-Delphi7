inherited FrmCadTam: TFrmCadTam
  Caption = 'SOFTMETA - Cadastro de tamanho'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitle: TRzPanel
    Caption = 'Cadastro de tamanho do produto'
  end
  object DSTAM: TDataSource
    DataSet = CDSTAM
    Left = 112
    Top = 8
  end
  object CDSTAM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLTAM
    Left = 48
    Top = 8
  end
  object SQLTAM: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
  end
end
