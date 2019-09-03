unit p2pativepass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, AscModule;

const MAX_BUFFER_LEN = 256;
const IOCTL_CCID_ESCAPE_SCARD_CTL_CODE = 3211264 + 3500 * 4;

type
  TFormActivPass = class(TForm)
    LbLeitor: TLabel;
    cbLeitor: TComboBox;
    rbDisplay: TMemo;
    Binicializar: TButton;
    Bconectar: TButton;
    BsetActive: TButton;
    gbEnviar: TGroupBox;
    tbDados: TMemo;
    Blimpar: TButton;
    Breset: TButton;
    BSair: TButton;
    procedure BinicializarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BconectarClick(Sender: TObject);
    procedure BsetActiveClick(Sender: TObject);
    procedure BresetClick(Sender: TObject);
    procedure BlimparClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormActivPass: TFormActivPass;
  hContext            : SCARDCONTEXT;
  hCard               : SCARDCONTEXT;
  ioRequest           : SCARD_IO_REQUEST;
  retCode             : Integer;
  dwActProtocol, BufferLen  : DWORD;
  SendBuff, RecvBuff        : array [0..262] of Byte;
  SendLen, RecvLen, nBytesRet : DWORD;
  Buffer      : array [0..MAX_BUFFER_LEN] of char;
  data        : string;

implementation

{$R *.dfm}
//*********************************************************************
// procedures
//*********************************************************************

procedure Display(output: String; mode: integer);
begin

  case mode of
    1: FormActivPass.rbDisplay.SelAttributes.Color := clBlue;
    2: FormActivPass.rbDisplay.SelAttributes.Color := clRed;
    3: begin
          FormActivPass.rbDisplay.SelAttributes.Color := clBlack;
          output := '<< ' + output;
       end;
    4: begin
          FormActivPass.rbDisplay.SelAttributes.Color := clBlack;
          output := '>> ' + output;
       end;
  end;

  FormActivPass.rbDisplay.Lines.Add(output);
  FormActivPass.rbDisplay.SelAttributes.Color := clBlack;
  FormActivPass.rbDisplay.SetFocus;

end;

procedure ClearBuffers();
var index: integer;
begin

  for index := 0 to 262 do
    begin
      SendBuff[index] := $00;
      RecvBuff[index] := $00;
    end;

end;

//*********************************************************************

//*********************************************************************
//functions
//*********************************************************************

function CardControl():integer;
var index: integer; tempstr:string;
begin

  tempstr:= '';
  for index:= 0 to SendLen - 1 do
   tempstr:= tempstr + Format('%.02x', [SendBuff[index]]);

  Display(tempstr,3);

  retCode := ScardControl(hCard,
                          IOCTL_CCID_ESCAPE_SCARD_CTL_CODE,
                          @SendBuff,
                          SendLen,
                          @RecvBuff,
                          RecvLen,
                          @nBytesRet);

  if retCode <> SCARD_S_SUCCESS then begin
  Display(GetScardErrMsg(retCode),2);
  Exit;
  end;

  tempstr:='';
  for index := 0 to RecvLen - 1 do
    tempstr := tempstr + Format('%.02X', [RecvBuff[index]]);

  Display(temsptr,4);

  CardControl := retCode;
end;

procedure SendData();
var tempdata: array [0..512] of byte; data: string; datalen: integer; index: integer;
begin

        //transfere o dado do tipo string para o bite do array
        // e determina o tamanho
        data := FormActivPass.tbDados.Text;
        dataLen:= Length(data);

        for index := 0 to datalen - 1 do
         tempdata[index] := ord(data[index+1]);

       //enviar o tamanho do dado primeiro
       //de modo que o dispositivo receptor
       //saiba a quantidade de tempo dos dados
       ClearBuffers();
       SendBuff[0] := $FF;
       SendBuff[1] := $00;
       SendBuff[2] := $00;
       SendBuff[3] := $00;
       SendBuff[4] := $01;
       SendBuff[5] := $D4;
       SendBuff[6] := $40;
       SendBuff[7] := $01;
       SendBuff[8] := datalen;

       SendLen := 9;
       RecvLen := 7;

       retcode := CardControl();
       if retcode <> SCARD_S_SUCCESS then begin
        Exit;
       end;

       //Enviar dados Atuais
        ClearBuffers();
        SendBuff[0] := $FF;
        SendBuff[1] := $00;
        SendBuff[2] := $00;
        SendBuff[3] := $00;
        SendBuff[4] := datalen;
        SendBuff[5] := $D4;
        SendBuff[6] := $40;
        SendBuff[7] := $01;

        for index := 0 to datalen - 1 do
         SendBuff[index+8] := tempdata[index];

        SendLen := datalen + 8;
        RecvLen := 7;

        retcode := CardControl();
        if retcode <> SCARD_S_SUCCESS then begin
         Exit;
        end;

end;

procedure SetActive();
var index: integer; tempstr: string;
begin
        //configurar modo ativo
        ClearBuffers();
        SendBuff[0] := $FF;
        SendBuff[1] := $00;
        SendBuff[2] := $00;
        SendBuff[3] := $00;
        SendBuff[4] := $0A;
        SendBuff[5] := $D4;
        SendBuff[6] := $56;
        SendBuff[7] := $01;
        SendBuff[8] := $02;
        SendBuff[9] := $01;
        SendBuff[10] := $00;
        SendBuff[11] := $FF;
        SendBuff[12] := $FF;
        SendBuff[13] := $00;
        SendBuff[14] := $00;

        SendLen := 15;
        RecvLen := 21;

        retCode := CardControl();
        if retCode <> SCARD_S_SUCCESS then begin
         exit;
        end;

        for index := RecvLen - 2 to RecvLen - 1 do
         tempstr := tempstr + Format('%.02X', [RecvBuff[index]]);

        if tempstr <> '9000' then begin
         Display('set passive Failed', 2);
         Exit;
        end;

        SendData();

procedure Inicializar();
begin

  FormActivePass.Binicializar.Enabled := true;
  FormActivePass.Bconectar.Enabled := false;
  FormActivePass.BsetActive.Enabled := false;
  FormActivePass.gbEnviar.Enabled := false;
  FormActivePass.tbDados.Text := '';
  FormActivePass.rbDisplay.Clear;
  Display('Pronto', 1);

end;

Procedure GetFirmware();
var tempstr:string; Index:integer;

        //Pega o firmware do Leitor;
        ClearBuffers();
        SendBuff[0] := $FF;
        SendBuff[1] := $00;
        SendBuff[2] := $48;
        SendBuff[3] := $00;
        SendBuff[4] := $00;

        SendLen := 5;
        RecvLen := 10;

        retCode := CardControl();
        if retCode <> SCARD_S_SUCCESS then begin
         Exit;
        end;

        tempstr := '';
        for index := o to RecvLen -1 do
         tempstr := tempstr + chr(RecvBuff[index]);

        Display('Versão do Fimware: ' + tempstr,1);

end;




procedure TFormActivPass.BinicializarClick(Sender: TObject);
Var inndex: integer;
begin

        //Stablish Context
        retCode:= SCardEstablishContext(SCARD_SCOPE_USER,
                                        nil,
                                        nil,
                                        @hContext);
        if retCode <> SCARD_S_SUCCESS then begin
         Display(GetScardErrMsg(retCode), 2);
         Exti;
        end;

        //listar Leitores Pc/sc instalados no sistema
        BufferLen := MAX_BUFFER_LEN
        retCode := SCardListReadersA(hContext,
                                     nil,
                                     nil,
                                     @hContext);
        if retCode <> SCARD_S_SUCCESSS then begin
         Display(getscarderrmsg(retCode),2);
         exit;
        end;

        Bincializar.enabled := false;
        Bconectar.enabled := true;

        LoadListToControl(cbLeitor,@buffer,bufferLen);
        //procure por acr122 picc e faça o leitor padrão na combobox
        for index := 0 do cbLeitor.intems.Count -1 do begin
         cbLeitor.itemIndex := index;
          if Ansipos('ACR122 PICC', cbLeitor.Text) > 0 then
           Exit;
          end;
         cbLeitor.ItemIndex := 0;

end;



procedure TFormActivPass.FormCreate(Sender: TObject);
begin
 Inicializar();
end;

procedure TFormActivPass.BconectarClick(Sender: TObject);
begin

//conecte o leitor usando uma conxão compartilhada
  retCode := SCardConnectA(hContext,
                           PChar(cbReader.Text),
                           SCARD_SHARE_SHARED,
                           SCARD_PROTOCOL_T0 or SCARD_PROTOCOL_T1,
                           @hCard,
                           @dwActProtocol);

  if retcode <> SCARD_S_SUCCESS then begin
    //Conectar o leitor usando conexão direta
    retCode := SCardConnectA(hContext,
                             PChar(cbLeitor.Text),
                             SCARD_SHARE_DIRECT,
                             0,
                             @hCard,
                             @dwActProtocol);
    if retcode <> SCARD_S_SUCCESS then begin
      displayout(GetScardErrMsg(retcode),2);
    end
    else begin
      Display('Successful connection to ' + cbLeitor.Text, 1)
    end;
  end
  else begin
    Display('Successful connection to ' + cbLeitor.Text, 1)
  end;

  GetFirmware();

  FormActivPass.Bconectar.Enabled := false;
  FormActivPass.BsetActive.Enabled := true;
  FormActivPass.gbEnviar.Enabled := true;

end;

procedure TFormActivPass.BsetActiveClick(Sender: TObject);
begin
        SetActive();
end;

procedure TFormActivPass.BresetClick(Sender: TObject);
begin
       retcode := ScardDisconnect(hCard, SCARD_UNPOWER_CARD);
       retcode := ScardReleaseContext(hContext);
       Initialize();
end;

procedure TFormActivPass.BlimparClick(Sender: TObject);
begin
 rbDisplay.Clear;
end;

procedure TFormActivPass.BSairClick(Sender: TObject);
begin
Application.Terminate;
end;

end.
