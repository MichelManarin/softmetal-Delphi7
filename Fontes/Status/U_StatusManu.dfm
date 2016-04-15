inherited FrmStatusManun: TFrmStatusManun
  Left = 357
  Top = 165
  Caption = 'SOFTMETAL - Status de Manunten'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    inherited PnlConteudo: TPanel
      object Label3: TLabel [0]
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
      object Label1: TLabel [1]
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
          Title.Caption = 'CODIGO MAQUNA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDFUNCIONARIO'
          Title.Caption = 'CODIGO FUNCIONARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MANU'
          Title.Caption = 'DESCRI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_MANU'
          Title.Caption = 'TIPO'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_MANU'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Manunte'#231#227'o'
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
