inherited FrmCadCidades: TFrmCadCidades
  Left = 430
  Top = 186
  Caption = 'SOFTMETAL - Cadastro de Cidades'
  ClientHeight = 234
  ClientWidth = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 177
    Width = 485
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 485
    Height = 49
    Caption = 'Cadastro de Cidades'
  end
  inherited PANDADOS: TRzPanel
    Top = 49
    Width = 485
    Height = 128
    object Label1: TLabel [0]
      Left = 16
      Top = 72
      Width = 43
      Height = 16
      Caption = 'NOME*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arila'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 346
      Top = 72
      Width = 22
      Height = 16
      Caption = 'UF*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited LBLCOD: TRzLabel
      Width = 51
      Height = 16
      Font.Height = -13
    end
    object DBNOME: TRzDBEdit
      Left = 16
      Top = 88
      Width = 305
      Height = 24
      DataSource = DSCidades
      DataField = 'NOME_CID'
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
      OnEnter = DBNOMEEnter
      OnExit = DBNOMEExit
    end
    object DBUF: TRzDBComboBox
      Left = 344
      Top = 88
      Width = 57
      Height = 22
      DataField = 'UF_CID'
      DataSource = DSCidades
      Style = csDropDownList
      CharCase = ecUpperCase
      Ctl3D = False
      Enabled = False
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 1
      Items.Strings = (
        'PR'
        'RS'
        'SC')
      Values.Strings = (
        'PR'
        'RS'
        'SC')
    end
  end
  inherited EdtBusca: TRzEdit
    Top = 88
    CharCase = ecUpperCase
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 215
    Width = 485
  end
  object DSCidades: TDataSource
    DataSet = CDSCidades
    Left = 112
    Top = 8
  end
  object CDSCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCidadesIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object CDSCidadesNOME_CID: TStringField
      FieldName = 'NOME_CID'
      Required = True
      Size = 50
    end
    object CDSCidadesUF_CID: TStringField
      FieldName = 'UF_CID'
      Required = True
      Size = 2
    end
    object CDSCidadesSTATUS_CID: TStringField
      FieldName = 'STATUS_CID'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCidades
    Left = 48
    Top = 8
  end
  object SQLCidades: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' '#13#10'CIDADES. IDCIDADE,'#13#10'CIDADES. NOME_CID,'#13#10'CIDADES. UF_C' +
      'ID,'#13#10'CIDADES. STATUS_CID'#13#10#13#10'FROM CIDADES'#13#10#13#10'WHERE CIDADES.IDCIDA' +
      'DE = :PARCIDADE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARCIDADE'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCidadesIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object SQLCidadesNOME_CID: TStringField
      FieldName = 'NOME_CID'
      Required = True
      Size = 50
    end
    object SQLCidadesUF_CID: TStringField
      FieldName = 'UF_CID'
      Required = True
      Size = 2
    end
    object SQLCidadesSTATUS_CID: TStringField
      FieldName = 'STATUS_CID'
      Required = True
      Size = 1
    end
  end
end
