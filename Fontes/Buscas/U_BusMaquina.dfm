inherited FrmBusMaq: TFrmBusMaq
  Left = 433
  Top = 123
  Caption = 'SOFTMETAL - Busca Maquinas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Caption = 'Busca Maquinas'
  end
  inherited PnlCenter: TRzPanel
    inherited PANDADOS: TPanel
      object Label4: TLabel [0]
        Left = 744
        Top = 16
        Width = 66
        Height = 16
        Caption = 'N'#186' de Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [1]
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
      object Label2: TLabel [2]
        Left = 456
        Top = 56
        Width = 58
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [3]
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
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'CODIGO'
          'DESCRI'#199#195'O'
          'NUMERO DE SERIE')
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
        object CheckDes: TRzCheckBox
          Left = 16
          Top = 48
          Width = 78
          Height = 16
          Caption = 'DESCRI'#199#195'O'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
        end
        object CheckNS: TRzCheckBox
          Left = 16
          Top = 72
          Width = 109
          Height = 16
          Caption = 'NUMERO DE SERIE'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
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
      object NSBUS: TRzEdit
        Left = 744
        Top = 32
        Width = 41
        Height = 22
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        ParentFont = False
        TabOrder = 5
      end
      object DESCBUS: TRzEdit
        Left = 456
        Top = 72
        Width = 281
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 6
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
        TabOrder = 7
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
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MAQ'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 665
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMSERIE_MAQ'
          Title.Caption = 'NUMERO DE SERIE'
          Width = 112
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
