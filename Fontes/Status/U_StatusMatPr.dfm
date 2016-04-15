inherited FrmStatusMatPr: TFrmStatusMatPr
  Left = 396
  Top = 130
  Caption = 'SOFTMETAL - Status de Materia Prima'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    inherited PnlConteudo: TPanel
      object Label3: TLabel [0]
        Left = 456
        Top = 16
        Width = 77
        Height = 16
        Caption = 'Codigo Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [1]
        Left = 600
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
      inherited RGfiltra: TRzCheckGroup
        object CheckCod: TRzCheckBox
          Left = 16
          Top = 24
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
        Left = 600
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
        Left = 456
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
      DataSource = DSMP
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDMATEIAPRIMA'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECODECUSTO_MATP'
          Title.Caption = 'PRE'#199'O DE CUSTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO_MATP'
          Title.Caption = 'DESCRI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDMIN_MATP'
          Title.Caption = 'QTD. MINIMA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDMAX_MATP'
          Title.Caption = 'QTDE. MAXIMA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDEST_MATP'
          Title.Caption = 'QTDE. ESTOQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_MATP'
          Title.Caption = 'OSERVA'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_MATP'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Materia Prima'
  end
  object DSMP: TDataSource
    DataSet = CDSMP
    Left = 112
    Top = 8
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLMP
    Left = 48
    Top = 8
  end
  object CDSMP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSMPIDMATEIAPRIMA: TIntegerField
      FieldName = 'IDMATEIAPRIMA'
      Required = True
    end
    object CDSMPPRECODECUSTO_MATP: TBCDField
      FieldName = 'PRECODECUSTO_MATP'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSMPDESCRICAO_MATP: TStringField
      FieldName = 'DESCRICAO_MATP'
      Required = True
      Size = 100
    end
    object CDSMPQTDMIN_MATP: TIntegerField
      FieldName = 'QTDMIN_MATP'
      Required = True
    end
    object CDSMPQTDMAX_MATP: TIntegerField
      FieldName = 'QTDMAX_MATP'
    end
    object CDSMPQTDEST_MATP: TBCDField
      FieldName = 'QTDEST_MATP'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSMPOBS_MATP: TStringField
      FieldName = 'OBS_MATP'
      Size = 100
    end
    object CDSMPSTATUS_MATP: TStringField
      FieldName = 'STATUS_MATP'
      Required = True
      Size = 1
    end
  end
  object SQLMP: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'MATERIA_PRIMA.IDMATEIAPRIMA,'#13#10'MATERIA_PRIMA.PRECODECUS' +
      'TO_MATP,'#13#10'MATERIA_PRIMA.DESCRICAO_MATP,'#13#10'MATERIA_PRIMA.QTDMIN_MA' +
      'TP,'#13#10'MATERIA_PRIMA.QTDMAX_MATP,'#13#10'MATERIA_PRIMA.QTDEST_MATP,'#13#10'MAT' +
      'ERIA_PRIMA.OBS_MATP,'#13#10'MATERIA_PRIMA.STATUS_MATP'#13#10#13#10'FROM MATERIA_' +
      'PRIMA'#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLMPIDMATEIAPRIMA: TIntegerField
      FieldName = 'IDMATEIAPRIMA'
      Required = True
    end
    object SQLMPPRECODECUSTO_MATP: TBCDField
      FieldName = 'PRECODECUSTO_MATP'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLMPDESCRICAO_MATP: TStringField
      FieldName = 'DESCRICAO_MATP'
      Required = True
      Size = 100
    end
    object SQLMPQTDMIN_MATP: TIntegerField
      FieldName = 'QTDMIN_MATP'
      Required = True
    end
    object SQLMPQTDMAX_MATP: TIntegerField
      FieldName = 'QTDMAX_MATP'
    end
    object SQLMPQTDEST_MATP: TBCDField
      FieldName = 'QTDEST_MATP'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLMPOBS_MATP: TStringField
      FieldName = 'OBS_MATP'
      Size = 100
    end
    object SQLMPSTATUS_MATP: TStringField
      FieldName = 'STATUS_MATP'
      Required = True
      Size = 1
    end
  end
end
