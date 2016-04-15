inherited FrmStatusCid: TFrmStatusCid
  Left = 390
  Top = 167
  Caption = 'SOFTMETAL - Status de Cidade'
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
      object Label3: TLabel [3]
        Left = 752
        Top = 64
        Width = 17
        Height = 16
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited RGfiltra: TRzCheckGroup
        object CheckCOD: TRzCheckBox
          Left = 14
          Top = 24
          Width = 59
          Height = 16
          Caption = 'CODIGO'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 0
          OnClick = CheckCodClick
        end
        object CheckUF: TRzCheckBox
          Left = 14
          Top = 72
          Width = 32
          Height = 16
          Caption = 'UF'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          OnClick = CheckUFClick
        end
        object CheckNome: TRzCheckBox
          Left = 14
          Top = 48
          Width = 48
          Height = 16
          Caption = 'NOME'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          OnClick = CheckNomeClick
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'Codigo')
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
      object NAMEBUS: TRzEdit
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
      object UFBUS: TRzEdit
        Left = 752
        Top = 80
        Width = 33
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 7
      end
    end
    inherited Grid: TRzDBGrid
      DataSource = DSCID
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCIDADE'
          Title.Caption = 'CODIGO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CID'
          Title.Caption = 'NOME'
          Width = 700
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF_CID'
          Title.Caption = 'UF'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_CID'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status Cidades'
  end
  object DSCID: TDataSource
    DataSet = CDSCID
    Left = 112
    Top = 8
  end
  object CDSCID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCIDIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object CDSCIDNOME_CID: TStringField
      FieldName = 'NOME_CID'
      Required = True
      Size = 50
    end
    object CDSCIDUF_CID: TStringField
      FieldName = 'UF_CID'
      Required = True
      Size = 2
    end
    object CDSCIDSTATUS_CID: TStringField
      FieldName = 'STATUS_CID'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCID
    Left = 48
    Top = 8
  end
  object SQLCID: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' '#13#10'CIDADES. IDCIDADE,'#13#10'CIDADES. NOME_CID,'#13#10'CIDADES. UF_C' +
      'ID,'#13#10'CIDADES. STATUS_CID'#13#10#13#10'FROM CIDADES'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCIDIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object SQLCIDNOME_CID: TStringField
      FieldName = 'NOME_CID'
      Required = True
      Size = 50
    end
    object SQLCIDUF_CID: TStringField
      FieldName = 'UF_CID'
      Required = True
      Size = 2
    end
    object SQLCIDSTATUS_CID: TStringField
      FieldName = 'STATUS_CID'
      Required = True
      Size = 1
    end
  end
end
