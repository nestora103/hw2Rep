unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    Label1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt4: TEdit;
    edt5: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    mmo1: TMemo;
    lbl7: TLabel;
    edt6: TEdit;
    mmo2: TMemo;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  numFrom:Cardinal;
  numTo:Cardinal;

  degreeFrom:Cardinal;
  degreeTo:Cardinal;

  arrVal:array of {Int64}Extended;
  arrLength:Cardinal;
  iArr:Cardinal;

  i:Cardinal;
  j:Cardinal;
  k:Cardinal;

  iterateVal:{Int64}Extended;

  repCount:Cardinal;
  unRepCount:Cardinal;

  bool:Boolean;

begin
  //x:=exp(b*ln(a));
  //x = a в степени b
  //x:=exp(j*ln(2));

  repCount:=0;
  unRepCount:=0;
  iArr:=1;

  numFrom:=StrToInt(Form1.edt1.Text);
  numTo:=StrToInt(Form1.edt2.Text);

  degreeFrom:=StrToInt(Form1.edt4.Text);
  degreeTo:=StrToInt(Form1.edt5.Text);


  for i:=numFrom to numTo do
  begin
    for j:=degreeFrom to degreeTo do
    begin
      iterateVal:= Power(i,j);
      {round(exp(j*ln(i)))}
      form1.mmo1.Lines.Add('#'+intTostr(unRepCount+1)+' '+FloatToStr(iterateVal)+' '+intTostr(i)+'^'+intTostr(j));
      Inc(unRepCount);
      arrLength:=Length(arrVal);

      if arrLength>0 then
      begin
        bool:=true;
        for k:=0 to arrLength-1 do
        begin
          if iterateVal=arrVal[k] then
          begin
            form1.mmo2.Lines.Add('#'+intTostr(repCount+1)+' '+
              FloatToStr(iterateVal)+' '+intTostr(i)+'^'+intTostr(j)+' Совпал с #'+
              intTostr(k+1)+' '+floatTostr(arrVal[k]));
            inc(repCount);
            bool:=false;
            break;
          end
          else
          begin
            //Inc(unRepCount);
          end;
        end;
        SetLength(arrVal,iArr);
        arrVal[iArr-1]:=iterateVal;
        Inc(iArr);
      end
      else
      begin
        SetLength(arrVal,iArr);
        arrVal[iArr-1]:=iterateVal;
        Inc(iArr);
        //Inc(unRepCount);
      end;
    end;
  end;

  form1.edt3.Text:=IntToStr(repCount);
  form1.edt6.Text:=IntToStr(unRepCount-1);
end;

end.
