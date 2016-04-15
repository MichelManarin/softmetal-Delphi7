inherited FrmCadGrup: TFrmCadGrup
  Left = 387
  Top = 136
  Caption = 'SOFTMETAL - Cadastro de Grupo'
  ClientHeight = 272
  ClientWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANBOTOES: TPanel
    Top = 215
    Width = 590
    inherited BtnGravar: TRzButton
      OnKeyDown = BtnGravarKeyDown
    end
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 590
    Caption = 'Cadastro de Grupos'
  end
  inherited PANDADOS: TRzPanel
    Width = 590
    Height = 174
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
    object Label2: TLabel
      Left = 16
      Top = 120
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
    object DBNOME: TRzDBEdit
      Left = 16
      Top = 88
      Width = 329
      Height = 22
      DataSource = DSGru
      DataField = 'NOME_GRU'
      Enabled = False
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 0
    end
    object DBDESC: TRzDBEdit
      Left = 16
      Top = 136
      Width = 561
      Height = 22
      DataSource = DSGru
      DataField = 'DESC_GRU'
      Enabled = False
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 1
    end
  end
  inherited EdtBusca: TRzEdit
    OnKeyDown = EdtBuscaKeyDown
  end
  inherited BARRASTATUS: TStatusBar
    Top = 253
    Width = 590
  end
  object DSGru: TDataSource
    DataSet = CDSGru
    Left = 112
    Top = 8
  end
  object CDSGru: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSGruIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object CDSGruNOME_GRU: TStringField
      FieldName = 'NOME_GRU'
      Required = True
      Size = 25
    end
    object CDSGruDESC_GRU: TStringField
      FieldName = 'DESC_GRU'
      Required = True
      Size = 100
    end
    object CDSGruSTATUS_GRU: TStringField
      FieldName = 'STATUS_GRU'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLGru
    Left = 48
    Top = 8
  end
  object SQLGru: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'GRUPOS.IDGRUPO,'#13#10'GRUPOS.NOME_GRU,'#13#10'GRUPOS.DESC_GRU,'#13#10'G' +
      'RUPOS.STATUS_GRU'#13#10#13#10#13#10'FROM GRUPOS'#13#10#13#10#13#10'WHERE GRUPOS.IDGRUPO = :P' +
      'ARGRUPO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARGRUPO'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLGruIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object SQLGruNOME_GRU: TStringField
      FieldName = 'NOME_GRU'
      Required = True
      Size = 25
    end
    object SQLGruDESC_GRU: TStringField
      FieldName = 'DESC_GRU'
      Required = True
      Size = 100
    end
    object SQLGruSTATUS_GRU: TStringField
      FieldName = 'STATUS_GRU'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
