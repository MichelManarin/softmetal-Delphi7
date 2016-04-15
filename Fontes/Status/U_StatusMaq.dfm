inherited FrmStatusMaq: TFrmStatusMaq
  Left = 205
  Top = 139
  Caption = 'SOFTMETAL - Status de Maquinas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    inherited PnlConteudo: TPanel
      object Label3: TLabel [0]
        Left = 456
        Top = 16
        Width = 77
        Height = 16
        Caption = 'Codigo Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [1]
        Left = 600
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
          Top = 32
          Width = 59
          Height = 16
          Caption = 'CODIGO'
          State = cbUnchecked
          TabOrder = 0
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
        Left = 600
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
        Left = 456
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
      DataSource = DSMAQ
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDMAQUINA'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MAQ'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 341
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMSERIE_MAQ'
          Title.Caption = 'NUMERO DE SERIE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_MAQ'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Maquinas'
  end
  object DSMAQ: TDataSource
    DataSet = CDSMAQ
    Left = 112
    Top = 8
  end
  object CDSMAQ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSMAQIDMAQUINA: TIntegerField
      FieldName = 'IDMAQUINA'
      Required = True
    end
    object CDSMAQDESC_MAQ: TStringField
      FieldName = 'DESC_MAQ'
      Required = True
      Size = 300
    end
    object CDSMAQNUMSERIE_MAQ: TStringField
      FieldName = 'NUMSERIE_MAQ'
      Required = True
    end
    object CDSMAQSTATUS_MAQ: TStringField
      FieldName = 'STATUS_MAQ'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLMAQ
    Left = 48
    Top = 8
  end
  object SQLMAQ: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'MAQUINAS.IDMAQUINA,'#13#10'MAQUINAS.DESC_MAQ,'#13#10'MAQUINAS.NUMS' +
      'ERIE_MAQ,'#13#10'MAQUINAS.STATUS_MAQ'#13#10#13#10'FROM MAQUINAS'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLMAQIDMAQUINA: TIntegerField
      FieldName = 'IDMAQUINA'
      Required = True
    end
    object SQLMAQDESC_MAQ: TStringField
      FieldName = 'DESC_MAQ'
      Required = True
      Size = 300
    end
    object SQLMAQNUMSERIE_MAQ: TStringField
      FieldName = 'NUMSERIE_MAQ'
      Required = True
    end
    object SQLMAQSTATUS_MAQ: TStringField
      FieldName = 'STATUS_MAQ'
      Required = True
      Size = 1
    end
  end
end
