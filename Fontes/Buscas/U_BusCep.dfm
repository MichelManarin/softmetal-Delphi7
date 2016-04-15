inherited FrmBusCep: TFrmBusCep
  Left = 245
  Top = 181
  Caption = 'SOFTMETA - Busca de Ceps'
  ClientHeight = 458
  ClientWidth = 911
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Width = 911
    Caption = 'Buscas de Ceps'
  end
  inherited PnlCenter: TRzPanel
    Width = 911
    Height = 417
    inherited PANDADOS: TPanel
      Width = 907
      Height = 135
      object LblCODINICIAL: TLabel [0]
        Left = 456
        Top = 16
        Width = 68
        Height = 16
        Caption = ' Cod. Inicial'
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
        Width = 31
        Height = 16
        Caption = ' CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [2]
        Left = 536
        Top = 16
        Width = 59
        Height = 16
        Caption = 'Cod. Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [3]
        Left = 616
        Top = 16
        Width = 92
        Height = 16
        Caption = 'Tipo Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [4]
        Left = 616
        Top = 56
        Width = 64
        Height = 16
        Caption = 'Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited RGordenar: TRzRadioGroup
        ItemHeight = 23
        Items.Strings = (
          'CODIGO'
          'CEP'
          'LOGRADOURO')
      end
      inherited RGfiltra: TRzCheckGroup
        object CheckCod: TRzCheckBox
          Left = 8
          Top = 16
          Width = 59
          Height = 16
          Caption = 'CODIGO'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 0
          OnClick = CheckCodClick
        end
        object CheckCep: TRzCheckBox
          Left = 8
          Top = 32
          Width = 38
          Height = 16
          Caption = 'CEP'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
        end
        object CheckLo: TRzCheckBox
          Left = 8
          Top = 48
          Width = 93
          Height = 16
          Caption = 'LOGRADOURO'
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
      object NAMEBUS: TRzEdit
        Left = 456
        Top = 72
        Width = 145
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
      object CODFINAL: TRzEdit
        Left = 536
        Top = 32
        Width = 65
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
      object CODINICIAL: TRzEdit
        Left = 456
        Top = 32
        Width = 65
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
        TabOrder = 6
      end
      object TLbus: TRzEdit
        Left = 616
        Top = 32
        Width = 185
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
      object LOUbus: TRzEdit
        Left = 616
        Top = 72
        Width = 185
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
        TabOrder = 8
      end
    end
    inherited Grid: TRzDBGrid
      Top = 137
      Width = 907
      Height = 259
      DataSource = DSCEP
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCEP_CEP'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP_CEP'
          Title.Caption = 'CEP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOG_CEP'
          Title.Caption = 'LOGRADOURO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_CEP'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
    inherited BARRASTATUS: TStatusBar
      Top = 396
      Width = 907
    end
  end
  object SQLCEP: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CEPS.IDCEP_CEP,'#13#10'CEPS.CEP_CEP,'#13#10'CEPS.LOG_CEP,'#13#10'CEPS.ST' +
      'ATUS_CEP'#13#10#13#10#13#10'FROM CEPS'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCEPIDCEP_CEP: TIntegerField
      FieldName = 'IDCEP_CEP'
      Required = True
    end
    object SQLCEPCEP_CEP: TStringField
      FieldName = 'CEP_CEP'
      Required = True
      Size = 8
    end
    object SQLCEPLOG_CEP: TStringField
      FieldName = 'LOG_CEP'
      Size = 100
    end
    object SQLCEPSTATUS_CEP: TStringField
      FieldName = 'STATUS_CEP'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCEP
    Left = 48
    Top = 8
  end
  object CDSCEP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCEPIDCEP_CEP: TIntegerField
      FieldName = 'IDCEP_CEP'
      Required = True
    end
    object CDSCEPCEP_CEP: TStringField
      FieldName = 'CEP_CEP'
      Required = True
      Size = 8
    end
    object CDSCEPLOG_CEP: TStringField
      FieldName = 'LOG_CEP'
      Size = 100
    end
    object CDSCEPSTATUS_CEP: TStringField
      FieldName = 'STATUS_CEP'
      Required = True
      Size = 1
    end
  end
  object DSCEP: TDataSource
    DataSet = CDSCEP
    Left = 112
    Top = 8
  end
end
