unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Classe.PularCampoComEnter;

type

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    DBEdit1: TDBEdit;
    Button3: TButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  pularCampoComEnder : TPularCampoComEnter;

implementation

{$R *.dfm}

uses Unit2;


{ TForm1 }

procedure TForm1.Button3Click(Sender: TObject);
begin
   Form2 := TForm2.Create(nil);

   try
     Form2.ShowModal
   finally
     Form2.Free;
   end;
end;

procedure TForm1.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
   If (key = #13) then Button3Click(Self);
end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
   If (key = #13) then showmessage('teste - outra função TNotify Event');
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
   pularCampoComEnder := TPularCampoComEnter.Create(Form1);
   pularCampoComEnder.AdicionaPularComEnterNosEdits;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
   pularCampoComEnder.free;
end;


end.
