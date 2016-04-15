inherited FrmStatusCar: TFrmStatusCar
  Left = 239
  Top = 158
  Caption = 'SOFTMETAL - Status de cargo'
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
        Left = 624
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
          OnClick = CheckCODClick
        end
      end
      inherited PnlBotoes: TRzPanel
        Left = 768
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'Codigo')
      end
      object CODFINAL: TRzEdit
        Left = 624
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
      DataSource = DSCARG
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCARGO'
          Title.Caption = 'CODIGO'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CARGO'
          Title.Caption = 'NOME'
          Width = 718
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_CARGO'
          Title.Caption = 'STATUS'
          Width = 70
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Cargo'
  end
  object DSCARG: TDataSource
    DataSet = CDSCARG
    Left = 112
    Top = 8
  end
  object CDSCARG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCARGIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      Required = True
    end
    object CDSCARGNOME_CARGO: TStringField
      FieldName = 'NOME_CARGO'
      Required = True
      Size = 30
    end
    object CDSCARGSTATUS_CARGO: TStringField
      FieldName = 'STATUS_CARGO'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCARG
    Left = 48
    Top = 8
  end
  object SQLCARG: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CARGOS.IDCARGO,'#13#10'CARGOS.NOME_CARGO,'#13#10'CARGOS.STATUS_CAR' +
      'GO'#13#10#13#10'FROM CARGOS'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCARGIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
      Required = True
    end
    object SQLCARGNOME_CARGO: TStringField
      FieldName = 'NOME_CARGO'
      Required = True
      Size = 30
    end
    object SQLCARGSTATUS_CARGO: TStringField
      FieldName = 'STATUS_CARGO'
      Required = True
      Size = 1
    end
  end
end
