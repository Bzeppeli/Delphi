unit basic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AcsModule, ComCtrls, ExtCtrls;

  const MAX_BUFFER_LEN          = 256;


type
  TFormPrincipalBasic = class(TForm)
    Label1: TLabel;
    cbLeitor: TComboBox;
    BInicializar: TButton;
    BConectar: TButton;
    BgetStts: TButton;
    BGetFW: TButton;
    gbAntena: TGroupBox;
    RBon: TRadioButton;
    RBoff: TRadioButton;
    BSelAntena: TButton;
    gbLedVermelho: TGroupBox;
    gbFinalLEd: TGroupBox;
    RBFinalLedon: TRadioButton;
    RBFinalLedoff: TRadioButton;
    gbLedsttsmask: TGroupBox;
    RBonLedMask: TRadioButton;
    RBoffLedMask: TRadioButton;
    gbInitialBlink: TGroupBox;
    RBinitialBon: TRadioButton;
    RBinitialBoff: TRadioButton;
    GroupBox1: TGroupBox;
    RBLedBlinkMaskon: TRadioButton;
    RBLedBlinkingMaskoff: TRadioButton;
    gbLedVerde: TGroupBox;
    gbFinalLedState2: TGroupBox;
    RBFinalLEdon2: TRadioButton;
    RBFinalLedStateoff2: TRadioButton;
    gbLedStateMask2: TGroupBox;
    RBLedStateMaskon2: TRadioButton;
    RBLedstateMaskoff2: TRadioButton;
    gbInitialBlinkStation2: TGroupBox;
    RBInitialBlinkStationon2: TRadioButton;
    RBinitialBlinkingStationoff2: TRadioButton;
    gbLedBlinkMask2: TGroupBox;
    RBLedBlinkMask2on: TRadioButton;
    RBLedBlinkMaskoff2: TRadioButton;
    gbBlinkingDurationControl: TGroupBox;
    gbT1Duration: TGroupBox;
    Label2blink: TLabel;
    Label2: TLabel;
    gbT2Duration: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    gbLinktoBuzzer: TGroupBox;
    RBBuzzerOff: TRadioButton;
    RBT1Duration: TRadioButton;
    RBT2Duration: TRadioButton;
    RBT1andT2Duration: TRadioButton;
    BSetBicolorBuzzerControl: TButton;
    rbDisplay: TRichEdit;
    BClear: TButton;
    Breset: TButton;
    BQuit: TButton;
    t1text: TEdit;
    t2text: TEdit;
    numrepet: TEdit;
    procedure BInicializarClick(Sender: TObject);
    procedure BConectarClick(Sender: TObject);
    procedure BGetFWClick(Sender: TObject);
    procedure BSelAntenaClick(Sender: TObject);
    procedure t1textChange(Sender: TObject);
    procedure t2textChange(Sender: TObject);
    procedure numrepetChange(Sender: TObject);
    procedure BQuitClick(Sender: TObject);
    procedure BSetBicolorBuzzerControlClick(Sender: TObject);
    procedure BClearClick(Sender: TObject);
    procedure BresetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BgetSttsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipalBasic: TFormPrincipalBasic;
  hContext              : SCARDCONTEXT;
  hCard                 : SCARDCONTEXT;
  ioRequest            : SCARD_IO_REQUEST;
  retCode               : integer;
  dwActProtocol, BufferLen      : DWORD;
  SendBuff,RecvBuff           : Array[0..256] of Byte;
  SendLen,RecvLen,nBytRet       : DWORD;
  Buffer                        : array[0..MAX_BUFFER_LEN] of Char;


implementation

{$R *.dfm}
//****************************************************************
procedure DisplayOut(output: String; Mode: integer);
begin

        case mode of
        1: FormPrincipalBasic.rbDisplay.Color := clBlue;
        2: FormPrincipalBasic.rbDisplay.Color := clRed;
        3: begin
                FormPrincipalBasic.rbDisplay.Color := clWhite;
                output := ' << ' + output;
           end;
        4: begin
                FormPrincipalBasic.rbDisplay.Color := clWhite;
                output := ' >> '  + output;
           end;
        end;


        FormPrincipalBasic.rbDisplay.Lines.add(output);
        FormPrincipalBasic.rbDisplay.SelAttributes.Color := clBlack;
        FormPrincipalBasic.rbDisplay.SetFocus;
end;
//***************************************************************


//************************************************************
//Inicio das Funções
//************************************************************

function sendAPDU() : Integer;
var index : integer; tempstr : String;
begin
  ioRequest.dwProtocol := dwActProtocol;
  ioRequest.cbPciLength := sizeof(SCARD_IO_REQUEST);

  tempstr := ' ';
  for index := 0 to SendLen -1 do
    tempstr := tempstr+ Format('%.02X ', [SendBuff[index]]);
  DisplayOut(tempstr,3);

  retCode := ScardTransmit(hCard,
                            @ioRequest,
                            @SendBuff,
                            SendLen,
                            Nil,
                            @RecvBuff,
                            @RecvLen);

  if retCode <> SCARD_S_SUCCESS then
   begin
    DisplayOut(GetScardErrMsg(retCode),2);
    SendAPDU := retCode;
    Exit;
   end;

   tempstr:= '';
   For index:= 0 to RecvLen -1 do
    tempstr:= tempstr + Format('%.02X', [RecvBuff[index]]);

   DisplayOut(tempstr, 4);

   SendAPDU := retCode;

end;

//************************************************************

//************************************************************
//inicio das procedures
//************************************************************


procedure ClearBuffers();
var index : integer;
begin

        for index := 0 to 262 do
         begin
                SendBuff[index] := $00;
                RecvBuff[index] := $00;
          end;
end;

procedure Initialize();
begin

  FormPrincipalBasic.BInicializar.Enabled := true;
  FormPrincipalBasic.BConectar.Enabled := false;
  FormPrincipalBasic.BGetFW.Enabled := false;
  FormPrincipalBasic.gbAntena.Enabled := false;
  FormPrincipalBasic.gbLedVermelho.Enabled := false;
  FormPrincipalBasic.gbLedVerde.Enabled := false;
  FormPrincipalBasic.gbBlinkingDurationControl.Enabled := false;
  FormPrincipalBasic.RBOn.Checked := true;
  FormPrincipalBasic.RBFinalLedoff.Checked := true;
  FormPrincipalBasic.RBOffLedMask.Checked := true;
  FormPrincipalBasic.RBinitialBOff.Checked := true;
  FormPrincipalBasic.RBLedBlinkingMaskoff.Checked := true;
  FormPrincipalBasic.RBFinalLedStateoff2.Checked := true;
  FormPrincipalBasic.RBLedStateMaskoff2.Checked := true;
  FormPrincipalBasic.RBLedBlinkMaskoff2.Checked := true;
  FormPrincipalBasic.RBLedstateMaskoff2.Checked := true;
  FormPrincipalBasic.RBBuzzerOff.Checked := true;
  FormPrincipalBasic.t1text.Text := '00';
  FormPrincipalBasic.t2text.Text := '00';
  FormPrincipalBasic.numrepet.Text := '01';
  FormPrincipalBasic.cbLeitor.Text := '';
  FormPrincipalBasic.rbDisplay.Text := '';
  DisplayOut('Program ready', 1 );

end;

procedure TFormPrincipalBasic.t2textChange(Sender: TObject);
var Key : Char;
begin
if Key <> chr($08) then
    begin
     if Key in ['a'..'z'] then
      Dec(Key, 32);
       if Not (Key in ['0'..'9', 'A'..'F']) then
        Key := Chr($00);
    end;
end;

procedure TFormPrincipalBasic.numrepetChange(Sender: TObject);
var Key : Char;
begin
if Key <> chr($08) then
    begin
     if Key in ['a'..'z'] then
      Dec(Key, 32);
       if Not (Key in ['0'..'9', 'A'..'F']) then
        Key := Chr($00);
    end;
end;

procedure TFormPrincipalBasic.BQuitClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFormPrincipalBasic.BSetBicolorBuzzerControlClick(
  Sender: TObject);
begin
//validação de entradas
        if t1text.Text = '' then
         begin
          t1text.Setfocus;
          Exit;
         end;

        if t2text.Text = '' then
         begin
          t2text.Setfocus;
          Exit;
         end;

       if numrepet.Text = '' then
        begin
         numrepet.Setfocus;
         Exit;
        end;

        if numrepet.Text = '00' then
         begin
          numrepet.Text := '01';
          numrepet.SetFocus;
          Exit;
         end;

         ClearBuffers();

         SendBuff[0] := $FF;
         SendBuff[1] := $00;
         SendBuff[2] := $40;
         SendBuff[3] := $00;

        if RBFinalLedon.Checked = true then
         begin
          SendBuff[3] := SendBuff[3] or $01;
         end;

         if RBFinalLEdon2.Checked = true then
          begin
           SendBuff[3] := SendBuff[3] or $02;
          end;

         if RBonLedMask.Checked = True then
          begin
           SendBuff[3] := SendBuff[3] or $04;
          end;

         if RBLedStateMaskon2.Checked = True then
          begin
           SendBuff[3] := SendBuff[3] or $08;
          end;

         if RBinitialBon.Checked = True then
          begin
           SendBuff[3] := SendBuff[3] or $10;
          end;

         if RBInitialBlinkStationon2.Checked = True then
          begin
           SendBuff[3] := SendBuff[3] or $20;
          end;

         if RBLedBlinkMaskon.Checked = True then
          begin
           SendBuff[3] := SendBuff[3] or $40;
          end;

         if RBLedBlinkMask2on.Checked = True then
          begin
           SendBuff[3] := SendBuff[3] or $80;
          end;


          SendBuff[4] := $40;
          SendBuff[5] := StrToInt('$' + t1text.Text);
          SendBuff[6] := StrToInt('$' + t2text.Text);
          SendBuff[7] := StrToInt('$' + numrepet.Text);

          if RBBuzzerOff.Checked = true then
           begin
            SendBuff[8] := $00;
           end;

          if RBT1Duration.Checked = True then
           begin
            SendBuff[8] := $01;
           end;

          if RBT2Duration.Checked = True then
           begin
            SendBuff[8] := $02;
           end;

          if RBT1andT2Duration.Checked = True then
           begin
            SendBuff[8] := $03;
           end;

           SendLen := 9;
           RecvLen := 2;

           retCode := SendAPDU();
           if retCode <> SCARD_S_SUCCESS then
            begin
             Exit;
            end;
end;

procedure TFormPrincipalBasic.BClearClick(Sender: TObject);
begin
rbDisplay.Text := '';
end;

procedure TFormPrincipalBasic.BresetClick(Sender: TObject);
begin
retCode := SCardDisconnect(hCard, SCARD_UNPOWER_CARD);
  retCode := SCardReleaseContext(hContext);
  rbDisplay.Text := '';
  Initialize();
end;

procedure TFormPrincipalBasic.FormCreate(Sender: TObject);
begin
Initialize();
end;

procedure TFormPrincipalBasic.BgetSttsClick(Sender: TObject);
var index : integer; tmpstr : String;
begin

   ClearBuffers();
   //comando para pegar estatus
   SendBuff[0] := $FF;
   SendBuff[1] := $00;
   Sendbuff[2] := $00;
   SendBuff[3] := $00;
   SendBuff[4] := $02;
   SendBuff[5] := $D4;
   SendBuff[6] := $04;

   SendLen := 7;
   RecvLen := 12;

   retCode := SendAPDU;
   if retCode <> SCARD_S_SUCCESS then
    begin
     Exit;
    end;


    for index := recvlen -2 to RecvLen -1 do
     begin
      tmpstr := tmpstr + Format('%.02X', [RecvBuff[index]]);
     end;

     if (tmpstr = 'D505280000809000') or (tmpstr = 'D505000000809000') then
      begin
      // nenhuma tag esta no campo
       DisplayOut('Nenhuma tag foi detectada' + Format('%.02X',[RecvBuff[0]]),1);
      end
      else begin
       //error code
       DisplayOut('Error Code: ' + Format('%.02X',[RecvBuff[2]]),2);

       // o Campo indica  se tem um RF externo no presente e detecta
       //(Field = 0x01 or not (Fild = 0x00)
       if RecvBuff[3] = $01 then
        begin
         DisplayOut('RF externo está presente e detectado' + Format('%.02X',[RecvBuff[3]]),4);
        end
        else begin
          DisplayOut('RF externo não está presente e não foi detectado' + Format('%.02X',[RecvBuff[3]]),4);
        end;

        //Número de alvos atualmente controlados pelo PN532 atuando como iniciador. O valor padrão é 1
        DisplayOut('Numero do Alvo:' + Format('%.02X',[RecvBuff[4]]),4);

        //numero Logico
        DisplayOut('Numero do Alvo' + Format('%.02X',[RecvBuff[5]]),4);

        //Taxa de bits na recepção
        case RecvBuff[6] of
         $00: DisplayOut('Taxa de bits na recepção: ' + Format('%.02X',[RecvBuff[6]]) + ' (106 kbps)', 4);
         $01: DisplayOut('Taxa de bits na recepção: ' + Format('%.02X',[RecvBuff[6]]) + ' (212 kbps)', 4);
         $02: DisplayOut('Taxa de bits na recepção: ' + Format('%.02X',[RecvBuff[6]]) + ' (424 kbps)', 4);
        end;

        //Taxa de bits na Tranmição
        case RecvBuff[7] of
         $00: DisplayOut('Taxa de bits na Tranmição: ' + Format('%.02X',[RecvBuff[7]]) + ' (106 kbps)', 4);
         $01: DisplayOut('Taxa de bits na Tranmição: ' + Format('%.02X',[RecvBuff[7]]) + ' (212 kbps)', 4);
         $02: DisplayOut('Taxa de bits na Tranmição: ' + Format('%.02X',[RecvBuff[7]]) + ' (424 kbps)', 4);
        end;

        case RecvBuff[8] of
         $00: DisplayOut('Tipo de Modulação: ' + Format('%.02X',[RecvBuff[8]]) + ' (ISO14443 or MiFare)', 4);
         $01: DisplayOut('Tipo de Modulação: ' + Format('%.02X',[RecvBuff[8]]) + ' (Active Mode)', 4);
         $02: DisplayOut('Tipo de Modulação: ' + Format('%.02X',[RecvBuff[8]]) + ' (Innovision Jewel Tag)', 4);
         $10: DisplayOut('Tipo de Modulação: ' + Format('%.02X',[RecvBuff[8]]) + ' (Felica)', 4);
        end;
     end;

end;

procedure TFormPrincipalBasic.BInicializarClick(Sender: TObject);
var index : integer;
begin
        //estabilizador de contexto
        retCode := SCardEstablishContext(SCARD_SCOPE_USER,
                                         nil,
                                         nil,
                                         @hContext);
        if retCode <> SCARD_S_SUCCESS then
         begin
                displayout(getScardErrMsg(retCode),2);
         end;

         //lista de leitores PC/SC instalados no sistema

         BufferLen := MAX_BUFFER_LEN;
         retCode := SCardListReadersA(hcontext,
                                      nil,
                                      @Buffer,
                                      @BufferLen);
         if retCode <> SCARD_S_SUCCESS then
          begin
                Displayout(getScardErrMsg(retCode),2);
                exit;
          end;

          BInicializar.Enabled := false;
          BConectar.Enabled := true;

    LoadListToControl(cbLeitor,@Buffer,BufferLen);
    // Procurar por ACR128 PCI e fazer - lo o leitor padrão no combobox
    for index := 0 to cbLeitor.Items.Count-1 do
     begin
        cbLeitor.ItemIndex := index;
        if AnsiPos('ACR122U PICC', cbLeitor.Text) > 0 then
         begin
          exit;
         end;
     end;
     cbLeitor.ItemIndex := 0;
end;

procedure TFormPrincipalBasic.BConectarClick(Sender: TObject);
begin
 //conectar usando o leitor para procurar uma conexão
        retCode := SCardConnectA(hContext,
                                 PChar(cbLeitor.Text),
                                 SCARD_SHARE_SHARED,
                                 SCARD_PROTOCOL_T0 or SCARD_PROTOCOL_T1,
                                 @hCard,
                                 @dwActProtocol);

        if retCode <> SCARD_S_SUCCESS then
        begin
         Displayout(GetScardErrMsg(retCode),2)
        end
        else begin
         Displayout(' conexão bem sucedida ' + cbLeitor.Text,1)
         end;

    FormPrincipalBasic.Bconectar.Enabled := False;
    FormPrincipalBasic.BGetFW.Enabled := True;
    FormPrincipalBasic.gbAntena.Enabled := True;
    FormPrincipalBasic.gbLedVermelho.Enabled := True;
    FormPrincipalBasic.gbLedVerde.Enabled := True;
    FormPrincipalBasic.gbBlinkingDurationControl.Enabled := True;
end;

procedure TFormPrincipalBasic.BGetFWClick(Sender: TObject);
var index: integer; tempstr :string;

begin


        //pega a versão do firmware do leitor
        ClearBuffers();

        SendBuff[0] := $FF;
        SendBuff[1] := $00;
        SendBuff[2] := $48;
        SendBuff[3] := $00;
        SendBuff[4] := $00;

        SendLen := 5;
        RecvLen := 10;

        retCode := SendAPDU();
        if retCode <> SCARD_S_SUCCESS then
         begin
          Exit;
         end;


         //interprete os dados da Firmware
         tempstr := 'Firmware Version: ';
         for index := 0 to RecvLen -1 do
           tempstr := tempstr + Chr(RecvBuff[index]);

         DisplayOut(Tempstr,1);

end;


procedure TFormPrincipalBasic.BSelAntenaClick(Sender: TObject);
begin

        //selecionar as opções de antena
        ClearBuffers();

        SendBuff[0] := $FF;
        SendBuff[1] := $00;
        SendBuff[2] := $00;
        SendBuff[3] := $00;
        SendBuff[4] := $04;
        SendBuff[5] := $D4;
        SendBuff[6] := $32;
        SendBuff[7] := $01;

    if RBon.Checked = True then
     begin
        SendBuff[8] := $01;
     end
     else begin
        SendBuff[8] := $00;
     end;

     SendLen := 9;
     RecvLen := 4;

     retCode := SendAPDU();
     if retCode <> SCARD_S_SUCCESS then
        begin
         exit;
        end;
end;



procedure TFormPrincipalBasic.t1textChange(Sender: TObject);
var Key : char;
begin
if Key <> chr($08) then
    begin
     if Key in ['a'..'z'] then
      Dec(Key, 32);
       if Not (Key in ['0'..'9', 'A'..'F']) then
        Key := Chr($00);
     end;

end;

end.
