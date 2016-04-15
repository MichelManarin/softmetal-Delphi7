inherited FrmStatusFun: TFrmStatusFun
  Left = 349
  Top = 338
  Height = 523
  Caption = 'SOFTMETAL - Status de Funcionario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCenter: TRzPanel
    Height = 444
    inherited PnlConteudo: TPanel
      object Label1: TLabel [0]
        Left = 568
        Top = 8
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
      object LblCODINICIAL: TLabel [1]
        Left = 464
        Top = 8
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
      object Label4: TLabel [2]
        Left = 664
        Top = 8
        Width = 19
        Height = 14
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel [3]
        Left = 664
        Top = 48
        Width = 15
        Height = 14
        Caption = 'RG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [4]
        Left = 464
        Top = 48
        Width = 29
        Height = 14
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel [5]
        Left = 464
        Top = 88
        Width = 126
        Height = 14
        Caption = 'CARTEIRA DE TRABALHO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      inherited PnlBotoes: TRzPanel
        inherited BtnBuscar: TRzBitBtn
          OnClick = BtnBuscarClick
        end
      end
      inherited RGordenar: TRzRadioGroup
        ItemHeight = 25
        Items.Strings = (
          'CODIGO'
          'NOME'
          'DATA DE NASC.'
          'SEXO')
      end
      object CODFINAL: TRzEdit
        Left = 568
        Top = 24
        Width = 89
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 4
      end
      object CODINICIAL: TRzEdit
        Left = 464
        Top = 24
        Width = 97
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 5
      end
      object CPFBUS: TRzEdit
        Left = 664
        Top = 24
        Width = 113
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 6
      end
      object RGBUS: TRzEdit
        Left = 664
        Top = 64
        Width = 81
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 7
      end
      object NOMEBUS: TRzEdit
        Left = 464
        Top = 64
        Width = 193
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 8
      end
      object CARTTBUS: TRzEdit
        Left = 464
        Top = 100
        Width = 193
        Height = 21
        Enabled = False
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        TabOrder = 9
      end
    end
    inherited BARRASTATUS: TRzStatusBar
      Top = 421
    end
    inherited Grid: TRzDBGrid
      Height = 284
      DataSource = DSFUN
      OnDblClick = GridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDFUNCIONARIO'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FUN'
          Title.Caption = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF_FUN'
          Title.Caption = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG_FUN'
          Title.Caption = 'RG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CART_FUN'
          Title.Caption = 'CARTEITA DE TRAB.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTANASC_FUN'
          Title.Caption = 'DTA. NASCIMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMP_FUN'
          Title.Caption = 'COMPLEMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_FUN'
          Title.Caption = 'EMAIL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEXO_FUN'
          Title.Caption = 'SEXO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE1_FUN'
          Title.Caption = 'FONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE2_FUN'
          Title.Caption = 'FONE [secundario]'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_FUN'
          Title.Caption = 'Observa'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_FUN'
          Title.Caption = 'STATUS'
          Visible = True
        end>
    end
  end
  inherited PnlTitle: TRzPanel
    Caption = 'Status de Funcionario'
  end
  object CheckCod: TRzCheckBox [2]
    Left = 24
    Top = 72
    Width = 61
    Height = 15
    Caption = 'CODIGO'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 2
    OnClick = CheckCodClick
  end
  object CheckNome: TRzCheckBox [3]
    Left = 24
    Top = 88
    Width = 51
    Height = 15
    Caption = 'NOME'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 3
    OnClick = CheckNomeClick
  end
  object CheckCPF: TRzCheckBox [4]
    Left = 24
    Top = 104
    Width = 39
    Height = 15
    Caption = 'CPF'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 4
    OnClick = CheckCPFClick
  end
  object CheckRG: TRzCheckBox [5]
    Left = 24
    Top = 120
    Width = 35
    Height = 15
    Caption = 'RG'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 5
    OnClick = CheckRGClick
  end
  object CheckCART: TRzCheckBox [6]
    Left = 24
    Top = 136
    Width = 152
    Height = 15
    Caption = 'CARTEIRA DE TRABALHO'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 6
    OnClick = CheckCARTClick
  end
  object DSFUN: TDataSource
    DataSet = CDSFUN
    Left = 112
    Top = 8
  end
  object CDSFUN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PROVIDER'
    Left = 80
    Top = 8
    object CDSFUNIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Required = True
    end
    object CDSFUNNOME_FUN: TStringField
      FieldName = 'NOME_FUN'
      Required = True
      Size = 60
    end
    object CDSFUNCPF_FUN: TStringField
      FieldName = 'CPF_FUN'
      Required = True
      Size = 11
    end
    object CDSFUNRG_FUN: TStringField
      FieldName = 'RG_FUN'
      Size = 11
    end
    object CDSFUNCART_FUN: TStringField
      FieldName = 'CART_FUN'
    end
    object CDSFUNDTANASC_FUN: TDateField
      FieldName = 'DTANASC_FUN'
      Required = True
    end
    object CDSFUNCOMP_FUN: TStringField
      FieldName = 'COMP_FUN'
      Size = 100
    end
    object CDSFUNEMAIL_FUN: TStringField
      FieldName = 'EMAIL_FUN'
      Size = 100
    end
    object CDSFUNSEXO_FUN: TStringField
      FieldName = 'SEXO_FUN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDSFUNFONE1_FUN: TStringField
      FieldName = 'FONE1_FUN'
      Size = 11
    end
    object CDSFUNFONE2_FUN: TStringField
      FieldName = 'FONE2_FUN'
      Size = 11
    end
    object CDSFUNOBS_FUN: TStringField
      FieldName = 'OBS_FUN'
      Size = 100
    end
    object CDSFUNSTATUS_FUN: TStringField
      FieldName = 'STATUS_FUN'
      Required = True
      Size = 1
    end
  end
  object PROVIDER: TDataSetProvider
    DataSet = SQLFUN
    Left = 48
    Top = 8
  end
  object SQLFUN: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10'FUNCIONARIOS.IDFUNCIONARIO,'#13#10'FUNCIONARIOS.NOME_FUN,'#13#10'F' +
      'UNCIONARIOS.CPF_FUN,'#13#10'FUNCIONARIOS.RG_FUN,'#13#10'FUNCIONARIOS.CART_FU' +
      'N,'#13#10'FUNCIONARIOS.DTANASC_FUN,'#13#10'FUNCIONARIOS.COMP_FUN,'#13#10'FUNCIONAR' +
      'IOS.EMAIL_FUN,'#13#10'FUNCIONARIOS.SEXO_FUN,'#13#10'FUNCIONARIOS.FONE1_FUN,'#13 +
      #10'FUNCIONARIOS.FONE2_FUN,'#13#10'FUNCIONARIOS.OBS_FUN,'#13#10'FUNCIONARIOS.ST' +
      'ATUS_FUN'#13#10#13#10'FROM FUNCIONARIOS'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.conexao
    Left = 16
    Top = 8
    object SQLFUNIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Required = True
    end
    object SQLFUNNOME_FUN: TStringField
      FieldName = 'NOME_FUN'
      Required = True
      Size = 60
    end
    object SQLFUNCPF_FUN: TStringField
      FieldName = 'CPF_FUN'
      Required = True
      Size = 11
    end
    object SQLFUNRG_FUN: TStringField
      FieldName = 'RG_FUN'
      Size = 11
    end
    object SQLFUNCART_FUN: TStringField
      FieldName = 'CART_FUN'
    end
    object SQLFUNDTANASC_FUN: TDateField
      FieldName = 'DTANASC_FUN'
      Required = True
    end
    object SQLFUNCOMP_FUN: TStringField
      FieldName = 'COMP_FUN'
      Size = 100
    end
    object SQLFUNEMAIL_FUN: TStringField
      FieldName = 'EMAIL_FUN'
      Size = 100
    end
    object SQLFUNSEXO_FUN: TStringField
      FieldName = 'SEXO_FUN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object SQLFUNFONE1_FUN: TStringField
      FieldName = 'FONE1_FUN'
      Size = 11
    end
    object SQLFUNFONE2_FUN: TStringField
      FieldName = 'FONE2_FUN'
      Size = 11
    end
    object SQLFUNOBS_FUN: TStringField
      FieldName = 'OBS_FUN'
      Size = 100
    end
    object SQLFUNSTATUS_FUN: TStringField
      FieldName = 'STATUS_FUN'
      Required = True
      Size = 1
    end
  end
end
