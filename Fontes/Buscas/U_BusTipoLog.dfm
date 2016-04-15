inherited FrmBusTipoLog: TFrmBusTipoLog
  Left = 362
  Top = 154
  Caption = 'SOFTMETAL - Tipo Logradouro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Caption = 'Busca Tipo Logradouro'
  end
  inherited PnlCenter: TRzPanel
    inherited PANDADOS: TPanel
      object Label1: TLabel [0]
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
      object LblCODINICIAL: TLabel [1]
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
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'CODIGO')
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
          OnClick = CheckCodClick
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
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
        TabOrder = 4
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
        TabOrder = 5
      end
    end
    inherited Grid: TRzDBGrid
      DataSource = DSTL
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDTIPOLOG'
          Title.Caption = 'CODIGO'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_LOG'
          Title.Caption = 'NOME'
          Width = 678
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_LOG'
          Title.Caption = 'STATUS'
          Width = 72
          Visible = True
        end>
    end
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
      'LOG'#13#10#13#10'FROM TIPOLOG'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
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
