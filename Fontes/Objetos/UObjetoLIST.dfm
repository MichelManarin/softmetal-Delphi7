inherited FrmObjetoLISTA: TFrmObjetoLISTA
  Left = 387
  Top = 89
  Caption = 'ObjetoListagem'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object PANTITULO: TRzPanel [0]
    Left = 0
    Top = 0
    Width = 784
    Height = 41
    Align = alTop
    BorderOuter = fsFlatRounded
    BorderColor = clYellow
    BorderHighlight = clWhite
    BorderShadow = clBlack
    Caption = 'Objeto Listagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    FullRepaint = False
    GradientColorStart = clRed
    GradientColorStop = clActiveCaption
    GridColor = clActiveCaption
    ParentFont = False
    TabOrder = 0
    VisualStyle = vsGradient
  end
  object PnlCenter: TRzPanel [1]
    Left = 0
    Top = 41
    Width = 784
    Height = 401
    Align = alClient
    BorderOuter = fsFlatRounded
    TabOrder = 1
    object PANDADOS: TPanel
      Left = 2
      Top = 2
      Width = 780
      Height = 47
      Align = alTop
      TabOrder = 0
      object BtnListarTodos: TRzButton
        Left = 16
        Top = 8
        Caption = 'Listar Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HotTrack = True
        ParentFont = False
        TabOrder = 0
      end
    end
    object Grid: TRzDBGrid
      Left = 2
      Top = 49
      Width = 780
      Height = 331
      Align = alClient
      Color = clCream
      DefaultDrawing = True
      FixedColor = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = 15
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      DisabledColor = clCream
      FocusColor = clWhite
      FrameColor = clWhite
      FrameHotColor = clRed
      FrameHotStyle = fsBump
      FrameHotTrack = True
      FrameStyle = fsBump
      FrameVisible = True
      FixedLineColor = clBtnText
      LineColor = clBlack
      AltRowShadingColor = clBlack
    end
    object BARRASTATUS: TStatusBar
      Left = 2
      Top = 380
      Width = 780
      Height = 19
      Panels = <
        item
          Text = 'Data:'
          Width = 110
        end
        item
          Text = 'Hora:'
          Width = 50
        end>
    end
  end
end
