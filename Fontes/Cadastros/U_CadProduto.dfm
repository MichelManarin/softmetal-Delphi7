inherited FrmCadProd: TFrmCadProd
  Left = 320
  Top = 0
  Caption = 'SOFTMETA - Cadastro de Produtos'
  ClientHeight = 568
  ClientWidth = 597
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel [0]
    Left = 16
    Top = 24
    Width = 40
    Height = 14
    Caption = 'CODIGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited PANBOTOES: TPanel
    Top = 511
    Width = 597
    inherited BtnBuscar: TRzButton
      OnClick = BtnBuscarClick
    end
    inherited BtnStatus: TRzButton
      OnClick = BtnStatusClick
    end
  end
  inherited PANTITULO: TRzPanel
    Width = 597
    Height = 49
    Caption = 'Cadastro de Produto'
  end
  inherited PANDADOS: TRzPanel
    Top = 49
    Width = 597
    Height = 462
    inherited LBLCOD: TRzLabel
      Width = 56
      Height = 16
      Font.Height = -14
    end
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 92
      Height = 16
      Caption = 'C'#211'D. BARRA*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 152
      Top = 80
      Width = 81
      Height = 16
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 280
      Top = 176
      Width = 95
      Height = 16
      Caption = 'OBSERVA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 128
      Width = 103
      Height = 16
      Caption = 'PR. DE CUSTO*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 280
      Top = 128
      Width = 94
      Height = 16
      Caption = 'PRE'#199'O MED.*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 152
      Top = 128
      Width = 89
      Height = 16
      Caption = 'PRE'#199'O M'#205'N.*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 408
      Top = 128
      Width = 128
      Height = 16
      Caption = 'QTD DE ESTOQUE*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 152
      Top = 176
      Width = 77
      Height = 16
      Caption = 'QTD. MAX.*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 176
      Width = 69
      Height = 16
      Caption = 'QTD M'#205'N.*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 232
      Width = 206
      Height = 17
      Caption = 'Selecione o grupo do produto !!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveCaptionText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object RzLabel1: TRzLabel
      Left = 152
      Top = 24
      Width = 110
      Height = 16
      Caption = 'C'#211'DIGO GRUPO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      LightTextStyle = True
      HighlightColor = clBtnText
    end
    object RzLabel2: TRzLabel
      Left = 296
      Top = 24
      Width = 93
      Height = 16
      Caption = 'PRE'#199'O MAX.*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      LightTextStyle = True
      HighlightColor = clBtnText
    end
    object DBCODIGOBARRA: TRzDBEdit
      Left = 16
      Top = 96
      Width = 121
      Height = 26
      DataSource = DSPRO
      DataField = 'CODBARRA_PRODF'
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
    end
    object DBDESC: TRzDBEdit
      Left = 152
      Top = 96
      Width = 377
      Height = 26
      DataSource = DSPRO
      DataField = 'DESC_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
    end
    object DBOBS: TRzDBEdit
      Left = 280
      Top = 192
      Width = 249
      Height = 26
      DataSource = DSPRO
      DataField = 'OBS_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
    end
    object DBPRECODECUSTO: TRzDBEdit
      Left = 16
      Top = 144
      Width = 121
      Height = 26
      DataSource = DSPRO
      DataField = 'PRECOCUSTO_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
    end
    object DBPRECOMED: TRzDBEdit
      Left = 280
      Top = 144
      Width = 121
      Height = 26
      DataSource = DSPRO
      DataField = 'PRECOMED_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 4
    end
    object DBPRECOMIN: TRzDBEdit
      Left = 152
      Top = 144
      Width = 121
      Height = 26
      DataSource = DSPRO
      DataField = 'PRECOMIN_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
    end
    object DBQTDEST: TRzDBEdit
      Left = 408
      Top = 144
      Width = 121
      Height = 26
      DataSource = DSPRO
      DataField = 'QTDEST_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 6
    end
    object DBQTEMAX: TRzDBEdit
      Left = 152
      Top = 192
      Width = 121
      Height = 26
      DataSource = DSPRO
      DataField = 'QTDMAX_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 7
    end
    object DBQTDMIN: TRzDBEdit
      Left = 16
      Top = 192
      Width = 121
      Height = 26
      DataSource = DSPRO
      DataField = 'QTDMIN_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 8
    end
    object GRIDGRU: TRzDBGrid
      Left = 2
      Top = 262
      Width = 593
      Height = 198
      Hint = 'De um duplo clique para selecionar o c'#243'digo do produto !'
      Align = alBottom
      DataSource = DSGru
      DefaultDrawing = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDblClick = GRIDGRUDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDGRUPO'
          Title.Caption = 'C'#211'DIGO'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_GRU'
          Title.Caption = 'NOME'
          Width = 512
          Visible = True
        end>
    end
    object DBCODSEL: TRzDBEdit
      Left = 152
      Top = 40
      Width = 121
      Height = 24
      DataSource = DSPRO
      DataField = 'IDGRUPO'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 10
    end
    object DBPRECOMAX: TRzDBEdit
      Left = 296
      Top = 40
      Width = 121
      Height = 24
      DataSource = DSPRO
      DataField = 'PRECOMAX_PRODF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 11
    end
    object BtnCagGru: TRzButton
      Left = 226
      Top = 228
      Width = 25
      Hint = 'Adicionar um novo produto !'
      Caption = '+'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = BtnCagGruClick
    end
    object Btnbusgrup: TRzButton
      Left = 252
      Top = 228
      Width = 25
      Hint = 'Adicionar um novo produto !'
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = BtnbusgrupClick
    end
  end
  inherited EdtBusca: TRzEdit
    Top = 88
    Height = 26
    Font.Height = -16
    OnEnter = nil
    OnExit = nil
    OnKeyDown = EdtBuscaKeyDown
    OnKeyPress = nil
  end
  inherited BARRASTATUS: TStatusBar
    Top = 549
    Width = 597
  end
  inherited tempo: TTimer
    Left = 168
    Top = 16
  end
  object SQLPRO: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'PRODUTOFINAL.IDPRODUTOFIN,'#13#10'PRODUTOFINAL.IDGRUPO,'#13#10'PRO' +
      'DUTOFINAL.PRECOMAX_PRODF,'#13#10'PRODUTOFINAL.PRECOCUSTO_PRODF,'#13#10'PRODU' +
      'TOFINAL.PRECOMIN_PRODF,'#13#10'PRODUTOFINAL.PRECOMED_PRODF,'#13#10'PRODUTOFI' +
      'NAL.DESC_PRODF, '#13#10'PRODUTOFINAL.CODBARRA_PRODF,'#13#10'PRODUTOFINAL.QTD' +
      'MIN_PRODF,'#13#10'PRODUTOFINAL.QTDMAX_PRODF,'#13#10'PRODUTOFINAL.QTDEST_PROD' +
      'F,'#13#10'PRODUTOFINAL.TAMANHO_PRODF,'#13#10'PRODUTOFINAL.OBS_PRODF,'#13#10'PRODUT' +
      'OFINAL.STATUS_PRODF,'#13#10#13#10'GRUPOS.NOME_GRU'#13#10#13#10'FROM PRODUTOFINAL'#13#10#13#10 +
      'LEFT OUTER JOIN GRUPOS ON (GRUPOS.IDGRUPO = PRODUTOFINAL.IDGRUPO' +
      ' )'#13#10#13#10'WHERE PRODUTOFINAL.IDPRODUTOFIN = :PARPRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PARPRODUTO'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DM.conexao
    Left = 16
    Top = 16
    object SQLPROIDPRODUTOFIN: TIntegerField
      FieldName = 'IDPRODUTOFIN'
      Required = True
    end
    object SQLPROPRECOCUSTO_PRODF: TBCDField
      FieldName = 'PRECOCUSTO_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPROPRECOMIN_PRODF: TBCDField
      FieldName = 'PRECOMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPROPRECOMED_PRODF: TBCDField
      FieldName = 'PRECOMED_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPRODESC_PRODF: TStringField
      FieldName = 'DESC_PRODF'
      Size = 100
    end
    object SQLPROCODBARRA_PRODF: TStringField
      FieldName = 'CODBARRA_PRODF'
      Size = 13
    end
    object SQLPROQTDMIN_PRODF: TBCDField
      FieldName = 'QTDMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object SQLPROQTDMAX_PRODF: TBCDField
      FieldName = 'QTDMAX_PRODF'
      Precision = 9
      Size = 2
    end
    object SQLPROQTDEST_PRODF: TIntegerField
      FieldName = 'QTDEST_PRODF'
    end
    object SQLPROTAMANHO_PRODF: TStringField
      FieldName = 'TAMANHO_PRODF'
      Size = 3
    end
    object SQLPROOBS_PRODF: TStringField
      FieldName = 'OBS_PRODF'
      Size = 200
    end
    object SQLPROSTATUS_PRODF: TStringField
      FieldName = 'STATUS_PRODF'
      Size = 1
    end
    object SQLPRONOME_GRU: TStringField
      FieldName = 'NOME_GRU'
      Size = 25
    end
    object SQLPROIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object SQLPROPRECOMAX_PRODF: TBCDField
      FieldName = 'PRECOMAX_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLPRO
    Left = 48
    Top = 16
  end
  object CDSPRO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 16
    object CDSPROIDPRODUTOFIN: TIntegerField
      FieldName = 'IDPRODUTOFIN'
      Required = True
    end
    object CDSPROPRECOCUSTO_PRODF: TBCDField
      FieldName = 'PRECOCUSTO_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPROPRECOMIN_PRODF: TBCDField
      FieldName = 'PRECOMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPROPRECOMED_PRODF: TBCDField
      FieldName = 'PRECOMED_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPRODESC_PRODF: TStringField
      FieldName = 'DESC_PRODF'
      Size = 100
    end
    object CDSPROCODBARRA_PRODF: TStringField
      FieldName = 'CODBARRA_PRODF'
      Size = 13
    end
    object CDSPROQTDMIN_PRODF: TBCDField
      FieldName = 'QTDMIN_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
    object CDSPROQTDMAX_PRODF: TBCDField
      FieldName = 'QTDMAX_PRODF'
      Precision = 9
      Size = 2
    end
    object CDSPROQTDEST_PRODF: TIntegerField
      FieldName = 'QTDEST_PRODF'
    end
    object CDSPROTAMANHO_PRODF: TStringField
      FieldName = 'TAMANHO_PRODF'
      Size = 3
    end
    object CDSPROOBS_PRODF: TStringField
      FieldName = 'OBS_PRODF'
      Size = 200
    end
    object CDSPROSTATUS_PRODF: TStringField
      FieldName = 'STATUS_PRODF'
      Size = 1
    end
    object CDSPRONOME_GRU: TStringField
      FieldName = 'NOME_GRU'
      Size = 25
    end
    object CDSPROIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object CDSPROPRECOMAX_PRODF: TBCDField
      FieldName = 'PRECOMAX_PRODF'
      Required = True
      Precision = 9
      Size = 2
    end
  end
  object DSPRO: TDataSource
    DataSet = CDSPRO
    Left = 112
    Top = 16
  end
  object SQLGru: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'GRUPOS.IDGRUPO,'#13#10'GRUPOS.NOME_GRU,'#13#10'GRUPOS.DESC_GRU,'#13#10'G' +
      'RUPOS.STATUS_GRU'#13#10#13#10#13#10'FROM GRUPOS'#13#10#13#10#13#10'WHERE GRUPOS.STATUS_GRU='#39 +
      'A'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 440
    Top = 8
    object SQLGruIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object SQLGruNOME_GRU: TStringField
      FieldName = 'NOME_GRU'
      Required = True
      Size = 25
    end
    object SQLGruSTATUS_GRU: TStringField
      FieldName = 'STATUS_GRU'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object PROVIDERlistar: TDataSetProvider
    DataSet = SQLGru
    Left = 472
    Top = 8
  end
  object CDSGru: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDERlistar'
    Left = 504
    Top = 8
    object CDSGruIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Required = True
    end
    object CDSGruNOME_GRU: TStringField
      FieldName = 'NOME_GRU'
      Required = True
      Size = 25
    end
    object CDSGruSTATUS_GRU: TStringField
      FieldName = 'STATUS_GRU'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSGru: TDataSource
    DataSet = CDSGru
    Left = 536
    Top = 8
  end
end