inherited FrmBusForn: TFrmBusForn
  Left = 301
  Top = 157
  Caption = 'SOFTMETAL - Busca de Fornecedor'
  ClientWidth = 925
  PixelsPerInch = 96
  TextHeight = 13
  inherited PANTITULO: TRzPanel
    Width = 925
    Caption = 'Busca de Fornecedor'
  end
  inherited PnlCenter: TRzPanel
    Width = 925
    inherited PANDADOS: TPanel
      Width = 921
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
      object Label3: TLabel [2]
        Left = 456
        Top = 56
        Width = 82
        Height = 14
        Caption = 'NOME FANTASIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [3]
        Left = 456
        Top = 108
        Width = 110
        Height = 14
        Caption = 'INSCRI'#199#195'O ESTATUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited RGordenar: TRzRadioGroup
        ItemIndex = 0
        Items.Strings = (
          'CODIGO'
          'NOME FANTASIA')
      end
      inherited RGsituacao: TRzRadioGroup
        ItemIndex = 0
      end
      inherited RGfiltra: TRzCheckGroup
        object CheckCOD: TRzCheckBox
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
          Width = 101
          Height = 16
          Caption = 'NOME FANTASIA'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          OnClick = CheckDesClick
        end
        object CheckNP: TRzCheckBox
          Left = 16
          Top = 72
          Width = 111
          Height = 16
          Caption = 'INSCRI. ESTADUAL'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          OnClick = CheckNPClick
        end
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnImprimir: TRzBitBtn
          OnClick = BtnImprimirClick
        end
        inherited BtnBuscar: TRzBitBtn
          Enabled = False
          OnClick = BtnBuscarClick
        end
      end
      object NOMEFANBUS: TRzEdit
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
      object ISBUS: TRzEdit
        Left = 576
        Top = 104
        Width = 161
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 7
      end
    end
    inherited Grid: TRzDBGrid
      Width = 921
      DataSource = DSFORN
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDFORNECEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'CODIGO'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEFAN_FORN'
          Title.Alignment = taCenter
          Title.Caption = 'NOME FANTASIA'
          Width = 331
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RS_FORN'
          Title.Alignment = taCenter
          Title.Caption = 'RAZ'#195'O SOCIAL'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_FORNE'
          Title.Alignment = taCenter
          Title.Caption = 'CNPJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEL_FORN'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_FORN'
          Title.Alignment = taCenter
          Title.Caption = 'STATUS'
          Width = 61
          Visible = True
        end>
    end
  end
  inherited BARRASTATUS: TStatusBar
    Width = 925
  end
  object DSFORN: TDataSource
    DataSet = CDSFORN
    Left = 112
    Top = 8
  end
  object CDSFORN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSFORNIDFORNECEDOR: TIntegerField
      FieldName = 'IDFORNECEDOR'
      Required = True
    end
    object CDSFORNRS_FORN: TStringField
      FieldName = 'RS_FORN'
      Size = 60
    end
    object CDSFORNNOMEFAN_FORN: TStringField
      FieldName = 'NOMEFAN_FORN'
      Required = True
      Size = 60
    end
    object CDSFORNIE_FORN: TStringField
      FieldName = 'IE_FORN'
      Size = 14
    end
    object CDSFORNCNPJ_FORNE: TStringField
      FieldName = 'CNPJ_FORNE'
      Size = 14
    end
    object CDSFORNCPF_FORNE: TStringField
      FieldName = 'CPF_FORNE'
      Size = 11
    end
    object CDSFORNRG_FORNE: TStringField
      FieldName = 'RG_FORNE'
      Size = 11
    end
    object CDSFORNTEL_FORN: TStringField
      FieldName = 'TEL_FORN'
      Size = 11
    end
    object CDSFORNCELULAR_FORN: TStringField
      FieldName = 'CELULAR_FORN'
      Size = 11
    end
    object CDSFORNEMAIL_FORN: TStringField
      FieldName = 'EMAIL_FORN'
      Size = 100
    end
    object CDSFORNFAX_FORN: TStringField
      FieldName = 'FAX_FORN'
      Size = 10
    end
    object CDSFORNHOMEPAGE_FORN: TStringField
      FieldName = 'HOMEPAGE_FORN'
      Size = 100
    end
    object CDSFORNCONTATO_FORN: TStringField
      FieldName = 'CONTATO_FORN'
      Size = 100
    end
    object CDSFORNCOMPLE_FORN: TStringField
      FieldName = 'COMPLE_FORN'
      Size = 60
    end
    object CDSFORNSTATUS_FORN: TStringField
      FieldName = 'STATUS_FORN'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLFORN
    Left = 48
    Top = 8
  end
  object SQLFORN: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'FORNECEDORES.IDFORNECEDOR,'#13#10'FORNECEDORES.RS_FORN,'#13#10'FOR' +
      'NECEDORES.NOMEFAN_FORN,'#13#10'FORNECEDORES.IE_FORN,'#13#10'FORNECEDORES.CNP' +
      'J_FORNE,'#13#10'FORNECEDORES.CPF_FORNE,'#13#10'FORNECEDORES.RG_FORNE,'#13#10'FORNE' +
      'CEDORES.TEL_FORN,'#13#10'FORNECEDORES.CELULAR_FORN,'#13#10'FORNECEDORES.EMAI' +
      'L_FORN,'#13#10'FORNECEDORES.FAX_FORN,'#13#10'FORNECEDORES.HOMEPAGE_FORN,'#13#10'FO' +
      'RNECEDORES.CONTATO_FORN,'#13#10'FORNECEDORES.COMPLE_FORN,'#13#10'FORNECEDORE' +
      'S.STATUS_FORN'#13#10#13#10'FROM FORNECEDORES'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLFORNIDFORNECEDOR: TIntegerField
      FieldName = 'IDFORNECEDOR'
      Required = True
    end
    object SQLFORNRS_FORN: TStringField
      FieldName = 'RS_FORN'
      Size = 60
    end
    object SQLFORNNOMEFAN_FORN: TStringField
      FieldName = 'NOMEFAN_FORN'
      Required = True
      Size = 60
    end
    object SQLFORNIE_FORN: TStringField
      FieldName = 'IE_FORN'
      Size = 14
    end
    object SQLFORNCNPJ_FORNE: TStringField
      FieldName = 'CNPJ_FORNE'
      Size = 14
    end
    object SQLFORNCPF_FORNE: TStringField
      FieldName = 'CPF_FORNE'
      Size = 11
    end
    object SQLFORNRG_FORNE: TStringField
      FieldName = 'RG_FORNE'
      Size = 11
    end
    object SQLFORNTEL_FORN: TStringField
      FieldName = 'TEL_FORN'
      Size = 11
    end
    object SQLFORNCELULAR_FORN: TStringField
      FieldName = 'CELULAR_FORN'
      Size = 11
    end
    object SQLFORNEMAIL_FORN: TStringField
      FieldName = 'EMAIL_FORN'
      Size = 100
    end
    object SQLFORNFAX_FORN: TStringField
      FieldName = 'FAX_FORN'
      Size = 10
    end
    object SQLFORNHOMEPAGE_FORN: TStringField
      FieldName = 'HOMEPAGE_FORN'
      Size = 100
    end
    object SQLFORNCONTATO_FORN: TStringField
      FieldName = 'CONTATO_FORN'
      Size = 100
    end
    object SQLFORNCOMPLE_FORN: TStringField
      FieldName = 'COMPLE_FORN'
      Size = 60
    end
    object SQLFORNSTATUS_FORN: TStringField
      FieldName = 'STATUS_FORN'
      Required = True
      Size = 1
    end
  end
  object RvForn: TRvProject
    Engine = RVSForn
    Left = 192
    Top = 8
  end
  object RVSForn: TRvSystem
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
    Left = 232
    Top = 8
  end
  object RVDS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CDSFORN
    Left = 272
    Top = 8
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Creator = 'Rave (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 312
    Top = 8
  end
end
