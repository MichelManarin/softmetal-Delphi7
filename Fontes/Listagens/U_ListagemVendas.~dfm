inherited FrmListVendas: TFrmListVendas
  Left = 258
  Top = 127
  Width = 933
  Height = 538
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Width = 917
    Caption = 'Controle de Vendas'
  end
  inherited PnlCenter: TRzPanel
    Width = 917
    Height = 459
    inherited PANDADOS: TPanel
      Width = 913
      Height = 87
      inherited BtnListarTodos: TRzButton
        Left = 120
        Top = 4
        OnClick = BtnListarTodosClick
      end
      object RGOP: TRzRadioGroup
        Left = 16
        Top = 8
        Width = 89
        Caption = 'Op'#231#245'es'
        GroupStyle = gsBanner
        ItemHotTrack = True
        ItemHeight = 20
        Items.Strings = (
          'Mais Atual'
          'Mais Antiga')
        TabOrder = 1
      end
    end
    inherited Grid: TRzDBGrid
      Top = 89
      Width = 913
      Height = 349
      DataSource = DSVen
      Columns = <
        item
          Expanded = False
          FieldName = 'IDNFVENDA'
          Title.Caption = 'CODIGO VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCLIENTE'
          Title.Caption = 'CODIGO CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDFUNCIONARIO'
          Title.Caption = 'CODIGO FUNCIONARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCONDI_COND'
          Title.Caption = 'CODIGO CONDI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE_NFV'
          Title.Caption = 'SERIE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_NFV'
          Title.Caption = 'TIPO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_NFV'
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_NFV'
          Title.Caption = 'VALOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTENT_NFV'
          Title.Caption = 'DATA DE ENTRADA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_NFV'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
    inherited BARRASTATUS: TStatusBar
      Top = 438
      Width = 913
    end
  end
  inherited tempo: TTimer
    Left = 248
    Top = 16
  end
  object SQLVen: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'NFVENDAS.IDNFVENDA,'#13#10'NFVENDAS.IDCLIENTE,'#13#10'NFVENDAS.IDF' +
      'UNCIONARIO,'#13#10'NFVENDAS.IDCONDI_COND,'#13#10'NFVENDAS.SERIE_NFV,'#13#10'NFVEND' +
      'AS.TIPO_NFV,'#13#10'NFVENDAS.DATA_NFV,'#13#10'NFVENDAS.VALOR_NFV,'#13#10'NFVENDAS.' +
      'DTENT_NFV,'#13#10'NFVENDAS.STATUS_NFV'#13#10#13#10'FROM NFVENDAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLVenIDNFVENDA: TIntegerField
      FieldName = 'IDNFVENDA'
      Required = True
    end
    object SQLVenIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
    end
    object SQLVenIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
    end
    object SQLVenIDCONDI_COND: TIntegerField
      FieldName = 'IDCONDI_COND'
    end
    object SQLVenSERIE_NFV: TStringField
      FieldName = 'SERIE_NFV'
      Size = 3
    end
    object SQLVenTIPO_NFV: TStringField
      FieldName = 'TIPO_NFV'
      Size = 3
    end
    object SQLVenDATA_NFV: TDateField
      FieldName = 'DATA_NFV'
    end
    object SQLVenVALOR_NFV: TBCDField
      FieldName = 'VALOR_NFV'
      Precision = 9
      Size = 2
    end
    object SQLVenDTENT_NFV: TDateField
      FieldName = 'DTENT_NFV'
    end
    object SQLVenSTATUS_NFV: TStringField
      FieldName = 'STATUS_NFV'
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLVen
    Left = 48
    Top = 8
  end
  object CDSVen: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSVenIDNFVENDA: TIntegerField
      FieldName = 'IDNFVENDA'
      Required = True
    end
    object CDSVenIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
    end
    object CDSVenIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
    end
    object CDSVenIDCONDI_COND: TIntegerField
      FieldName = 'IDCONDI_COND'
    end
    object CDSVenSERIE_NFV: TStringField
      FieldName = 'SERIE_NFV'
      Size = 3
    end
    object CDSVenTIPO_NFV: TStringField
      FieldName = 'TIPO_NFV'
      Size = 3
    end
    object CDSVenDATA_NFV: TDateField
      FieldName = 'DATA_NFV'
    end
    object CDSVenVALOR_NFV: TBCDField
      FieldName = 'VALOR_NFV'
      Precision = 9
      Size = 2
    end
    object CDSVenDTENT_NFV: TDateField
      FieldName = 'DTENT_NFV'
    end
    object CDSVenSTATUS_NFV: TStringField
      FieldName = 'STATUS_NFV'
      Size = 1
    end
  end
  object DSVen: TDataSource
    DataSet = CDSVen
    Left = 112
    Top = 8
  end
end
