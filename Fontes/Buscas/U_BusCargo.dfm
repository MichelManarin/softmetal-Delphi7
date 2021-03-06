inherited FrmBusCargos: TFrmBusCargos
  Left = 299
  Top = 121
  Caption = 'SOFTMETA - Busca de Cargos'
  ClientHeight = 439
  ClientWidth = 834
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Width = 834
    Caption = 'Busca de Cargos'
  end
  inherited PnlCenter: TRzPanel
    Width = 834
    Height = 398
    inherited PANDADOS: TPanel
      Width = 830
      object Label1: TLabel [0]
        Left = 592
        Top = 32
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
      object Label2: TLabel [1]
        Left = 488
        Top = 64
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
      object LblCODINICIAL: TLabel [2]
        Left = 448
        Top = 32
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
        object CheckCOD: TRzCheckBox
          Left = 16
          Top = 24
          Width = 62
          Height = 16
          Caption = ' CODIGO'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 0
          OnClick = CheckCODClick
        end
        object CheckNome: TRzCheckBox
          Left = 16
          Top = 48
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
        TabOrder = 6
        inherited BtnBuscar: TRzBitBtn
          Enabled = False
          OnClick = BtnBuscarClick
        end
      end
      object CODFINAL: TRzEdit
        Left = 672
        Top = 32
        Width = 33
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 4
        OnKeyPress = CODFINALKeyPress
      end
      object CODINICIAL: TRzEdit
        Left = 536
        Top = 32
        Width = 33
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 3
        OnKeyPress = CODINICIALKeyPress
      end
      object NOME: TRzEdit
        Left = 536
        Top = 64
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 5
      end
    end
    inherited Grid: TRzDBGrid
      Width = 830
      Height = 232
      DataSource = DSCargos
      Font.Height = -15
      TitleFont.Height = -13
      OnDblClick = GridDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'IDCARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOME_CARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Width = 651
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'STATUS_CARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'STATUS'
          Width = 75
          Visible = True
        end>
    end
    inherited BARRASTATUS: TStatusBar
      Top = 377
      Width = 830
    end
  end
  object SQLCargos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CARGOS.IDCARGO,'#13#10'CARGOS.NOME_CARGO,'#13#10'CARGOS.STATUS_CAR' +
      'GO'#13#10#13#10'FROM CARGOS'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
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
  object PROVIDER: TDataSetProvider
    DataSet = SQLCargos
    Left = 48
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
  object DSCargos: TDataSource
    DataSet = CDSCargos
    Left = 112
    Top = 8
  end
end
