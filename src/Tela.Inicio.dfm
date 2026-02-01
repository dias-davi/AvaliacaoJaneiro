object frmConsultaPais: TfrmConsultaPais
  Left = 0
  Top = 0
  Caption = 'Consulta de Pa'#237's'
  ClientHeight = 258
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object lblNomePais: TLabel
    Left = 24
    Top = 20
    Width = 86
    Height = 17
    Caption = 'Nome do Pa'#237's:'
  end
  object lblNomeOficial: TLabel
    Left = 24
    Top = 80
    Width = 79
    Height = 17
    Caption = 'Nome Oficial:'
  end
  object lblCapital: TLabel
    Left = 24
    Top = 130
    Width = 43
    Height = 17
    Caption = 'Capital:'
  end
  object lblRegiao: TLabel
    Left = 230
    Top = 130
    Width = 44
    Height = 17
    Caption = 'Regi'#227'o:'
  end
  object lblPopulacao: TLabel
    Left = 24
    Top = 180
    Width = 64
    Height = 17
    Caption = 'Popula'#231#227'o:'
  end
  object lblmoeda: TLabel
    Left = 230
    Top = 180
    Width = 45
    Height = 17
    Caption = 'Moeda:'
  end
  object edtNomePais: TEdit
    Left = 24
    Top = 40
    Width = 250
    Height = 25
    TabOrder = 0
    OnChange = edtNomePaisChange
    OnKeyPress = edtNomePaisKeyPress
  end
  object btnConsultar: TButton
    Left = 290
    Top = 38
    Width = 120
    Height = 27
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btnConsultarClick
  end
  object edtNomeOficial: TEdit
    Left = 24
    Top = 100
    Width = 386
    Height = 25
    Enabled = False
    ReadOnly = True
    TabOrder = 2
  end
  object edtCapital: TEdit
    Left = 24
    Top = 150
    Width = 180
    Height = 25
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object edtRegiao: TEdit
    Left = 230
    Top = 150
    Width = 180
    Height = 25
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object edtPopulacao: TEdit
    Left = 24
    Top = 200
    Width = 180
    Height = 25
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtMoeda: TEdit
    Left = 230
    Top = 200
    Width = 180
    Height = 25
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
end
