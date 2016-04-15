inherited FrmStatusBai: TFrmStatusBai
  Left = 347
  Top = 169
  Caption = 'SOFTMETAL - Status de Bairro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    inherited PnlConteudo: TPanel
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
      object Label2: TLabel [2]
        Left = 464
        Top = 66
        Width = 38
        Height = 16
        Caption = ' Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'CODIGO'
          'NOME')
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
      object NOME: TRzEdit
        Left = 464
        Top = 80
        Width = 281
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 6
      end
    end
    inherited Grid: TRzDBGrid
      DataSource = DSBAIR
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDBAIRRO'
          Title.Caption = 'CODIGO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_BAIRRO'
          Title.Caption = 'NOME'
          Width = 750
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_BAIRRO'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status Bairro'
  end
  object CheckCod: TRzCheckBox [2]
    Left = 24
    Top = 80
    Width = 61
    Height = 15
    Caption = 'CODIGO'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 2
    OnClick = CheckCodClick
  end
  object CheckNome: TRzCheckBox [3]
    Left = 24
    Top = 112
    Width = 51
    Height = 15
    Caption = 'NOME'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 3
    OnClick = CheckNomeClick
  end
  object DSBAIR: TDataSource
    DataSet = CDSBAIR
    Left = 112
    Top = 8
  end
  object CDSBAIR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSBAIRIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object CDSBAIRNOME_BAIRRO: TStringField
      FieldName = 'NOME_BAIRRO'
      Required = True
      Size = 50
    end
    object CDSBAIRSTATUS_BAIRRO: TStringField
      FieldName = 'STATUS_BAIRRO'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLBAIR
    Left = 48
    Top = 8
  end
  object SQLBAIR: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'BAIRROS.IDBAIRRO,'#13#10'BAIRROS.NOME_BAIRRO,'#13#10'BAIRROS.STATU' +
      'S_BAIRRO'#13#10#13#10'FROM BAIRROS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLBAIRIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object SQLBAIRNOME_BAIRRO: TStringField
      FieldName = 'NOME_BAIRRO'
      Required = True
      Size = 50
    end
    object SQLBAIRSTATUS_BAIRRO: TStringField
      FieldName = 'STATUS_BAIRRO'
      Required = True
      Size = 1
    end
  end
end
