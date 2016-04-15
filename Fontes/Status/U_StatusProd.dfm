inherited FrmStatusProd: TFrmStatusProd
  Left = 416
  Top = 154
  Caption = 'SOFTMETAL - Status de Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    inherited PnlConteudo: TPanel
      object Label1: TLabel [0]
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
      object LblCODINICIAL: TLabel [1]
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
      inherited RGfiltra: TRzCheckGroup
        object CheckCod: TRzCheckBox
          Left = 16
          Top = 32
          Width = 59
          Height = 16
          Caption = 'CODIGO'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 0
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'Codigo')
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
      DataSource = DSPRO
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDPRODUTOFIN'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOCUSTO_PRODF'
          Title.Caption = 'PRE'#199'O DE CUSTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOMIN_PRODF'
          Title.Caption = 'PRE'#199'O MIN.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOMED_PRODF'
          Title.Caption = 'PRE'#199'O MED.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOMAX_PRODF'
          Title.Caption = 'PRE'#199'O MAX.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PRODF'
          Title.Caption = 'DESCRI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBARRA_PRODF'
          Title.Caption = 'COD. BARRA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDMIN_PRODF'
          Title.Caption = 'QTD. MINIMA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDMAX_PRODF'
          Title.Caption = 'QUANTIDADE MAX.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDEST_PRODF'
          Title.Caption = 'QUANTIDADE DE ESTOQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAMANHO_PRODF'
          Title.Caption = 'TAMANHO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_PRODF'
          Title.Caption = 'OBSERVA'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_PRODF'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Produto'
  end
  object DSPRO: TDataSource
    DataSet = CDSPRO
    Left = 112
    Top = 8
  end
  object CDSPRO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSPROIDPRODUTOFIN: TIntegerField
      FieldName = 'IDPRODUTOFIN'
      Required = True
    end
    object CDSPROPRECOCUSTO_PRODF: TBCDField
      FieldName = 'PRECOCUSTO_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPROPRECOMIN_PRODF: TBCDField
      FieldName = 'PRECOMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPROPRECOMED_PRODF: TBCDField
      FieldName = 'PRECOMED_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPROPRECOMAX_PRODF: TBCDField
      FieldName = 'PRECOMAX_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPRODESC_PRODF: TStringField
      FieldName = 'DESC_PRODF'
      Size = 100
    end
    object CDSPROCODBARRA_PRODF: TStringField
      FieldName = 'CODBARRA_PRODF'
      Size = 13
    end
    object CDSPROQTDMIN_PRODF: TBCDField
      FieldName = 'QTDMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPROQTDMAX_PRODF: TBCDField
      FieldName = 'QTDMAX_PRODF'
      Precision = 9
      Size = 2
    end
    object CDSPROQTDEST_PRODF: TIntegerField
      FieldName = 'QTDEST_PRODF'
    end
    object CDSPROTAMANHO_PRODF: TStringField
      FieldName = 'TAMANHO_PRODF'
      Size = 3
    end
    object CDSPROOBS_PRODF: TStringField
      FieldName = 'OBS_PRODF'
      Size = 200
    end
    object CDSPROSTATUS_PRODF: TStringField
      FieldName = 'STATUS_PRODF'
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLPRO
    Left = 48
    Top = 8
  end
  object SQLPRO: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'PRODUTOFINAL.IDPRODUTOFIN,'#13#10'PRODUTOFINAL.PRECOCUSTO_PR' +
      'ODF,'#13#10'PRODUTOFINAL.PRECOMIN_PRODF,'#13#10'PRODUTOFINAL.PRECOMED_PRODF,' +
      #13#10'PRODUTOFINAL.PRECOMAX_PRODF,'#13#10'PRODUTOFINAL.DESC_PRODF, '#13#10'PRODU' +
      'TOFINAL.CODBARRA_PRODF,'#13#10'PRODUTOFINAL.QTDMIN_PRODF,'#13#10'PRODUTOFINA' +
      'L.QTDMAX_PRODF,'#13#10'PRODUTOFINAL.QTDEST_PRODF,'#13#10'PRODUTOFINAL.TAMANH' +
      'O_PRODF, '#13#10'PRODUTOFINAL.OBS_PRODF,'#13#10'PRODUTOFINAL.STATUS_PRODF'#13#10#13 +
      #10'FROM PRODUTOFINAL'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLPROIDPRODUTOFIN: TIntegerField
      FieldName = 'IDPRODUTOFIN'
      Required = True
    end
    object SQLPROPRECOCUSTO_PRODF: TBCDField
      FieldName = 'PRECOCUSTO_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPROPRECOMIN_PRODF: TBCDField
      FieldName = 'PRECOMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPROPRECOMED_PRODF: TBCDField
      FieldName = 'PRECOMED_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPROPRECOMAX_PRODF: TBCDField
      FieldName = 'PRECOMAX_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPRODESC_PRODF: TStringField
      FieldName = 'DESC_PRODF'
      Size = 100
    end
    object SQLPROCODBARRA_PRODF: TStringField
      FieldName = 'CODBARRA_PRODF'
      Size = 13
    end
    object SQLPROQTDMIN_PRODF: TBCDField
      FieldName = 'QTDMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPROQTDMAX_PRODF: TBCDField
      FieldName = 'QTDMAX_PRODF'
      Precision = 9
      Size = 2
    end
    object SQLPROQTDEST_PRODF: TIntegerField
      FieldName = 'QTDEST_PRODF'
    end
    object SQLPROTAMANHO_PRODF: TStringField
      FieldName = 'TAMANHO_PRODF'
      Size = 3
    end
    object SQLPROOBS_PRODF: TStringField
      FieldName = 'OBS_PRODF'
      Size = 200
    end
    object SQLPROSTATUS_PRODF: TStringField
      FieldName = 'STATUS_PRODF'
      Size = 1
    end
  end
end
