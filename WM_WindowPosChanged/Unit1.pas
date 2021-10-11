unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    FLeft, FTop: Integer;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.DFM}

procedure TForm1.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
 if (Form2<>nil) and ((FLeft<>Message.WindowPos.x)
                    or (FTop<>Message.WindowPos.y))
 then
  begin
   with Form2 do
    SetBounds(Left+Message.WindowPos.x-FLeft,
                  Top+Message.WindowPos.y-FTop, Width, Height);
   FLeft:=Message.WindowPos.x+20;
   FTop:=Message.WindowPos.y+20;
  end;
 inherited;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 FLeft:=Left+480;
 FTop:=Top+125;
 Form2.Show;
end;

end.
