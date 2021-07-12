unit Classe.PularCampoComEnter;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms;

type
   PKeyNotifyEvent = ^TKeyPressEvent;
   PKeyEvent       = ^TKeyEvent;

   TPularCampoComEnter = class(TWinControl)

   private
     FForm : TForm;

     FListaDeEventos_KeyPress      : TList;
     FListaDeEventos_KeyUp_KeyDown : TList;

     FNomesDosComponentesListaDeEventos_KeyPress      : TStringList;
     FNomesDosComponentesListaDeEventos_KeyUp_KeyDown : TStringList;

     function VerificaSeExisteComponente(componenteNome : String; lista :TStringList): Boolean;
     function RetornaPosicaoPeloNome(componentName : String; lista :TStringList): Integer;
     function PulaProximoCampo(componenteClasseName : String) : Boolean;
   public
     constructor Create(AOwner: TComponent); override;
     destructor  Destroy; override;

     procedure AdicionaEventos_Lista(EventKeyPress: TKeyPressEvent; EventKeyUp_KeyDown : TKeyEvent);

     procedure PularComEnter_KeyPress(Sender : TObject; var Key: Char);
     procedure PularComEnter_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

     procedure AdicionaPularComEnterNosEdits;

   end;

const
   listaClasseParaPular : array [ 1..3 ] of string = ('TDBRadioGroup','TPageControl','TGroupButton');

implementation

uses
  Vcl.StdCtrls, System.SysUtils, Winapi.Windows, Winapi.Messages, Vcl.DBCtrls ;

{ TPularCampoComEnter }

procedure TPularCampoComEnter.AdicionaEventos_Lista(EventKeyPress: TKeyPressEvent; EventKeyUp_KeyDown : TKeyEvent);
 var
   ponteiro_KeyPress       : PKeyNotifyEvent;
   ponteiro_KeyUP_KeyDown  : PKeyEvent;
 begin

   if Assigned(EventKeyPress) then
   begin
      New(ponteiro_KeyPress);
      ponteiro_KeyPress^ := EventKeyPress;
      FListaDeEventos_KeyPress.Add(ponteiro_KeyPress);

   end else
   if Assigned(EventKeyUp_KeyDown) then
   begin
      New(ponteiro_KeyUP_KeyDown);
      ponteiro_KeyUP_KeyDown^ := EventKeyUp_KeyDown;
      FListaDeEventos_KeyUp_KeyDown.Add(ponteiro_KeyUP_KeyDown);
   end;


end;

procedure TPularCampoComEnter.AdicionaPularComEnterNosEdits;
var
  I: Integer;
  teste : String;
begin

   if Assigned(FListaDeEventos_KeyPress) then
      FListaDeEventos_KeyPress.Clear;

   if Assigned(FNomesDosComponentesListaDeEventos_KeyPress) then
      FNomesDosComponentesListaDeEventos_KeyPress.Clear;

   for I := 0 to FForm.ComponentCount - 1 do
   begin

      if FForm.Components[I].ClassName = 'TEdit' then
      begin
         if Assigned( TEdit(FForm.Components[I]).OnKeyPress ) then
         begin
            AdicionaEventos_Lista( TEdit(FForm.Components[I]).OnKeyPress, nil );
            FNomesDosComponentesListaDeEventos_KeyPress.Add(TEdit(FForm.Components[I]).Name);

            TEdit(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;
         end  else
         if Assigned( TEdit(FForm.Components[I]).OnKeyDown ) then
         begin
            AdicionaEventos_Lista(nil,TEdit(FForm.Components[I]).OnKeyDown);
            FNomesDosComponentesListaDeEventos_KeyUp_KeyDown.Add(TEdit(FForm.Components[I]).Name);

            TEdit(FForm.Components[I]).OnKeyDown := PularComEnter_KeyDown;

         end else
            TEdit(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;

      end;

      if FForm.Components[I].ClassName = 'TDBEdit' then
      begin
         if Assigned( TDBEdit(FForm.Components[I]).OnKeyPress ) then
         begin
            AdicionaEventos_Lista( TDBEdit(FForm.Components[I]).OnKeyPress, nil );
            FNomesDosComponentesListaDeEventos_KeyPress.Add(TDBEdit(FForm.Components[I]).Name);

            TDBEdit(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;

         end else
         if Assigned( TDBEdit(FForm.Components[I]).OnKeyDown ) then
         begin
            AdicionaEventos_Lista(nil,TDBEdit(FForm.Components[I]).OnKeyDown);
            FNomesDosComponentesListaDeEventos_KeyUp_KeyDown.Add(TDBEdit(FForm.Components[I]).Name);

            TDBEdit(FForm.Components[I]).OnKeyDown := PularComEnter_KeyDown;

         end else
            TDBEdit(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;
      end;


      if FForm.Components[I].ClassName = 'TDBComboBox' then
      begin
         if Assigned( TDBComboBox(FForm.Components[I]).OnKeyPress ) then
         begin
            AdicionaEventos_Lista( TDBComboBox(FForm.Components[I]).OnKeyPress, nil );
            FNomesDosComponentesListaDeEventos_KeyPress.Add(TDBComboBox(FForm.Components[I]).Name);

            TDBComboBox(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;

         end else
         if Assigned( TDBComboBox(FForm.Components[I]).OnKeyDown ) then
         begin
            AdicionaEventos_Lista(nil,TDBComboBox(FForm.Components[I]).OnKeyDown);
            FNomesDosComponentesListaDeEventos_KeyUp_KeyDown.Add(TDBComboBox(FForm.Components[I]).Name);

            TDBComboBox(FForm.Components[I]).OnKeyDown := PularComEnter_KeyDown;

         end else
            TDBComboBox(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;
      end;

      if FForm.Components[I].ClassName = 'TComboBox' then
      begin
         if Assigned( TComboBox(FForm.Components[I]).OnKeyPress ) then
         begin
            AdicionaEventos_Lista( TComboBox(FForm.Components[I]).OnKeyPress, nil );
            FNomesDosComponentesListaDeEventos_KeyPress.Add(TComboBox(FForm.Components[I]).Name);

            TComboBox(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;
         end  else
         if Assigned( TComboBox(FForm.Components[I]).OnKeyDown ) then
         begin
            AdicionaEventos_Lista(nil,TComboBox(FForm.Components[I]).OnKeyDown);
            FNomesDosComponentesListaDeEventos_KeyUp_KeyDown.Add(TComboBox(FForm.Components[I]).Name);

            TComboBox(FForm.Components[I]).OnKeyDown := PularComEnter_KeyDown;

         end else
            TComboBox(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;

      end;

      if FForm.Components[I].ClassName = 'TDBLookupComboBox' then
      begin
         if Assigned( TDBLookupComboBox(FForm.Components[I]).OnKeyPress ) then
         begin
            AdicionaEventos_Lista( TDBLookupComboBox(FForm.Components[I]).OnKeyPress, nil );
            FNomesDosComponentesListaDeEventos_KeyPress.Add(TDBLookupComboBox(FForm.Components[I]).Name);

            TDBLookupComboBox(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;
         end  else
         if Assigned( TDBLookupComboBox(FForm.Components[I]).OnKeyDown ) then
         begin
            AdicionaEventos_Lista(nil,TDBLookupComboBox(FForm.Components[I]).OnKeyDown);
            FNomesDosComponentesListaDeEventos_KeyUp_KeyDown.Add(TDBLookupComboBox(FForm.Components[I]).Name);

            TDBLookupComboBox(FForm.Components[I]).OnKeyDown := PularComEnter_KeyDown;

         end else
            TDBLookupComboBox(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;

         TDBLookupComboBox(FForm.Components[I]).OnKeyPress := PularComEnter_KeyPress;

      end;

   end;

end;

constructor TPularCampoComEnter.Create(AOwner: TComponent);
begin
   FForm := (AOwner as TForm);

   FListaDeEventos_KeyPress      := TList.Create;
   FListaDeEventos_KeyUp_KeyDown := TList.Create;

   FNomesDosComponentesListaDeEventos_KeyPress      := TStringList.Create;
   FNomesDosComponentesListaDeEventos_KeyUp_KeyDown := TStringList.Create;
end;

destructor TPularCampoComEnter.Destroy;
var
  i : Integer;
begin

   for i := 0 to  FListaDeEventos_KeyUp_KeyDown.Count - 1 do
      Dispose (FListaDeEventos_KeyUp_KeyDown[i]);

   for i := 0 to  FListaDeEventos_KeyPress.Count - 1 do
      Dispose (FListaDeEventos_KeyPress[i]);

   FListaDeEventos_KeyPress.Free;
   FListaDeEventos_KeyUp_KeyDown.Free;

   FNomesDosComponentesListaDeEventos_KeyPress.Free;
   FNomesDosComponentesListaDeEventos_KeyUp_KeyDown.Free;

  inherited;
end;

function TPularCampoComEnter.PulaProximoCampo(
  componenteClasseName: String): Boolean;
var
   cont : Integer;
   achou : Boolean;
begin
   achou := false;

   for cont := Low(listaClasseParaPular) to High(listaClasseParaPular) do
      if componenteClasseName = listaClasseParaPular[cont] then
         achou := true;

   result := achou;
end;

procedure TPularCampoComEnter.PularComEnter_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   PosicaoComponente : Integer;
begin
   if (key = VK_Return) then
      if (
           (VerificaSeExisteComponente( TEdit(Sender).Name, FNomesDosComponentesListaDeEventos_KeyUp_KeyDown )) and
           (TEdit(Sender).Text = EmptyStr)
          ) then
      begin
         try
            PosicaoComponente := RetornaPosicaoPeloNome(TEdit(Sender).Name, FNomesDosComponentesListaDeEventos_KeyUp_KeyDown);
            TEdit(Sender).OnKeyDown := TKeyEvent( FListaDeEventos_KeyUp_KeyDown[ PosicaoComponente ]^);
            TEdit(Sender).OnKeyDown(Sender,key,Shift);
         finally
            TEdit(Sender).OnKeyDown := PularComEnter_KeyDown;
         end;

      end else
      begin
         repeat
            FForm.Perform(Wm_NextDlgCtl,0,0);
         until not(PulaProximoCampo(Screen.ActiveControl.Classname));
      end;

end;

procedure TPularCampoComEnter.PularComEnter_KeyPress(Sender: TObject; var Key: Char);
var
   PosicaoComponente : Integer;
begin
   if (key = #13) then
      if (
           (VerificaSeExisteComponente( TEdit(Sender).Name, FNomesDosComponentesListaDeEventos_KeyPress )) and
           (TEdit(Sender).Text = EmptyStr)
          ) then
      begin
         try
            PosicaoComponente := RetornaPosicaoPeloNome(TEdit(Sender).Name, FNomesDosComponentesListaDeEventos_KeyPress);
            TEdit(Sender).OnKeyPress := TKeyPressEvent( FListaDeEventos_KeyPress[ PosicaoComponente ]^);
            TEdit(Sender).OnKeyPress(Sender,key);
         finally
            TEdit(Sender).OnKeyPress := PularComEnter_KeyPress;
         end;

      end else
      begin
         Key:= #0;
         repeat
            FForm.Perform(Wm_NextDlgCtl,0,0);
         until not(PulaProximoCampo(Screen.ActiveControl.Classname));


      end;
end;

function TPularCampoComEnter.RetornaPosicaoPeloNome(componentName : String; lista :TStringList): Integer;
var
   I : Integer;
begin
   for I := 0 to lista.Count - 1 do
   begin
      if componentName = lista[i] then
      break;
   end;

   Result := I;

end;

function TPularCampoComEnter.VerificaSeExisteComponente(componenteNome : String; lista :TStringList): Boolean;
var
   I : Integer;
begin

   result := False;

   for I := 0 to lista.Count - 1 do
   begin
      if componenteNome = lista[i] then
      begin
         result := True;
         break;
      end;
   end;
end;

end.
