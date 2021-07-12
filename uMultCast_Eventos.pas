unit uMultCast_Eventos;

interface

uses
  System.Classes;

type
PMethod = ^TMethod;
TMultiEvent = procedure(const Value : string) of object;
TMultiEventClass = class
Private
  fMultiEventHandlers : TList;
               // fMultiEventHandlers é a Tlist que será usada para armazenar ponteiros para métodos que serão disparados por um evento de tipo TEvent.
Public
            constructor Create;
            destructor Destroy; override;
            procedure AddMultiEvent(const Value: TMultiEvent);
//adicionar um manipulador de eventos;
            procedure RemoveMultiEvent(const Value: TMultiEvent);
//remover um manipulador de eventos;
             procedure FireMultiEvent;
end;

implementation

uses
  System.SysUtils;

{ TMultiEventClass }

//cria o armazém dos manipuladores de evento
constructor TMultiEventClass.Create;
begin
  inherited Create;
  fMultiEventHandlers := TList.Create;
end;
//limpa
destructor TMultiEventClass.Destroy;
var
  cnt: Integer;
begin
  for cnt := 0 to -1 + fMultiEventHandlers.Count do
  Dispose (fMultiEventHandlers[cnt]);
  fMultiEventHandlers.Free;
  inherited;
end;
//adicionar um manipulador de eventos à lista}
procedure TMultiEventClass.AddMultiEvent(const Value: TMultiEvent);
var
  h: PMethod;
begin
  h := New(PMethod);
  h^.Code := TMethod(Value).Code;
  h^.Data := TMethod(Value).Data;
  fMultiEventHandlers.Add(h);
end;
//remover um manipulador de eventos da lista
procedure TMultiEventClass.RemoveMultiEvent(const Value: TMultiEvent);
var
  cnt: Integer;
begin
  for cnt := 0 to -1 + fMultiEventHandlers.Count  do
  begin
    if (TMethod(Value).Code =
        TMethod(fMultiEventHandlers[cnt]^).Code) and
       (TMethod(Value).Data =

TMethod(fMultiEventHandlers[cnt]^).Data) then
    begin
      Dispose(fMultiEventHandlers[cnt]);
      fMultiEventHandlers.Delete(cnt);
      Break;
    end;
  end;
end;
//dispara evento (chama todos os manipuladores). A procedure
//FireMultiEvent simula um evento com mais de um manipulador
//de evento.
procedure TMultiEventClass.FireMultiEvent;
var
  cnt: Integer;
  msg : string;
begin
  for cnt := 0 to -1 + fMultiEventHandlers.Count do
  begin
    msg := Format('%d/%d %s',
                  [1 + cnt,
                  fMultiEventHandlers.Count,
                  'fired!']);
    TmultiEvent(fMultiEventHandlers[cnt]^)(msg);
  end;
end;


end.
