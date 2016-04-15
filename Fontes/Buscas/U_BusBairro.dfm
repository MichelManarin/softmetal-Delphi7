inherited FrmBusBairros: TFrmBusBairros
  Left = 280
  Top = 179
  Caption = 'SOFTMETAL - Busca de Bairros'
  ClientHeight = 420
  ClientWidth = 827
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Width = 827
    Caption = ' Busca de Bairros'
    FullRepaint = True
    GradientColorStart = clSilver
    GradientColorStop = clAppWorkSpace
  end
  inherited PnlCenter: TRzPanel
    Width = 827
    Height = 379
    inherited PANDADOS: TPanel
      Width = 823
      object LblCODINICIAL: TLabel [0]
        Left = 448
        Top = 26
        Width = 81
        Height = 16
        Caption = ' C'#243'digo Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel [1]
        Left = 488
        Top = 58
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
      object Label1: TLabel [2]
        Left = 584
        Top = 26
        Width = 76
        Height = 16
        Caption = ' C'#243'digo Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited RGordenar: TRzRadioGroup
        ItemIndex = 0
        Items.Strings = (
          'CODIGO'
          'NOME')
        TabOrder = 1
      end
      inherited RGsituacao: TRzRadioGroup
        ItemIndex = 0
        TabOrder = 2
      end
      inherited RGfiltra: TRzCheckGroup
        TabOrder = 0
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
        object CheckNome: TRzCheckBox
          Left = 16
          Top = 56
          Width = 48
          Height = 16
          Caption = 'NOME'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          OnClick = CheckNomeClick
        end
      end
      inherited PnlBotoes: TRzPanel
        Left = 720
        Width = 97
        TabOrder = 6
        inherited BtnImprimir: TRzBitBtn
          OnClick = BtnImprimirClick
        end
        inherited BtnBuscar: TRzBitBtn
          Enabled = False
          OnClick = BtnBuscarClick
        end
      end
      object NOME: TRzEdit
        Left = 536
        Top = 56
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 5
      end
      object CODFINAL: TRzEdit
        Left = 664
        Top = 24
        Width = 41
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 4
      end
      object CODINICIAL: TRzEdit
        Left = 536
        Top = 24
        Width = 41
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 3
      end
    end
    inherited Grid: TRzDBGrid
      Width = 823
      Height = 213
      DataSource = DSBairros
      OnDblClick = GridDblClick
      FrameColor = 12164479
      FrameHotStyle = fsGroove
      FixedLineColor = clBlack
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'IDBAIRRO'
          Title.Alignment = taCenter
          Title.Caption = 'CODIGO'
          Width = 77
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOME_BAIRRO'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Width = 606
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'STATUS_BAIRRO'
          Title.Alignment = taCenter
          Title.Caption = 'STATUS'
          Width = 85
          Visible = True
        end>
    end
    inherited BARRASTATUS: TStatusBar
      Top = 358
      Width = 823
    end
  end
  object DSBairros: TDataSource
    DataSet = CDSBairros
    Left = 112
    Top = 8
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLBairros
    Left = 48
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
  object SQLBairros: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'BAIRROS.IDBAIRRO,'#13#10'BAIRROS.NOME_BAIRRO,'#13#10'BAIRROS.STATU' +
      'S_BAIRRO'#13#10#13#10'FROM BAIRROS'#13#10
    MaxBlobSize = -1
    Params = <>
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
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CDSBairros
    Left = 168
    Top = 8
  end
  object RvProject1: TRvProject
    ProjectFile = 
      'C:\Users\adm\Desktop\TCC - SoftMetal\Metalurgica - SoftMetal\Rel' +
      'at'#243'rios\Relbair.rav'
    Left = 208
    Top = 8
  end
end
