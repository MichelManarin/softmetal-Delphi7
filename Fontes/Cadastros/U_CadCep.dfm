inherited FrmCadCep: TFrmCadCep
  Left = 438
  Top = 114
  Caption = 'SOFTMETAL - Cadastro de Ceps'
  ClientHeight = 392
  ClientWidth = 523
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 335
    Width = 523
    inherited BtnBuscar: TRzButton
      Left = 256
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      Left = 344
      OnClick = BtnStatusClick
    end
    inherited BtnSair: TRzButton
      Left = 432
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 523
    Height = 49
    Caption = 'Cadastro de Ceps'
  end
  inherited PANDADOS: TRzPanel
    Top = 49
    Width = 523
    Height = 286
    inherited LBLCOD: TRzLabel
      Width = 51
      Height = 16
      Font.Height = -13
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 31
      Height = 16
      Caption = 'CEP*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 160
      Top = 128
      Width = 125
      Height = 16
      Caption = 'TIPO LOGRADOURO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 180
      Width = 91
      Height = 16
      Caption = 'C'#211'D. BAIRRO*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 160
      Top = 180
      Width = 92
      Height = 16
      Caption = 'NOME BAIRRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 230
      Width = 85
      Height = 16
      Caption = 'C'#211'D CIDADE*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 160
      Top = 230
      Width = 91
      Height = 16
      Caption = 'NOME CIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 160
      Top = 72
      Width = 96
      Height = 16
      Caption = 'LOGRADOURO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 128
      Width = 108
      Height = 16
      Caption = 'C'#211'D. TIPO LOG.*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBCEP_CEP: TRzDBEdit
      Left = 16
      Top = 88
      Width = 137
      Height = 24
      DataSource = DSCEPS
      DataField = 'CEP_CEP'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
    end
    object DBIDBAIRRO: TRzDBEdit
      Left = 16
      Top = 195
      Width = 73
      Height = 24
      DataSource = DSCEPS
      DataField = 'IDBAIRRO'
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
    end
    object DBNOMEBAIRRO: TRzDBEdit
      Left = 160
      Top = 195
      Width = 337
      Height = 24
      TabStop = False
      DataSource = DSCEPS
      DataField = 'NOME_BAIRRO'
      AutoSelect = False
      AutoSize = False
      CharCase = ecUpperCase
      DisabledColor = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clGrayText
      FrameHotTrack = True
      FrameVisible = True
      OEMConvert = True
      ParentFont = False
      ReadOnlyColor = clCream
      TabOrder = 8
    end
    object DBIDCIDADE: TRzDBEdit
      Left = 16
      Top = 245
      Width = 73
      Height = 24
      DataSource = DSCEPS
      DataField = 'IDCIDADE'
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
    end
    object DBNOMECIDADE: TRzDBEdit
      Left = 160
      Top = 245
      Width = 337
      Height = 24
      TabStop = False
      DataSource = DSCEPS
      DataField = 'NOME_CID'
      CharCase = ecUpperCase
      DisabledColor = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clGrayText
      FrameHotTrack = True
      FrameVisible = True
      OEMConvert = True
      ParentFont = False
      ReadOnlyColor = clCream
      TabOrder = 9
    end
    object DBLOGRADOUROCEP: TRzDBEdit
      Left = 160
      Top = 88
      Width = 337
      Height = 24
      DataSource = DSCEPS
      DataField = 'LOG_CEP'
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
    end
    object BtnBuscaBairro: TRzButton
      Left = 104
      Top = 195
      Width = 25
      Hint = 'Buscar Bairros'
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object BtnCadBairro: TRzButton
      Left = 130
      Top = 195
      Width = 25
      Hint = 'Adicionar novo bairro'
      Caption = '+'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnCadBairroClick
    end
    object BtnBuscaCidade: TRzBitBtn
      Left = 104
      Top = 245
      Width = 25
      Hint = 'Buscar Cidades'
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object BtnCadCidade: TRzBitBtn
      Left = 130
      Top = 245
      Width = 25
      Hint = 'Adicionar nova cidade'
      Caption = '+'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BtnCadCidadeClick
    end
    object DBIDTIPOLOG: TRzDBEdit
      Left = 16
      Top = 144
      Width = 73
      Height = 24
      DataSource = DSCEPS
      DataField = 'IDTIPOLOG'
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
      TabOrder = 10
    end
    object DBTIPOLOG: TRzDBEdit
      Left = 160
      Top = 144
      Width = 337
      Height = 24
      DataSource = DSCEPS
      DataField = 'NOME_LOG'
      CharCase = ecUpperCase
      DisabledColor = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 11
    end
    object RzButton1: TRzButton
      Left = 104
      Top = 144
      Width = 25
      Hint = 'Buscar Bairros'
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object RzButton2: TRzButton
      Left = 130
      Top = 144
      Width = 25
      Hint = 'Adicionar novo bairro'
      Caption = '+'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = BtnCadBairroClick
    end
  end
  inherited EdtBusca: TRzEdit
    Top = 88
    Width = 73
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 373
    Width = 523
  end
  object SQLCEPS: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CEPS.IDCEP_CEP,'#13#10'CEPS.CEP_CEP,'#13#10'CEPS.LOG_CEP,'#13#10'CEPS.ID' +
      'BAIRRO,'#13#10'CEPS.IDCIDADE,'#13#10'CEPS.IDTIPOLOG,'#13#10'CEPS.STATUS_CEP,'#13#10'TIPO' +
      'LOG.NOME_LOG,'#13#10'BAIRROS.NOME_BAIRRO,'#13#10'CIDADES.NOME_CID'#13#10#13#10'FROM CE' +
      'PS'#13#10#13#10'LEFT OUTER JOIN CIDADES ON (CIDADES.IDCIDADE=CEPS.IDCIDADE' +
      ')'#13#10'LEFT OUTER JOIN BAIRROS ON (BAIRROS.IDBAIRRO=CEPS.IDBAIRRO)'#13#10 +
      'LEFT OUTER JOIN TIPOLOG ON (TIPOLOG.IDTIPOLOG=CEPS.IDTIPOLOG)'#13#10#13 +
      #10'WHERE IDCEP_CEP = :PARCEP'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARCEP'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 8
    Top = 9
    object SQLCEPSIDCEP_CEP: TIntegerField
      FieldName = 'IDCEP_CEP'
      Required = True
    end
    object SQLCEPSCEP_CEP: TStringField
      FieldName = 'CEP_CEP'
      Required = True
      Size = 8
    end
    object SQLCEPSLOG_CEP: TStringField
      FieldName = 'LOG_CEP'
      Size = 100
    end
    object SQLCEPSIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object SQLCEPSIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object SQLCEPSIDTIPOLOG: TIntegerField
      FieldName = 'IDTIPOLOG'
      Required = True
    end
    object SQLCEPSSTATUS_CEP: TStringField
      FieldName = 'STATUS_CEP'
      Required = True
      Size = 1
    end
    object SQLCEPSNOME_LOG: TStringField
      FieldName = 'NOME_LOG'
      ProviderFlags = []
      Size = 50
    end
    object SQLCEPSNOME_BAIRRO: TStringField
      FieldName = 'NOME_BAIRRO'
      ProviderFlags = []
      Size = 50
    end
    object SQLCEPSNOME_CID: TStringField
      FieldName = 'NOME_CID'
      ProviderFlags = []
      Size = 50
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCEPS
    Left = 48
    Top = 8
  end
  object CDSCEPS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCEPSIDCEP_CEP: TIntegerField
      FieldName = 'IDCEP_CEP'
      Required = True
    end
    object CDSCEPSCEP_CEP: TStringField
      FieldName = 'CEP_CEP'
      Required = True
      Size = 8
    end
    object CDSCEPSLOG_CEP: TStringField
      FieldName = 'LOG_CEP'
      Size = 100
    end
    object CDSCEPSIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
      OnValidate = CDSCepsIDBAIRROValidate
    end
    object CDSCEPSIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
      OnValidate = CDSCepsIDCIDADEValidate
    end
    object CDSCEPSIDTIPOLOG: TIntegerField
      FieldName = 'IDTIPOLOG'
      Required = True
      OnValidate = CDSCepsIDTIPOLOGValidate
    end
    object CDSCEPSSTATUS_CEP: TStringField
      FieldName = 'STATUS_CEP'
      Required = True
      Size = 1
    end
    object CDSCEPSNOME_LOG: TStringField
      FieldName = 'NOME_LOG'
      ProviderFlags = []
      Size = 50
    end
    object CDSCEPSNOME_BAIRRO: TStringField
      FieldName = 'NOME_BAIRRO'
      ProviderFlags = []
      Size = 50
    end
    object CDSCEPSNOME_CID: TStringField
      FieldName = 'NOME_CID'
      ProviderFlags = []
      Size = 50
    end
  end
  object DSCEPS: TDataSource
    DataSet = CDSCEPS
    Left = 112
    Top = 8
  end
end
