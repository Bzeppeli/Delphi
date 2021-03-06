unit QuadroPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AcsModule, ComCtrls, ExtCtrls;

const MAX_BUFFER_LEN = 256;

type
  TFormPesquisa = class(TForm)
    Nome: TLabel;
    editNome: TEdit;
    editeData: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    editCPF: TEdit;
    rbDisplay: TMemo;
    Label3: TLabel;
    cbLeitor: TComboBox;
    Binicialize: TButton;
    Bconecte: TButton;
    procedure BinicializeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisa: TFormPesquisa;
  hContext              :SCARDCONTEXT;
  hCard                 :SCARDCONTEXT;
  ioRequest             :SCARD_IO_REQUEST;
  retCode               : integer;
  dwAcrProtocol, BufferLen: DWORD;
  SendBuff,RecvBuff     :Array[0..256] of Byte;
  SendLen,RecvLen,nByteRet: DWORD;
  Buffer                :Array[0..MAX_BUFFER_LEN] of char;


implementation

{$R *.dfm}

//****************************************************************8
procedure DisplayOut(output : string; mode : integer);
begin

        case mode of
          1: FormPesquisa.rbDisplay.SelAttributes.Color := clBlue;
          2: FormPesquisa.rbDisplay.SelAttributes.Color := clRed;
          3: begin
                FormPesquisa.rbDisplay.SelAttributes.Color:= clBlack;
                output:= '<<' + output;
             end;
          4: begin
                FormPesquisa.rbDisplay.SelAttributes.Color := ClBlack;
                output:= '>>' + output;
             end;

    FormPesquisa.rbDisplay.Lines.Add(output);
    FormPesquisa.rbDisplay.SelAttributes.Color := clBlack;
    FormPesquisa.rbDisplay.SetFocus;

end;

//**************************************************************
// Inicio de procedures
//**************************************************************

procedure ClearBuffers();
var index: integer;
begin
        for index := 0 to  262 do;
         begin
           SendBuff[index]:= $00;
           RecvBuff[index]:= $00;
         end;
end;

//**************************************************************

//*****************************************************
// inicio das func�es
//*****************************************************

function sendAPDU(): integer;
var index :intger; tempstr : string;
begin

        ioRequest.dwProtocol := dwActProtocol;
        ioRequest.cbPciLength := sizeof(SCARD_IO_REQUEST);

        tempstr:= '';
        for index := 0 to SendLen -1 do
         begin
            tempstr := tempstr + Format('%.02X', [SendBuff[index]]);
         end;
        DisplayOut(tempstre,4);

        retCode := SCardTransmit(hCard,
                                 @ioRequest,
                                 @SendBuff,
                                 SendLen,
                                 nil,
                                 @RecvBuff,
                                 @RecvLen);
        if retCode <> SCARD_S_SUCCESS then
         begin
          DisplayOut(GetScardErrMsg(retCode),2);
          SendAPDU := retCode;
          Exit;
         end;

        SendAPDU := retCode;


begin

procedure TFormPesquisa.BinicializeClick(Sender: TObject);
var index: integer;
begin

     //estabilizador de contexto
     retCode := ScardEstablishContext(SCARD_SCOP_USEr,
                                      nil,
                                      nil,
                                      @hContext);
     if retCode <> SCARD_S_SUCCESS then
      begin
       DisplayOut(GetScardErrMsg(retCode)),2);
      end;

      //Lista de Leitores PC/SC instalados no sistema

      BufferLen := MAX_BUFFER_LEN;
      retCode := ScardListReadersA(hContext,
                                   nil,
                                   @Buffer,
                                   @BufferLen);
      if retCode <> SCARD_S_SUCCESS then
       begin
        DisplayOut(GetScardErrMsg(retCode),2);
        Exit;
       end;

       Binicialize.enabled := False;
       BConecte.enabled := True;

       LoadListToControl (cbLeitor,@Buffer,BufferLen);
       //procura por acr122 e deixa como Leitor padr�o na combox
       For index := 0 to cbLeitor.itens.Count -1 do
        begin
         cbLeitor.ItemIndex := index;
         if AnsiPos('ACR122U PICC', cbLeitor.Text) > 0 then
          Exit;
        end;
     cbLeitor.ItemIndex := 0;

end;

end.
