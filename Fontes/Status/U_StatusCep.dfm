inherited FrmStatusCep: TFrmStatusCep
  Left = 325
  Top = 335
  Height = 499
  Caption = 'SOFTMETAL - Status de Cep'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    Height = 420
    inherited PnlConteudo: TPanel
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
      inherited RGordenar: TRzRadioGroup
        Items.Strings = (
          'CODIGO')
      end
      object PANDADOS: TPanel
        Left = 1
        Top = 1
        Width = 922
        Height = 135
        Align = alTop
        TabOrder = 4
        object LblCODINICIAL: TLabel
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
        object Label2: TLabel
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
        object Label1: TLabel
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
        object Label3: TLabel
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
        object Label4: TLabel
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
        object RzRadioGroup1: TRzRadioGroup
          Left = 192
          Top = 8
          Width = 129
          Height = 121
          Caption = '  Ordenar por   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHotTrack = True
          ItemHeight = 23
          Items.Strings = (
            'CODIGO'
            'CEP'
            'LOGRADOURO')
          ParentFont = False
          TabOrder = 0
        end
        object RzRadioGroup2: TRzRadioGroup
          Tag = 20
          Left = 336
          Top = 8
          Width = 105
          Height = 121
          Caption = '   Situa'#231#227'o   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHotTrack = True
          ItemHeight = 30
          Items.Strings = (
            'ATIVOS'
            'CANCELADOS'
            'TODOS')
          ParentFont = False
          TextShadowDepth = 8
          StartXPos = 9
          StartYPos = 5
          TabOrder = 1
          VisualStyle = vsGradient
        end
        object RzCheckGroup1: TRzCheckGroup
          Left = 8
          Top = 8
          Width = 177
          Height = 121
          Caption = '  Filtrar Por  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHotTrack = True
          ParentFont = False
          TabOrder = 2
          object RzCheckBox1: TRzCheckBox
            Left = 8
            Top = 16
            Width = 59
            Height = 16
            Caption = 'CODIGO'
            HotTrack = True
            State = cbUnchecked
            TabOrder = 0
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
        object RzPanel1: TRzPanel
          Left = 808
          Top = 16
          Width = 100
          Height = 105
          BorderOuter = fsFlatRounded
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object RzBitBtn1: TRzBitBtn
            Left = 12
            Top = 38
            Caption = '&Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            HotTrack = True
            ParentFont = False
            TabOrder = 0
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              0800000000000002000000000000000000000001000000000000000000003300
              00006600000099000000CC000000FF0000000033000033330000663300009933
              0000CC330000FF33000000660000336600006666000099660000CC660000FF66
              000000990000339900006699000099990000CC990000FF99000000CC000033CC
              000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
              0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
              330000333300333333006633330099333300CC333300FF333300006633003366
              33006666330099663300CC663300FF6633000099330033993300669933009999
              3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
              330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
              66006600660099006600CC006600FF0066000033660033336600663366009933
              6600CC336600FF33660000666600336666006666660099666600CC666600FF66
              660000996600339966006699660099996600CC996600FF99660000CC660033CC
              660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
              6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
              990000339900333399006633990099339900CC339900FF339900006699003366
              99006666990099669900CC669900FF6699000099990033999900669999009999
              9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
              990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
              CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
              CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
              CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
              CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
              CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
              FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
              FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
              FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
              FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
              000000808000800000008000800080800000C0C0C00080808000191919004C4C
              4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
              82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
              F100C56A31000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EEEEEEEEEE18
              0CEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEEEEEEEEEEEE1812
              120CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEEEEEEEE181212
              12120CEEEEEEEEEEEEEEEEEEEEE281818181DFEEEEEEEEEEEEEEEEEE18121212
              1212120CEEEEEEEEEEEEEEEEE2818181818181DFEEEEEEEEEEEEEEEE1812120C
              181212120CEEEEEEEEEEEEEEE28181DFE2818181DFEEEEEEEEEEEE1818120C12
              0C181212120CEEEEEEEEEEE2E281DF81DFE2818181DFEEEEEEEE1812180C1212
              120C181212120CEEEEEEE281E2DF818181DFE2818181DFEEEEEE1812120C1812
              12120C181212120CEEEEE28181DFE2818181DFE2818181DFEEEE18120CEEEE18
              1212120C181212120CEEE281DFEEEEE2818181DFE2818181DFEE180CEEEEEEEE
              181212120C181212120CE2DFEEEEEEEEE2818181DFE2818181DFEEEEEEEEEEEE
              EE181212120C1812120CEEEEEEEEEEEEEEE2818181DFE28181DFEEEEEEEEEEEE
              EEEE181212120C18120CEEEEEEEEEEEEEEEEE2818181DFE281DFEEEEEEEEEEEE
              EEEEEE181212120C180CEEEEEEEEEEEEEEEEEEE2818181DFE2DFEEEEEEEEEEEE
              EEEEEEEE1812120CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEE
              EEEEEEEEEE18120CEEEEEEEEEEEEEEEEEEEEEEEEEEE281DFEEEEEEEEEEEEEEEE
              EEEEEEEEEEEE180CEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEE}
            NumGlyphs = 2
          end
          object RzBitBtn2: TRzBitBtn
            Left = 12
            Top = 8
            Default = True
            Caption = '&Buscar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            HotTrack = True
            ParentFont = False
            TabOrder = 1
            OnClick = RzBitBtn2Click
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              0800000000000002000000000000000000000001000000000000000000003300
              00006600000099000000CC000000FF0000000033000033330000663300009933
              0000CC330000FF33000000660000336600006666000099660000CC660000FF66
              000000990000339900006699000099990000CC990000FF99000000CC000033CC
              000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
              0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
              330000333300333333006633330099333300CC333300FF333300006633003366
              33006666330099663300CC663300FF6633000099330033993300669933009999
              3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
              330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
              66006600660099006600CC006600FF0066000033660033336600663366009933
              6600CC336600FF33660000666600336666006666660099666600CC666600FF66
              660000996600339966006699660099996600CC996600FF99660000CC660033CC
              660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
              6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
              990000339900333399006633990099339900CC339900FF339900006699003366
              99006666990099669900CC669900FF6699000099990033999900669999009999
              9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
              990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
              CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
              CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
              CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
              CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
              CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
              FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
              FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
              FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
              FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
              000000808000800000008000800080800000C0C0C00080808000191919004C4C
              4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
              82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
              F100C56A31000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE180C
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEEEEEEEEEEEE181212
              0CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEEEEEEEE18121212
              120CEEEEEEEEEEEEEEEEEEEEE281818181DFEEEEEEEEEEEEEEEEEE1812121212
              12120CEEEEEEEEEEEEEEEEE2818181818181DFEEEEEEEEEEEEEEEE1812120C18
              1212120CEEEEEEEEEEEEEEE28181DFE2818181DFEEEEEEEEEEEEEE18120CEEEE
              181212120CEEEEEEEEEEEEE281DFEEEEE2818181DFEEEEEEEEEEEE180CEEEEEE
              EE181212120CEEEEEEEEEEE2DFEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEEEE
              EEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEE
              EEEEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEE
              EEEEEEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEE
              EEEEEEEEEE1812120CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEE
              EEEEEEEEEEEE18120CEEEEEEEEEEEEEEEEEEEEEEEEEEE281DFEEEEEEEEEEEEEE
              EEEEEEEEEEEEEE180CEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
            NumGlyphs = 2
          end
          object RzBitBtn3: TRzBitBtn
            Left = 13
            Top = 72
            HotTrack = True
            TabOrder = 2
            OnClick = BtnSairClick
            Kind = bkClose
          end
        end
        object NAMEBUS: TRzEdit
          Left = 456
          Top = 72
          Width = 145
          Height = 21
          FrameHotTrack = True
          FrameHotStyle = fsFlat
          FrameVisible = True
          TabOrder = 4
        end
        object CODFINAL: TRzEdit
          Left = 536
          Top = 32
          Width = 65
          Height = 21
          FrameHotTrack = True
          FrameHotStyle = fsFlat
          FrameVisible = True
          TabOrder = 5
        end
        object CODINICIAL: TRzEdit
          Left = 456
          Top = 32
          Width = 65
          Height = 21
          FrameHotTrack = True
          FrameHotStyle = fsFlat
          FrameVisible = True
          TabOrder = 6
        end
        object TLbus: TRzEdit
          Left = 616
          Top = 32
          Width = 185
          Height = 21
          FrameHotTrack = True
          FrameHotStyle = fsFlat
          FrameVisible = True
          TabOrder = 7
        end
        object LOUbus: TRzEdit
          Left = 616
          Top = 72
          Width = 185
          Height = 21
          FrameHotTrack = True
          FrameHotStyle = fsFlat
          FrameVisible = True
          TabOrder = 8
        end
      end
    end
    inherited BARRASTATUS: TRzStatusBar
      Top = 397
    end
    inherited Grid: TRzDBGrid
      Height = 260
      DataSource = DSCEP
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'LOG_CEP'
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
          FieldName = 'TIPOLOG_CEP'
          Title.Caption = 'TIPOLOGRADOURO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDBAIRRO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_CEP'
          Title.Caption = 'STATUS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_BAIRRO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCEP_CEP'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status Cep'
  end
  object SQLCEP: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'CEPS.IDCEP_CEP,'#13#10'CEPS.CEP_CEP,'#13#10'CEPS.LOG_CEP,'#13#10'CEPS.ID' +
      'BAIRRO,'#13#10'CEPS.IDCIDADE,'#13#10'CEPS.STATUS_CEP'#13#10#13#10#13#10'FROM CEPS'#13#10#13#10
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
      Required = True
      Size = 100
    end
    object SQLCEPIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object SQLCEPIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
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
      Required = True
      Size = 100
    end
    object CDSCEPIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object CDSCEPIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
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
