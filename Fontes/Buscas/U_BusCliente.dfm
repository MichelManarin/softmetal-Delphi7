inherited FrmBusClien: TFrmBusClien
  Left = 236
  Top = 165
  Width = 1006
  Caption = 'SOFTMETAL - Busca de Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Width = 990
    Caption = 'Busca Cliente'
  end
  inherited PnlCenter: TRzPanel
    Width = 990
    inherited PANDADOS: TPanel
      Width = 986
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
      object Label2: TLabel [2]
        Left = 600
        Top = 64
        Width = 83
        Height = 16
        Caption = 'Data Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [3]
        Left = 456
        Top = 64
        Width = 34
        Height = 16
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'Codigo'
          'Nome')
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
        object CheckDtcad: TRzCheckBox
          Left = 16
          Top = 72
          Width = 106
          Height = 16
          Caption = 'DATA CADASTRO'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnImprimir: TRzBitBtn
          OnClick = BtnImprimirClick
        end
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
      object BUSNOME: TRzEdit
        Left = 456
        Top = 80
        Width = 137
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 6
      end
      object BUSCDT: TRzEdit
        Left = 600
        Top = 80
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
      Width = 986
      DataSource = DSCLIEN
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCLIENTE'
          Title.Caption = 'CODIGO'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEFAN_CLIEN'
          Title.Caption = 'NOME FANTASIA'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF_CLIEN'
          Title.Caption = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG_CLIEN'
          Title.Caption = 'RG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELRES_CLIEN'
          Title.Caption = 'TEL. RESIDENCIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEXO_CLIEN'
          Title.Caption = 'SEXO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_CLIEN'
          Title.Caption = 'OBSERVA'#199#195'O'
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_CLIEN'
          Title.Caption = 'STATUS'
          Width = 100
          Visible = True
        end>
    end
    inherited BARRASTATUS: TStatusBar
      Width = 986
    end
  end
  object DSCLIEN: TDataSource
    DataSet = CDSCLIEN
    Left = 112
    Top = 8
  end
  object CDSCLIEN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSCLIENIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object CDSCLIENRS_CLIEN: TStringField
      FieldName = 'RS_CLIEN'
      Required = True
      Size = 60
    end
    object CDSCLIENNOMEFAN_CLIEN: TStringField
      FieldName = 'NOMEFAN_CLIEN'
      Size = 60
    end
    object CDSCLIENCPF_CLIEN: TStringField
      FieldName = 'CPF_CLIEN'
      Size = 11
    end
    object CDSCLIENCNPJ_CLIEN: TStringField
      FieldName = 'CNPJ_CLIEN'
      Size = 14
    end
    object CDSCLIENIE_CLIEN: TStringField
      FieldName = 'IE_CLIEN'
      Size = 14
    end
    object CDSCLIENRG_CLIEN: TStringField
      FieldName = 'RG_CLIEN'
      Size = 11
    end
    object CDSCLIENTELRES_CLIEN: TStringField
      FieldName = 'TELRES_CLIEN'
      Size = 11
    end
    object CDSCLIENTELCEL_CLIEN: TStringField
      FieldName = 'TELCEL_CLIEN'
      Size = 11
    end
    object CDSCLIENDTANASC_CLIEN: TDateField
      FieldName = 'DTANASC_CLIEN'
    end
    object CDSCLIENCOMPLEMENTO_CLIEN: TStringField
      FieldName = 'COMPLEMENTO_CLIEN'
      Size = 12
    end
    object CDSCLIENEMAIL_CLIEN: TStringField
      FieldName = 'EMAIL_CLIEN'
      Size = 100
    end
    object CDSCLIENFAX_CLIEN: TStringField
      FieldName = 'FAX_CLIEN'
      Size = 11
    end
    object CDSCLIENTELCOM_CLIEN: TStringField
      FieldName = 'TELCOM_CLIEN'
      Size = 11
    end
    object CDSCLIENSEXO_CLIEN: TStringField
      FieldName = 'SEXO_CLIEN'
      FixedChar = True
      Size = 1
    end
    object CDSCLIENDTCAD_CLIEN: TDateField
      FieldName = 'DTCAD_CLIEN'
    end
    object CDSCLIENOBS_CLIEN: TStringField
      FieldName = 'OBS_CLIEN'
      Size = 100
    end
    object CDSCLIENSTATUS_CLIEN: TStringField
      FieldName = 'STATUS_CLIEN'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLCLIEN
    Left = 48
    Top = 8
  end
  object SQLCLIEN: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CLIENTES.IDCLIENTE, '#13#10' CLIENTES.RS_CLIEN, '#13#10' CLIENTES.' +
      'NOMEFAN_CLIEN,'#13#10' CLIENTES. CPF_CLIEN, '#13#10' CLIENTES.CNPJ_CLIEN, '#13#10 +
      ' CLIENTES.IE_CLIEN,'#13#10' CLIENTES. RG_CLIEN,'#13#10' CLIENTES. TELRES_CLI' +
      'EN,'#13#10' CLIENTES. TELCEL_CLIEN,'#13#10' CLIENTES. DTANASC_CLIEN, '#13#10' CLIE' +
      'NTES.COMPLEMENTO_CLIEN,'#13#10' CLIENTES.EMAIL_CLIEN,'#13#10' CLIENTES. FAX_' +
      'CLIEN, '#13#10' CLIENTES.TELCOM_CLIEN, '#13#10' CLIENTES.SEXO_CLIEN,'#13#10' CLIEN' +
      'TES. DTCAD_CLIEN,'#13#10' CLIENTES. OBS_CLIEN,'#13#10' CLIENTES. STATUS_CLIE' +
      'N'#13#10#13#10#13#10#13#10'FROM CLIENTES'#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLCLIENIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object SQLCLIENRS_CLIEN: TStringField
      FieldName = 'RS_CLIEN'
      Required = True
      Size = 60
    end
    object SQLCLIENNOMEFAN_CLIEN: TStringField
      FieldName = 'NOMEFAN_CLIEN'
      Size = 60
    end
    object SQLCLIENCPF_CLIEN: TStringField
      FieldName = 'CPF_CLIEN'
      Size = 11
    end
    object SQLCLIENCNPJ_CLIEN: TStringField
      FieldName = 'CNPJ_CLIEN'
      Size = 14
    end
    object SQLCLIENIE_CLIEN: TStringField
      FieldName = 'IE_CLIEN'
      Size = 14
    end
    object SQLCLIENRG_CLIEN: TStringField
      FieldName = 'RG_CLIEN'
      Size = 11
    end
    object SQLCLIENTELRES_CLIEN: TStringField
      FieldName = 'TELRES_CLIEN'
      Size = 11
    end
    object SQLCLIENTELCEL_CLIEN: TStringField
      FieldName = 'TELCEL_CLIEN'
      Size = 11
    end
    object SQLCLIENDTANASC_CLIEN: TDateField
      FieldName = 'DTANASC_CLIEN'
    end
    object SQLCLIENCOMPLEMENTO_CLIEN: TStringField
      FieldName = 'COMPLEMENTO_CLIEN'
      Size = 12
    end
    object SQLCLIENEMAIL_CLIEN: TStringField
      FieldName = 'EMAIL_CLIEN'
      Size = 100
    end
    object SQLCLIENFAX_CLIEN: TStringField
      FieldName = 'FAX_CLIEN'
      Size = 11
    end
    object SQLCLIENTELCOM_CLIEN: TStringField
      FieldName = 'TELCOM_CLIEN'
      Size = 11
    end
    object SQLCLIENSEXO_CLIEN: TStringField
      FieldName = 'SEXO_CLIEN'
      FixedChar = True
      Size = 1
    end
    object SQLCLIENDTCAD_CLIEN: TDateField
      FieldName = 'DTCAD_CLIEN'
    end
    object SQLCLIENOBS_CLIEN: TStringField
      FieldName = 'OBS_CLIEN'
      Size = 100
    end
    object SQLCLIENSTATUS_CLIEN: TStringField
      FieldName = 'STATUS_CLIEN'
      Required = True
      Size = 1
    end
  end
  object RVClien: TRvProject
    Engine = SystemClien
    Left = 184
    Top = 8
  end
  object SystemClien: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 216
    Top = 8
  end
  object DSCClien: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CDSCLIEN
    Left = 248
    Top = 8
  end
  object PDF: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Creator = 'Rave (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 288
    Top = 8
  end
end
