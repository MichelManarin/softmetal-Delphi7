inherited FrmObjetoCAD: TFrmObjetoCAD
  Left = 560
  Top = 105
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Objeto Cadastro'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PANBOTOES: TPanel [0]
    Left = 0
    Top = 385
    Width = 784
    Height = 38
    Align = alBottom
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnNovo: TRzButton
      Left = 8
      Top = 6
      Caption = 'Novo'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = BtnNovoClick
    end
    object BtnGravar: TRzButton
      Left = 168
      Top = 6
      Caption = 'Gravar'
      Enabled = False
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TRzButton
      Left = 88
      Top = 6
      Caption = 'Cancelar'
      Enabled = False
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = BtnCancelarClick
    end
    object BtnBuscar: TRzButton
      Left = 248
      Top = 6
      Caption = 'Buscar'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
    end
    object BtnStatus: TRzButton
      Left = 328
      Top = 6
      Caption = 'Status'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
    end
    object BtnSair: TRzButton
      Left = 408
      Top = 6
      Caption = '&Sair'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      OnClick = BtnSairClick
    end
  end
  object PANTITULO: TRzPanel [1]
    Left = 0
    Top = 0
    Width = 784
    Height = 41
    Align = alTop
    BorderOuter = fsGroove
    BorderColor = clWhite
    BorderHighlight = clBlack
    BorderShadow = 10066329
    Caption = 'OBJETO CADASTRO'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    GradientColorStart = clRed
    GradientColorStop = clActiveCaption
    GridColor = clActiveCaption
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
  end
  object PANDADOS: TRzPanel [2]
    Left = 0
    Top = 41
    Width = 784
    Height = 344
    Align = alClient
    BorderOuter = fsFlatRounded
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object LBLCOD: TRzLabel
      Left = 16
      Top = 24
      Width = 40
      Height = 14
      Caption = 'C'#211'DIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      LightTextStyle = True
      HighlightColor = clBtnText
    end
  end
  object EdtBusca: TRzEdit [3]
    Left = 16
    Top = 80
    Width = 121
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FrameHotTrack = True
    FrameHotStyle = fsFlat
    FrameVisible = True
    ParentFont = False
    TabOrder = 2
    OnEnter = EdtBuscaEnter
    OnExit = EdtBuscaExit
    OnKeyPress = EdtBuscaKeyPress
  end
  object BARRASTATUS: TStatusBar [4]
    Left = 0
    Top = 423
    Width = 784
    Height = 19
    Panels = <
      item
        Text = 'Data: '
        Width = 110
      end
      item
        Text = 'Hora: '
        Width = 50
      end>
  end
  inherited tempo: TTimer
    OnTimer = tempoTimer
  end
end
