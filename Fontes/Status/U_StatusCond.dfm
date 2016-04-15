inherited FrmStatusCond: TFrmStatusCond
  Left = 236
  Top = 157
  Width = 988
  Caption = 'SOFTMETAL - Status de Condi'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    Width = 972
    inherited PnlConteudo: TPanel
      Width = 968
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
      inherited RGfiltra: TRzCheckGroup
        object CheckCOd: TRzCheckBox
          Left = 16
          Top = 32
          Width = 59
          Height = 16
          Caption = 'CODIGO'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 0
          OnClick = CheckCOdClick
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'CODIGO')
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
    end
    inherited BARRASTATUS: TRzStatusBar
      Width = 968
    end
    inherited Grid: TRzDBGrid
      Width = 968
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
          Title.Caption = 'DIAS PRIMEIRAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIASENTRE_COND'
          Title.Caption = 'DIAS ENTRE PARC.'
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
  inherited PnlTitle: TRzPanel
    Width = 972
    Caption = 'Status de Condi'#231#245'es'
  end
  object DSCOND: TDataSource
    DataSet = CDSCOND
    Left = 112
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
  object PROVIDER: TDataSetProvider
    DataSet = SQLCOND
    Left = 48
    Top = 8
  end
  object SQLCOND: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CONDICOES.IDCONDI_COND,'#13#10'CONDICOES.DESCRI_COND,'#13#10'CONDI' +
      'COES.NUMPAR_COND,'#13#10'CONDICOES.DIASPRI_COND,'#13#10'CONDICOES.DIASENTRE_' +
      'COND,'#13#10'CONDICOES.PERJUROS_COND,'#13#10'CONDICOES.OBS_COND,'#13#10'CONDICOES.' +
      'STATUS_COND'#13#10#13#10'FROM CONDICOES'#13#10
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
end
