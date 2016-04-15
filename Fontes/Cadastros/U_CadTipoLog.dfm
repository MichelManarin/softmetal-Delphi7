inherited FrmCadTipoLog: TFrmCadTipoLog
  Left = 449
  Top = 169
  Caption = 'SOFTMETAL - Cadastro Tipo Logradouro'
  ClientHeight = 226
  ClientWidth = 524
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 169
    Width = 524
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 524
    Caption = 'Cadastro Tipo Logradouro'
  end
  inherited PANDADOS: TRzPanel
    Width = 524
    Height = 128
    inherited LBLCOD: TRzLabel
      Width = 51
      Height = 16
      Font.Height = -13
    end
    object Label1: TLabel
      Left = 16
      Top = 72
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
    object DBNOME: TRzDBEdit
      Left = 16
      Top = 88
      Width = 497
      Height = 24
      DataSource = DSTL
      DataField = 'NOME_LOG'
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
    end
  end
  inherited EdtBusca: TRzEdit
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 207
    Width = 524
  end
  object DSTL: TDataSource
    DataSet = CDSTL
    Left = 112
    Top = 8
  end
  object CDSTL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSTLIDTIPOLOG: TIntegerField
      FieldName = 'IDTIPOLOG'
      Required = True
    end
    object CDSTLNOME_LOG: TStringField
      FieldName = 'NOME_LOG'
      Required = True
      Size = 50
    end
    object CDSTLSTATUS_LOG: TStringField
      FieldName = 'STATUS_LOG'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLTL
    Left = 48
    Top = 8
  end
  object SQLTL: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'TIPOLOG.IDTIPOLOG,'#13#10'TIPOLOG.NOME_LOG,'#13#10'TIPOLOG.STATUS_' +
      'LOG'#13#10#13#10'FROM TIPOLOG'#13#10#13#10'WHERE TIPOLOG.IDTIPOLOG = :PARTIPOLOG'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARTIPOLOG'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLTLIDTIPOLOG: TIntegerField
      FieldName = 'IDTIPOLOG'
      Required = True
    end
    object SQLTLNOME_LOG: TStringField
      FieldName = 'NOME_LOG'
      Required = True
      Size = 50
    end
    object SQLTLSTATUS_LOG: TStringField
      FieldName = 'STATUS_LOG'
      Required = True
      Size = 1
    end
  end
end
