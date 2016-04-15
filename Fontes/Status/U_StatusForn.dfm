inherited FrmStatusForn: TFrmStatusForn
  Left = 245
  Top = 156
  Height = 484
  Caption = 'SOFTMETAL - Status de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    Height = 405
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
        object CheckCod: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'CODIGO'
          TabOrder = 0
          OnClick = CheckCodClick
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
      Top = 382
    end
    inherited Grid: TRzDBGrid
      Height = 245
      DataSource = DSFORN
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDFORNECEDOR'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RS_FORN'
          Title.Caption = 'RAZ'#195'O SOCIAl'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEFAN_FORN'
          Title.Caption = 'NOME FANTASIA'
          Width = 219
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IE_FORN'
          Title.Caption = 'INSCRI'#199#195'O ESTADUAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_FORNE'
          Title.Caption = 'CNPJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF_FORNE'
          Title.Caption = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG_FORNE'
          Title.Caption = 'RG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEL_FORN'
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR_FORN'
          Title.Caption = 'CELULAR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FORN'
          Title.Caption = 'EMAIL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FAX_FORN'
          Title.Caption = 'FAX'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HOMEPAGE_FORN'
          Title.Caption = 'HOMEPAGE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTATO_FORN'
          Title.Caption = 'CONTATO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLE_FORN'
          Title.Caption = 'COMPLEMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_FORN'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Fornecedores'
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
end
