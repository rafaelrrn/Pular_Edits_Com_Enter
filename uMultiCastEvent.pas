unit uMultiCastEvent;

interface

uses
classes , StdCtrls, controls, System.generics.collections;

Type
TMultiEventos = Array of TNotifyEvent;

Type
TSetEventos = class
strict private
   FOnClick : TDictionary;
public
procedure ExecuteOnClik(sender:TObject);
procedure ExcecuteMultiCast(Aonwer:TWinControl;GeralClick:TNotifyEvent);
destructor destroy;override;
constructor create;
property OnClick:TDictionary read FOnClick write FOnClick;
end;

implementation

{ TSetEventos }

constructor TSetEventos.create;
begin
FOnClick :=TDictionary.create;
end;

destructor TSetEventos.destroy;
begin
FOnClick.Free;
inherited;
end;

procedure TSetEventos.ExcecuteMultiCast(Aonwer: TWinControl;GeralClick:TNotifyEvent);
var
C:TComponent;
eventos:TMultiEventos;
begin
for c in Aonwer do
if c is TButton then
begin
if (assigned(TButton(C).OnClick)) then
begin
SetLength(eventos,2);
eventos[0]:=TButton(C).OnClick;
eventos[1]:=GeralClick;
end
else
begin
SetLength(eventos,1);
eventos[0]:=GeralClick;
end;
self.OnClick.Add(TButton(C),eventos);
TButton(C).OnClick:=self.ExecuteOnClik;
end;
end;

procedure TSetEventos.ExecuteOnClik(sender: TObject);
var
eventos:TMultiEventos;
I: Integer;
begin
setlength(eventos,high(self.FOnClick.Items[sender])+1);
for I := Low(eventos) to High(eventos) do
begin
eventos[i]:=self.FOnClick.Items[sender][i];
eventos[i](sender);
end;

end;

end.



//Read more: http://www.linhadecodigo.com.br/artigo/3470/multicast-events-no-delphi.aspx#ixzz6i7RhmvSd
