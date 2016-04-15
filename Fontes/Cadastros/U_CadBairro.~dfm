inherited FrmCadBairros: TFrmCadBairros
  Left = 480
  Top = 324
  Caption = 'SOFTMETAL - Cadastro de Bairros'
  ClientHeight = 238
  ClientWidth = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 181
    Width = 492
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 492
    Caption = 'Cadastro de Bairros'
  end
  inherited PANDADOS: TRzPanel
    Width = 492
    Height = 140
    object Label1: TLabel [0]
      Left = 16
      Top = 72
      Width = 47
      Height = 16
      Caption = '*NOME:'
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
    object RzLabel1: TRzLabel
      Left = 312
      Top = 40
      Width = 3
      Height = 14
    end
    object DBNOME: TRzDBEdit
      Left = 16
      Top = 88
      Width = 465
      Height = 24
      DataSource = DSBairros
      DataField = 'NOME_BAIRRO'
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
  end
  inherited EdtBusca: TRzEdit
    CharCase = ecUpperCase
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 219
    Width = 492
  end
  object DSBairros: TDataSource
    DataSet = CDSBairros
    Left = 112
    Top = 8
  end
  object CDSBairros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSBairrosIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object CDSBairrosNOME_BAIRRO: TStringField
      FieldName = 'NOME_BAIRRO'
      Required = True
      Size = 50
    end
    object CDSBairrosSTATUS_BAIRRO: TStringField
      FieldName = 'STATUS_BAIRRO'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLBairros
    Left = 48
    Top = 8
  end
  object SQLBairros: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'BAIRROS.IDBAIRRO,'#13#10'BAIRROS.NOME_BAIRRO,'#13#10'BAIRROS.STATU' +
      'S_BAIRRO'#13#10#13#10'FROM BAIRROS'#13#10#13#10'WHERE BAIRROS.IDBAIRRO=:PARBAIRRO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARBAIRRO'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLBairrosIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object SQLBairrosNOME_BAIRRO: TStringField
      FieldName = 'NOME_BAIRRO'
      Required = True
      Size = 50
    end
    object SQLBairrosSTATUS_BAIRRO: TStringField
      FieldName = 'STATUS_BAIRRO'
      Required = True
      Size = 1
    end
  end
end
