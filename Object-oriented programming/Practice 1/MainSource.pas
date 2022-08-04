unit MainSource;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.StdActns,
  Vcl.Grids,
  NewSource,
  barGraph;

type
  room = record
    number, category, bedCount, price : string[20];
  end;

  TMainForm = class(TForm)
    ActionMainMenuBar: TActionMainMenuBar;
    ActionManager: TActionManager;
    FileNew: TAction;
    FileSave: TAction;
    FileOpen: TFileOpen;
    FileSaveAs: TFileSaveAs;
    table: TStringGrid;
    Timer: TTimer;
    FindButton: TButton;
    categoryListFind: TComboBox;
    EditBedCount: TEdit;
    LabelCategory: TLabel;
    LabelBedCount: TLabel;
    tableFind: TStringGrid;
    categoryListAvgPrice: TComboBox;
    Label1: TLabel;
    ButtonAvgPrice: TButton;
    EditAvgPrice: TEdit;
    Label2: TLabel;
    EditMax: TEdit;
    ButtonMax: TButton;
    barGraph: TButton;
    procedure FileSaveExecute(Sender: TObject);
    procedure FileOpenAccept(Sender: TObject);
    procedure FileNewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileSaveAsBeforeExecute(Sender: TObject);
    procedure FileSaveAsAccept(Sender: TObject);
    procedure FileOpenBeforeExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure tableKeyPress(Sender: TObject; var Key: Char);
    procedure tableExit(Sender: TObject);
    procedure tableGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure tableSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure FindButtonClick(Sender: TObject);
    procedure ButtonAvgPriceClick(Sender: TObject);
    procedure ButtonMaxClick(Sender: TObject);
    procedure barGraphClick(Sender: TObject);
  private
    database : file of room;
    isChanged : boolean;
    currentRoomsNum : integer;
    fileNameExt : string;
    currentCategories : TStringList;
    procedure SaveTableInFile;
    procedure UploadTableFromFile;
    procedure ClearTable;
    procedure ClearTableFind;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  table.Cells[0, 0] := '�����';
  table.Cells[1, 0] := '���������';
  table.Cells[2, 0] := '���-�� ����';
  table.Cells[3, 0] := '����';

  tableFind.Cells[0, 0] := '�����';
  tableFind.Cells[1, 0] := '����';

  isChanged := false;

  currentRoomsNum := 0;

  currentCategories := TStringList.Create;
  currentCategories.Sorted := true;
end;



procedure TMainForm.saveTableInFile;
var i : integer; buf : room;
begin
  rewrite(database);

  for i := 1 to currentRoomsNum do
  begin
    buf.number := table.Cells[0, i];
    buf.category := table.Cells[1, i];
    buf.bedCount := table.Cells[2, i];
    buf.price := table.Cells[3, i];

    write(database, buf);
  end;
end;



procedure TMainForm.UploadTableFromFile;
var i, indexOfCategory : integer; buf: room;
begin
  Reset(database);

  indexOfCategory := 0;
  i := 1;
  while (not EOF(database)) do
  begin
    read(database, buf);

    table.Cells[0, i] := buf.number;
    table.Cells[1, i] := buf.category;
    table.Cells[2, i] := buf.bedCount;
    table.Cells[3, i] := buf.price;

    i := i + 1;


    if (currentCategories.IndexOf(buf.category) = -1) and (buf.category <> '') then
      currentCategories.add(buf.category);

  end;

  currentRoomsNum := i - 1;
  categoryListFind.Items := currentCategories;
  categoryListAvgPrice.Items := currentCategories;
end;



procedure TMainForm.ClearTable;
var i : integer;
begin
  for i := 1 to currentRoomsNum do
  begin
    table.cells[0, i] := '';
    table.cells[1, i] := '';
    table.cells[2, i] := '';
    table.cells[3, i] := '';
  end;
  currentRoomsNum := 0;
  currentCategories.Clear;
end;



procedure TMainForm.ClearTableFind;
var i : integer;
begin
  with tableFind do
  for i := 1 to RowCount - 1 do
    Rows[i].Clear;
end;



procedure TMainForm.tableKeyPress(Sender: TObject; var Key: Char);
begin
  case table.Col of
    0 : if not ((Key in ['0'..'9']) or (Key = #8)) then Key := #0;
    2 : if not ((Key in ['0'..'9']) or (Key = #8)) then Key := #0;
    3 : if not ((Key in ['0'..'9']) or (Key = ',') or (Key = #8)) then Key := #0;
  end;
end;



procedure TMainForm.FindButtonClick(Sender: TObject);
var i, j : integer;
begin
  clearTableFind;

  if (categoryListFind.Text = '') then
  begin
    tableFind.Cells[0, 1] := '(�������� ���������)';
    tableFind.Cells[1, 1] := '(�������� ���������)';
  end
  else
  begin
    j := 1;
    for i := 1 to currentRoomsNum do
    begin
      if (table.Cells[1, i] = categoryListFind.text) and
      ((EditBedCount.Text = '') or (table.Cells[2, i] = EditBedCount.Text)) then
      begin
        if (table.Cells[0, i] = '') then
          tableFind.Cells[0, j] := '����������� �����'
        else
          tableFind.Cells[0, j] := table.Cells[0, i];

        if (table.Cells[3, i] = '') then
          tableFind.Cells[1, j] := '���������� ���������'
        else
          tableFind.Cells[1, j] := table.Cells[3, i];

        j := j + 1;
      end;
    end;

    if (j = 1) then
    begin
      tableFind.Cells[0, 1] := '(��� �����������)';
      tableFind.Cells[1, 1] := '(��� �����������)';
    end;
  end;

end;



procedure TMainForm.barGraphClick(Sender: TObject);
var CategoriesAndRooms : TStringList; i : integer;
begin
  CategoriesAndRooms := TStringList.Create;

  for i := 1 to currentRoomsNum do
    if (table.Cells[1, i] <> '') then
    begin
      if (CategoriesAndRooms.Values[table.Cells[1, i]] <> '') then
        CategoriesAndRooms.Values[table.Cells[1, i]] :=
          IntToStr(StrToInt(CategoriesAndRooms.Values[table.Cells[1, i]]) + 1)
      else
        CategoriesAndRooms.Values[table.Cells[1, i]] := '1';
    end;
  BarGraphForm.draw(CategoriesAndRooms, currentCategories);
  CategoriesAndRooms.Destroy;
  BarGraphForm.show;
end;

procedure TMainForm.ButtonAvgPriceClick(Sender: TObject);
var i, beds : integer; sum : real;
begin
  beds := 0;
  sum := 0;
  for i := 1 to currentRoomsNum do
  begin
    if (table.Cells[1, i] = categoryListAvgPrice.text) then
    begin
      if (table.Cells[2, i] <> '') and (table.Cells[3, i] <> '') then
      begin
        beds := beds + StrToInt(table.Cells[2, i]);
        sum := sum + StrToFloat(table.Cells[3, i]);
      end;
    end;
  end;
  if (sum <> 0) then
    EditAvgPrice.Text := FloatToStr(sum / beds);
end;



procedure TMainForm.ButtonMaxClick(Sender: TObject);
var i, sum : integer;
begin
  sum := 0;
  for i := 1 to currentRoomsNum do
    if (table.Cells[2, i] <> '') then
      sum := sum + StrToInt(table.Cells[2, i]);
  EditMax.Text := IntToStr(sum);
end;



procedure TMainForm.FileNewExecute(Sender: TObject);
begin
  Timer.Enabled := true;
  NewForm.show;
end;



procedure TMainForm.TimerTimer(Sender: TObject);
var buttonPressed : integer;
begin
  if not NewForm.Showing then
  begin
    Timer.Enabled := false;
    if (NewForm.isCreated) and (not MainForm.isChanged) then
    begin
      ClearTable;

      AssignFile(database, NewForm.getFullFileName);
      Rewrite(database);

      fileNameExt := NewForm.getFileName + '.dat';
      MainForm.Caption := '���� ������ - ' + fileNameExt;

      table.Enabled := true;
    end
    else if (NewForm.isCreated) then
    begin
      ButtonPressed := MessageDlg('��������� ��������� � "' + fileNameExt + '" ?', mtConfirmation, mbYesNoCancel, 0);

      if ButtonPressed = mrYes then
      begin
        SaveTableInFile;

        isChanged := false;
        FileSave.Enabled := false;

        AssignFile(database, NewForm.getFullFileName);
        Rewrite(database);
        fileNameExt := NewForm.getFileName + '.dat';
        MainForm.Caption := '���� ������ - ' + fileNameExt;

        table.Enabled := true;
        clearTableFind;
      end
      else if ButtonPressed = mrNo then
      begin
        AssignFile(database, NewForm.getFullFileName);
        Rewrite(database);
        fileNameExt := NewForm.getFileName + '.dat';
        MainForm.Caption := '���� ������ - ' + fileNameExt;

        table.Enabled := true;
        clearTableFind;
      end;
    end;
  end;
end;



procedure TMainForm.FileOpenBeforeExecute(Sender: TObject);
begin
  FileOpen.Dialog.FileName := '';
end;



procedure TMainForm.FileOpenAccept(Sender: TObject);
begin
  AssignFile(database, FileOpen.Dialog.FileName);

  clearTable;
  UploadTableFromFile;

  fileNameExt := ExtractFileName(FileOpen.Dialog.FileName);
  MainForm.Caption := '���� ������ - ' + fileNameExt;

  table.Enabled := true;
  clearTableFind;
end;



procedure TMainForm.tableGetEditText(Sender: TObject; ACol, ARow: Integer;
  var Value: string);
var ind : integer;
begin
  ind := currentCategories.IndexOf(Value);
  if (ind <> -1) then
  begin
    currentCategories.Delete(ind);
    categoryListFind.Items := currentCategories;
    categoryListAvgPrice.Items := currentCategories;
  end;
end;



procedure TMainForm.tableSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if not isChanged then
  begin
    isChanged := true;
    FileSave.Enabled := true;
    MainForm.Caption := MainForm.Caption + '*';
  end;
  if (table.Row > currentRoomsNum) then currentRoomsNum := table.Row;
end;



procedure TMainForm.tableExit(Sender: TObject);
begin
  if (table.Col = 1) then
  if (table.Cells[table.Col, table.Row] <> '') then
  begin
    currentCategories.Add(table.Cells[table.Col, table.Row]);
    categoryListFind.Items := currentCategories;
    categoryListAvgPrice.Items := currentCategories;
  end;
end;



procedure TMainForm.FileSaveExecute(Sender: TObject);
begin
  SaveTableInFile;


  isChanged := false;
  FileSave.Enabled := false;

  MainForm.Caption := '���� ������ - ' + fileNameExt;
end;



procedure TMainForm.FileSaveAsBeforeExecute(Sender: TObject);
begin
  FileSaveAs.Dialog.FileName := fileNameExt;
  FileSaveAs.Dialog.Filter := '���� .dat|*.dat|��������� ����|*.txt|��� �����|*.*';
end;



procedure TMainForm.FileSaveAsAccept(Sender: TObject);
var outputFile : file of room; i : integer; buf : room;
begin
  AssignFile(outputFile, FileSaveAs.Dialog.FileName);

  rewrite(outputFile);

  for i := 1 to currentRoomsNum do
  begin
    buf.number := table.Cells[0, i];
    buf.category := table.Cells[1, i];
    buf.bedCount := table.Cells[2, i];
    buf.price := table.Cells[3, i];

    write(outputFile, buf);
  end;
end;

end.
