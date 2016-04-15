inherited FrmCadCargos: TFrmCadCargos
  Left = 479
  Top = 202
  Caption = 'SOFTMETAL - Cadastro de Cargos'
  ClientHeight = 247
  ClientWidth = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 190
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
    Caption = 'Cadastro de Cargos'
  end
  inherited PANDADOS: TRzPanel
    Top = 49
    Width = 485
    Height = 141
    object Label1: TLabel [0]
      Left = 16
      Top = 78
      Width = 43
      Height = 16
      Caption = 'NOME*'
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
      Top = 96
      Width = 465
      Height = 24
      DataSource = DSCargos
      DataField = 'NOME_CARGO'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
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
    Top = 88
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 228
    Width = 485
  end
  object DSCargos: TDataSource
    DataSet = CDSCargos
    Left = 112
    Top = 8
  end
  object CDSCargos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCargosIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      Required = True
    end
    object CDSCargosNOME_CARGO: TStringField
      FieldName = 'NOME_CARGO'
      Required = True
      Size = 30
    end
    object CDSCargosSTATUS_CARGO: TStringField
      FieldName = 'STATUS_CARGO'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCargos
    Left = 48
    Top = 8
  end
  object SQLCargos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CARGOS.IDCARGO,'#13#10'CARGOS.NOME_CARGO,'#13#10'CARGOS.STATUS_CAR' +
      'GO'#13#10#13#10'FROM CARGOS'#13#10#13#10'WHERE CARGOS.IDCARGO = :PARCARGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARCARGO'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCargosIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      Required = True
    end
    object SQLCargosNOME_CARGO: TStringField
      FieldName = 'NOME_CARGO'
      Required = True
      Size = 30
    end
    object SQLCargosSTATUS_CARGO: TStringField
      FieldName = 'STATUS_CARGO'
      Required = True
      Size = 1
    end
  end
end
