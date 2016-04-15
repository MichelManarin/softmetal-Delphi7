inherited FrmBusProd: TFrmBusProd
  Left = 217
  Top = 183
  Caption = 'SOFTMETAL - Busca de Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Caption = 'Busca de Produto'
  end
  inherited PnlCenter: TRzPanel
    inherited PANDADOS: TPanel
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
          'CODIGO')
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
          Title.Caption = 'DESCREI'#199#195'O'
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
      #13#10'PRODUTOFINAL.PRECOMAX_PRODF,'#13#10'PRODUTOFINAL.DESC_PRODF,'#13#10'PRODUT' +
      'OFINAL.OBS_PRODF,'#13#10'PRODUTOFINAL.STATUS_PRODF'#13#10#13#10'FROM PRODUTOFINA' +
      'L'#13#10#13#10
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
