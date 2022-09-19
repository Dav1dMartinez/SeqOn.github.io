unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  ECM_FIRST = $1500;
  EM_SETCUEBANNER = ECM_FIRST + 1;
  MyText = '������� 2-� �������� ����������� �����...';
  max = Word.MaxValue;
  min = Word.MinValue;
  

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b: word;
begin
  a := StrToInt(edit1.Text);
  if (a>min) and (a<max) then
    begin
      b:=Swap(a);
      edit1.Text := IntToStr(b);
    end 
  else 
    begin
      ShowMessage('�� ������ � ��������');
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SendMessage(Edit1.Handle, EM_SETCUEBANNER,
   0, LParam(PChar(WideString(MyText))));
end;

end.
