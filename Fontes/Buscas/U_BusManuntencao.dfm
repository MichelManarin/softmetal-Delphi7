inherited FrmBusManun: TFrmBusManun
  Left = 376
  Top = 179
  Caption = 'SOFTMETAL - Busca de Manunten'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Caption = 'Busca de Manunten'#231#227'o'
  end
  inherited PnlCenter: TRzPanel
    inherited PANDADOS: TPanel
      object Label1: TLabel [0]
        Left = 456
        Top = 16
        Width = 77
        Height = 14
        Caption = 'CODIGO INICIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel [1]
        Left = 456
        Top = 56
        Width = 59
        Height = 14
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [2]
        Left = 600
        Top = 16
        Width = 72
        Height = 14
        Caption = 'CODIGO FINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited RGordenar: TRzRadioGroup
        ItemHeight = 25
        Items.Strings = (
          'CODIGO'
          'DESCRI'#199#195'O'
          'HORA'
          'DATA')
        VerticalSpacing = 0
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
        object CheckDesc: TRzCheckBox
          Left = 16
          Top = 48
          Width = 78
          Height = 16
          Caption = 'DESCRI'#199#195'O'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          OnClick = CheckDescClick
        end
        object CheckData: TRzCheckBox
          Left = 16
          Top = 72
          Width = 46
          Height = 16
          Caption = 'DATA'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          OnClick = CheckDataClick
        end
        object CheckHora: TRzCheckBox
          Left = 16
          Top = 96
          Width = 49
          Height = 16
          Caption = 'HORA'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 3
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      object DTBUS: TRzEdit
        Left = 456
        Top = 104
        Width = 137
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
        TabOrder = 4
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
        TabOrder = 5
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
      object BUSHR: TRzEdit
        Left = 600
        Top = 104
        Width = 137
        Height = 22
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOrder = 8
      end
    end
    inherited Grid: TRzDBGrid
      DataSource = DSMAN
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDMANUNTENCAO'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDMAQUINA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDFUNCIONARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MANU'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_MANU'
          Title.Caption = 'TIPO'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_MANU'
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HR_MANU'
          Title.Caption = 'HORA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_MANU'
          Title.Caption = 'OBSERVA'#199#195'O'
          Width = 203
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_MANU'
          Title.Caption = 'STATUS'
          Width = 73
          Visible = True
        end>
    end
  end
  object DSMAN: TDataSource
    DataSet = CDSMAN
    Left = 112
    Top = 8
  end
  object CDSMAN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSMANIDMANUNTENCAO: TIntegerField
      FieldName = 'IDMANUNTENCAO'
      Required = True
    end
    object CDSMANIDMAQUINA: TIntegerField
      FieldName = 'IDMAQUINA'
      Required = True
    end
    object CDSMANIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Required = True
    end
    object CDSMANDESC_MANU: TStringField
      FieldName = 'DESC_MANU'
      Required = True
      Size = 100
    end
    object CDSMANTIPO_MANU: TStringField
      FieldName = 'TIPO_MANU'
      Required = True
      Size = 1
    end
    object CDSMANDT_MANU: TDateField
      FieldName = 'DT_MANU'
      Required = True
    end
    object CDSMANHR_MANU: TTimeField
      FieldName = 'HR_MANU'
      Required = True
    end
    object CDSMANOBS_MANU: TStringField
      FieldName = 'OBS_MANU'
      Size = 100
    end
    object CDSMANSTATUS_MANU: TStringField
      FieldName = 'STATUS_MANU'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLMAN
    Left = 48
    Top = 8
  end
  object SQLMAN: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'MANUNTENCAO.IDMANUNTENCAO,'#13#10'MANUNTENCAO.IDMAQUINA,'#13#10'MA' +
      'NUNTENCAO.IDFUNCIONARIO,'#13#10'MANUNTENCAO.DESC_MANU,'#13#10'MANUNTENCAO.TI' +
      'PO_MANU,'#13#10'MANUNTENCAO.DT_MANU,'#13#10'MANUNTENCAO.HR_MANU,'#13#10'MANUNTENCA' +
      'O.STATUS_MANU,'#13#10'MANUNTENCAO.OBS_MANU'#13#10#13#10'FROM MANUNTENCAO'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLMANIDMANUNTENCAO: TIntegerField
      FieldName = 'IDMANUNTENCAO'
      Required = True
    end
    object SQLMANIDMAQUINA: TIntegerField
      FieldName = 'IDMAQUINA'
      Required = True
    end
    object SQLMANIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Required = True
    end
    object SQLMANDESC_MANU: TStringField
      FieldName = 'DESC_MANU'
      Required = True
      Size = 100
    end
    object SQLMANTIPO_MANU: TStringField
      FieldName = 'TIPO_MANU'
      Required = True
      Size = 1
    end
    object SQLMANDT_MANU: TDateField
      FieldName = 'DT_MANU'
      Required = True
    end
    object SQLMANHR_MANU: TTimeField
      FieldName = 'HR_MANU'
      Required = True
    end
    object SQLMANOBS_MANU: TStringField
      FieldName = 'OBS_MANU'
      Size = 100
    end
    object SQLMANSTATUS_MANU: TStringField
      FieldName = 'STATUS_MANU'
      Required = True
      Size = 1
    end
  end
end
