object frmConsultaPais: TfrmConsultaPais
  Left = 0
  Top = 0
  Caption = 'Consulta de Pa'#237's'
  ClientHeight = 320
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 25
  object lblNomePais: TLabel
    Left = 24
    Top = 20
    Width = 115
    Height = 25
    Caption = 'Nome do Pa'#237's:'
  end
  object lblNomeOficial: TLabel
    Left = 24
    Top = 96
    Width = 107
    Height = 25
    Caption = 'Nome Oficial:'
  end
  object lblCapital: TLabel
    Left = 24
    Top = 166
    Width = 58
    Height = 25
    Caption = 'Capital:'
  end
  object lblRegiao: TLabel
    Left = 230
    Top = 166
    Width = 58
    Height = 25
    Caption = 'Regi'#227'o:'
  end
  object lblPopulacao: TLabel
    Left = 24
    Top = 236
    Width = 86
    Height = 25
    Caption = 'Popula'#231#227'o:'
  end
  object lblmoeda: TLabel
    Left = 230
    Top = 236
    Width = 60
    Height = 25
    Caption = 'Moeda:'
  end
  object edtNomePais: TEdit
    Left = 24
    Top = 51
    Width = 250
    Height = 33
    TabOrder = 0
    OnChange = edtNomePaisChange
    OnKeyPress = edtNomePaisKeyPress
  end
  object btnConsultar: TButton
    Left = 290
    Top = 51
    Width = 120
    Height = 33
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btnConsultarClick
  end
  object edtNomeOficial: TEdit
    Left = 24
    Top = 127
    Width = 386
    Height = 33
    Enabled = False
    ReadOnly = True
    TabOrder = 2
  end
  object edtCapital: TEdit
    Left = 24
    Top = 197
    Width = 180
    Height = 33
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object edtRegiao: TEdit
    Left = 230
    Top = 197
    Width = 180
    Height = 33
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object edtPopulacao: TEdit
    Left = 24
    Top = 267
    Width = 180
    Height = 33
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtMoeda: TEdit
    Left = 230
    Top = 267
    Width = 180
    Height = 33
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
end
