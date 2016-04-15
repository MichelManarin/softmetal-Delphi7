inherited FrmBusGrup: TFrmBusGrup
  Left = 252
  Top = 143
  Caption = 'SOFTMETAL - Busca de Grupos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Caption = 'Busca de Grupos'
  end
  inherited PnlCenter: TRzPanel
    inherited PANDADOS: TPanel
      object LblCODINICIAL: TLabel [0]
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
      object Label1: TLabel [1]
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
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'CODIGO'
          'NOME')
      end
      inherited RGfiltra: TRzCheckGroup
        object CheckCod: TRzCheckBox
          Left = 16
          Top = 32
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
      object CODFINAL: TRzEdit
        Left = 608
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
        Left = 464
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
      DataSource = DSGru
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDGRUPO'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_GRU'
          Title.Caption = 'NOME'
          Width = 151
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_GRU'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 599
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_GRU'
          Title.Caption = 'STATUS'
          Width = 68
          Visible = True
        end>
    end
  end
  inherited tempo: TTimer
    Left = 128
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
      'RUPOS.STATUS_GRU'#13#10#13#10#13#10'FROM GRUPOS'#13#10
    MaxBlobSize = -1
    Params = <>
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
