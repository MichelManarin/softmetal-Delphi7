inherited FrmCadMatPr: TFrmCadMatPr
  Left = 458
  Top = 177
  Caption = 'SOFTMETAL - Cadastro de Materia Prima'
  ClientHeight = 319
  ClientWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 262
    Width = 600
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 600
    Caption = 'Materia Prima'
  end
  inherited PANDADOS: TRzPanel
    Width = 600
    Height = 221
    inherited LBLCOD: TRzLabel
      Top = 8
      Width = 63
      Height = 18
      Font.Height = -16
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 143
      Height = 18
      Caption = 'PRE'#199'O DE CUSTO*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 168
      Top = 56
      Width = 101
      Height = 18
      Caption = 'QTD. MINIMA*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 312
      Top = 56
      Width = 79
      Height = 18
      Caption = 'QTD. MAX*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 456
      Top = 56
      Width = 77
      Height = 18
      Caption = 'QTD. EST*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 104
      Width = 95
      Height = 18
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 152
      Width = 112
      Height = 18
      Caption = 'OBSERVA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object DBPRECODECUSTO: TRzDBEdit
      Left = 16
      Top = 74
      Width = 145
      Height = 26
      DataSource = DSMP
      DataField = 'PRECODECUSTO_MATP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
    end
    object DBQTDEMINIMA: TRzDBEdit
      Left = 168
      Top = 74
      Width = 137
      Height = 26
      DataSource = DSMP
      DataField = 'QTDMIN_MATP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
    end
    object DBQTDEMAX: TRzDBEdit
      Left = 312
      Top = 74
      Width = 137
      Height = 26
      DataSource = DSMP
      DataField = 'QTDMAX_MATP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
    end
    object DBQTDEST: TRzDBEdit
      Left = 456
      Top = 74
      Width = 137
      Height = 26
      DataSource = DSMP
      DataField = 'QTDEST_MATP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
    end
    object DBDESCRICAO: TRzDBEdit
      Left = 16
      Top = 122
      Width = 577
      Height = 26
      DataSource = DSMP
      DataField = 'DESCRICAO_MATP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 4
    end
    object DBOBSERVACAO: TRzDBEdit
      Left = 16
      Top = 170
      Width = 577
      Height = 26
      DataSource = DSMP
      DataField = 'OBS_MATP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
    end
  end
  inherited EdtBusca: TRzEdit
    Top = 68
    Height = 26
    Font.Height = -16
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 300
    Width = 600
  end
  object DSMP: TDataSource
    DataSet = CDSMP
    Left = 112
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
  object PROVIDER: TDataSetProvider
    DataSet = SQLMP
    Left = 48
    Top = 8
  end
  object SQLMP: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'*'#13#10'FROM MATERIA_PRIMA'#13#10#13#10'WHERE MATERIA_PRIMA.IDMATEIAPRI' +
      'MA = :PARMATERIAPRIMA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARMATERIAPRIMA'
        ParamType = ptInput
        Value = '0'
      end>
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
