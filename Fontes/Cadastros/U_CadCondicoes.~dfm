inherited FrmCadCondicoes: TFrmCadCondicoes
  Left = 311
  Top = 124
  Caption = 'SOFTMETA - Cadastro de Condi'#231#245'es'
  ClientHeight = 324
  ClientWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 265
    Width = 500
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 500
    Caption = 'Cadastro de Condi'#231#245'es'
  end
  inherited PANDADOS: TRzPanel
    Width = 500
    Height = 224
    inherited LBLCOD: TRzLabel
      Width = 51
      Height = 16
      Font.Height = -13
    end
    object Label1: TLabel
      Left = 16
      Top = 72
      Width = 76
      Height = 16
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 120
      Width = 109
      Height = 16
      Caption = 'QTD. PARCELAS*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 160
      Top = 120
      Width = 133
      Height = 16
      Caption = 'DIAS P/ 1'#170' PARCELA*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 300
      Top = 120
      Width = 155
      Height = 16
      Caption = 'DIAS ENTRE PARCELAS*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 160
      Top = 168
      Width = 91
      Height = 16
      Caption = 'OBSERVA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 168
      Width = 109
      Height = 16
      Caption = 'PERC. DE JUROS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object DBDESCRICAO: TRzDBEdit
      Left = 16
      Top = 88
      Width = 457
      Height = 24
      DataSource = DSCond
      DataField = 'DESCRI_COND'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
      OnEnter = DBDESCRICAOEnter
      OnExit = DBDESCRICAOExit
    end
    object DBQTDEPARC: TRzDBEdit
      Left = 16
      Top = 136
      Width = 121
      Height = 24
      DataSource = DSCond
      DataField = 'NUMPAR_COND'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
      OnEnter = DBQTDEPARCEnter
      OnExit = DBQTDEPARCExit
    end
    object DBDIASPRI: TRzDBEdit
      Left = 160
      Top = 136
      Width = 121
      Height = 24
      DataSource = DSCond
      DataField = 'DIASPRI_COND'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
      OnEnter = DBDIASPRIEnter
      OnExit = DBDIASPRIExit
    end
    object DBDIASENTRE: TRzDBEdit
      Left = 296
      Top = 136
      Width = 121
      Height = 24
      DataSource = DSCond
      DataField = 'DIASENTRE_COND'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
      OnEnter = DBDIASENTREEnter
      OnExit = DBDIASENTREExit
    end
    object DBOBS: TRzDBEdit
      Left = 160
      Top = 184
      Width = 313
      Height = 24
      DataSource = DSCond
      DataField = 'OBS_COND'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
      OnEnter = DBOBSEnter
      OnExit = DBOBSExit
    end
    object DBPERJUROS: TRzDBEdit
      Left = 16
      Top = 184
      Width = 121
      Height = 24
      DataSource = DSCond
      DataField = 'PERJUROS_COND'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameVisible = True
      ParentFont = False
      TabOrder = 4
      OnEnter = DBPERJUROSEnter
      OnExit = DBPERJUROSExit
    end
  end
  inherited EdtBusca: TRzEdit
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 303
    Width = 500
    Height = 21
  end
  object DSCond: TDataSource
    DataSet = CDSCond
    Left = 112
    Top = 8
  end
  object CDSCond: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCondIDCONDI_COND: TIntegerField
      FieldName = 'IDCONDI_COND'
      Required = True
    end
    object CDSCondDESCRI_COND: TStringField
      FieldName = 'DESCRI_COND'
      Size = 50
    end
    object CDSCondNUMPAR_COND: TIntegerField
      FieldName = 'NUMPAR_COND'
    end
    object CDSCondDIASPRI_COND: TIntegerField
      FieldName = 'DIASPRI_COND'
    end
    object CDSCondDIASENTRE_COND: TIntegerField
      FieldName = 'DIASENTRE_COND'
    end
    object CDSCondPERJUROS_COND: TBCDField
      FieldName = 'PERJUROS_COND'
      Precision = 9
      Size = 2
    end
    object CDSCondOBS_COND: TStringField
      FieldName = 'OBS_COND'
      Size = 100
    end
    object CDSCondSTATUS_COND: TStringField
      FieldName = 'STATUS_COND'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCond
    Left = 48
    Top = 8
  end
  object SQLCond: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CONDICOES.IDCONDI_COND,'#13#10'CONDICOES.DESCRI_COND,'#13#10'CONDI' +
      'COES.NUMPAR_COND,'#13#10'CONDICOES.DIASPRI_COND,'#13#10'CONDICOES.DIASENTRE_' +
      'COND,'#13#10'CONDICOES.PERJUROS_COND,'#13#10'CONDICOES.OBS_COND,'#13#10'CONDICOES.' +
      'STATUS_COND'#13#10#13#10'FROM CONDICOES'#13#10#13#10#13#10'WHERE CONDICOES.IDCONDI_COND ' +
      '= :PARCONDI'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARCONDI'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCondIDCONDI_COND: TIntegerField
      FieldName = 'IDCONDI_COND'
      Required = True
    end
    object SQLCondDESCRI_COND: TStringField
      FieldName = 'DESCRI_COND'
      Size = 50
    end
    object SQLCondNUMPAR_COND: TIntegerField
      FieldName = 'NUMPAR_COND'
    end
    object SQLCondDIASPRI_COND: TIntegerField
      FieldName = 'DIASPRI_COND'
    end
    object SQLCondDIASENTRE_COND: TIntegerField
      FieldName = 'DIASENTRE_COND'
    end
    object SQLCondPERJUROS_COND: TBCDField
      FieldName = 'PERJUROS_COND'
      Precision = 9
      Size = 2
    end
    object SQLCondOBS_COND: TStringField
      FieldName = 'OBS_COND'
      Size = 100
    end
    object SQLCondSTATUS_COND: TStringField
      FieldName = 'STATUS_COND'
      Required = True
      Size = 1
    end
  end
end
