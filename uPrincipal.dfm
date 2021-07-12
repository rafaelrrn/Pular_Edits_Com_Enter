object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 531
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 104
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 246
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 392
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 104
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 246
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 392
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 5
    OnKeyPress = Edit6KeyPress
  end
  object Edit7: TEdit
    Left = 104
    Top = 293
    Width = 121
    Height = 21
    TabOrder = 6
    TextHint = 'Exibe msg'
    OnKeyPress = Edit7KeyPress
  end
  object Edit8: TEdit
    Left = 246
    Top = 293
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object DBEdit1: TDBEdit
    Left = 392
    Top = 293
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Button3: TButton
    Left = 519
    Top = 246
    Width = 50
    Height = 25
    Caption = 'Button3'
    TabOrder = 9
    OnClick = Button3Click
  end
  object Edit9: TEdit
    Left = 104
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object Edit10: TEdit
    Left = 246
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object Edit11: TEdit
    Left = 392
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 12
    OnKeyPress = Edit6KeyPress
  end
end
