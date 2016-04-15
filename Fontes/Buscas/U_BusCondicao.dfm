inherited FrmBusCon: TFrmBusCon
  Left = 280
  Top = 174
  Caption = 'SOFTMETA - Buscas de Condi'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Caption = 'Buscas de Condi'#231#245'es'
  end
  inherited PnlCenter: TRzPanel
    inherited PANDADOS: TPanel
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
      object Label2: TLabel [1]
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
      object Label1: TLabel [2]
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
      object Label4: TLabel [3]
        Left = 744
        Top = 16
        Width = 67
        Height = 16
        Caption = 'N'#186' de Parc.'
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
          'N'#186' DE PARCELAS')
      end
      inherited RGfiltra: TRzCheckGroup
        object CheckDES: TRzCheckBox
          Left = 16
          Top = 48
          Width = 78
          Height = 16
          Caption = 'DESCRI'#199#195'O'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 0
          OnClick = CheckDesClick
        end
        object CheckNP: TRzCheckBox
          Left = 16
          Top = 80
          Width = 135
          Height = 16
          Caption = 'NUMERO DE PARCELAS'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          OnClick = CheckNPClick
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
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
        TabOrder = 4
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
        TabOrder = 5
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
        TabOrder = 6
      end
      object PARCBUS: TRzEdit
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
        TabOrder = 7
      end
    end
    inherited Grid: TRzDBGrid
      DataSource = DSCOND
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCONDI_COND'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRI_COND'
          Title.Caption = 'DESCRI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMPAR_COND'
          Title.Caption = 'NUMERO DE PARCELAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIASPRI_COND'
          Title.Caption = 'DIAS PRIMEIRA PARC.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIASENTRE_COND'
          Title.Caption = 'DIAS ENTRE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERJUROS_COND'
          Title.Caption = 'PERC. JUROS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_COND'
          Title.Caption = 'OBSERVA'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_COND'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  object CheckCOD: TRzCheckBox [2]
    Left = 24
    Top = 72
    Width = 59
    Height = 16
    Caption = 'CODIGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    State = cbUnchecked
    TabOrder = 2
    OnClick = CheckCodClick
  end
  object SQLCOND: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CONDICOES.IDCONDI_COND,'#13#10'CONDICOES.DESCRI_COND,'#13#10'CONDI' +
      'COES.NUMPAR_COND,'#13#10'CONDICOES.DIASPRI_COND,'#13#10'CONDICOES.DIASENTRE_' +
      'COND,'#13#10'CONDICOES.PERJUROS_COND,'#13#10'CONDICOES.OBS_COND,'#13#10'CONDICOES.' +
      'STATUS_COND'#13#10#13#10'FROM CONDICOES'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCONDIDCONDI_COND: TIntegerField
      FieldName = 'IDCONDI_COND'
      Required = True
    end
    object SQLCONDDESCRI_COND: TStringField
      FieldName = 'DESCRI_COND'
      Size = 50
    end
    object SQLCONDNUMPAR_COND: TIntegerField
      FieldName = 'NUMPAR_COND'
    end
    object SQLCONDDIASPRI_COND: TIntegerField
      FieldName = 'DIASPRI_COND'
    end
    object SQLCONDDIASENTRE_COND: TIntegerField
      FieldName = 'DIASENTRE_COND'
    end
    object SQLCONDPERJUROS_COND: TBCDField
      FieldName = 'PERJUROS_COND'
      Precision = 9
      Size = 2
    end
    object SQLCONDOBS_COND: TStringField
      FieldName = 'OBS_COND'
      Size = 100
    end
    object SQLCONDSTATUS_COND: TStringField
      FieldName = 'STATUS_COND'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCOND
    Left = 48
    Top = 8
  end
  object CDSCOND: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCONDIDCONDI_COND: TIntegerField
      FieldName = 'IDCONDI_COND'
      Required = True
    end
    object CDSCONDDESCRI_COND: TStringField
      FieldName = 'DESCRI_COND'
      Size = 50
    end
    object CDSCONDNUMPAR_COND: TIntegerField
      FieldName = 'NUMPAR_COND'
    end
    object CDSCONDDIASPRI_COND: TIntegerField
      FieldName = 'DIASPRI_COND'
    end
    object CDSCONDDIASENTRE_COND: TIntegerField
      FieldName = 'DIASENTRE_COND'
    end
    object CDSCONDPERJUROS_COND: TBCDField
      FieldName = 'PERJUROS_COND'
      Precision = 9
      Size = 2
    end
    object CDSCONDOBS_COND: TStringField
      FieldName = 'OBS_COND'
      Size = 100
    end
    object CDSCONDSTATUS_COND: TStringField
      FieldName = 'STATUS_COND'
      Required = True
      Size = 1
    end
  end
  object DSCOND: TDataSource
    DataSet = CDSCOND
    Left = 112
    Top = 8
  end
end
