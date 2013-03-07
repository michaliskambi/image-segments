unit mainf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, ExtDlgs;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnChooseSrcImage: TButton;
    CheckAvgRect: TCheckBox;
    CheckTwoColors: TCheckBox;
    LabelRectWidth: TLabel;
    LabelRectWidth1: TLabel;
    LabelRectWidth2: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SpinTwoColorsLevel: TSpinEdit;
    SpinRectWidth: TSpinEdit;
    SpinRectHeight: TSpinEdit;
    procedure BtnChooseSrcImageClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ImageSegmentsUtils, CastleLCLUtils, CastleImages, CastleUtils, ShowResultF;

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnChooseSrcImageClick(Sender: TObject);
var
  OutFileName: string;
begin
  FileFiltersToDialog(LoadImage_FileFilters, OpenPictureDialog1);
  if OpenPictureDialog1.Execute then
  begin
    AvgRect := CheckAvgRect.Checked;
    TwoColors := CheckTwoColors.Checked;
    TwoColorLevel := SpinTwoColorsLevel.Value;
    OutFileName := AppendToFilename(OpenPictureDialog1.FileName, '_out');
    DoImageSegments(OpenPictureDialog1.FileName,
      OutFileName, SpinRectWidth.Value, SpinRectHeight.Value);
    ShowResult.FileName:= OutFileName;
    ShowResult.ShowModal;
  end;
end;

end.

