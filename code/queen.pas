Const   Fi='Queen.inp';
        Fo='Queen.out';
        DX:array [1..8] of integer=(0,-1,-1,-1,0,1,1,1);
        DY:array [1..8] of integer=(-1,-1,0,1,1,1,0,-1);
        maxN=1000;
Var     N,m:longint;
        Map:array [0..MaxN,0..MaxN] of byte;
        A:array [0..MaxN,0..MaxN,1..8] of longint;
        Res:array [0..MaxN,0..MaxN] of longint;
Procedure Nhap;
var     I,J:longint;
        Ch:char;
        Begin
                Assign(Input,Fi);reset(input);
                Readln(N,M);
                For i:=1 to n do
                        Begin
                                For j:=1 to m do
                                        Begin
                                         Read(ch);
                                                if ch='.' then
                                                        mAp[i,j]:=1
                                                Else mAp[i,j]:=0;
                                         End;
                                Readln;
                        End;
                Close(input);
        End;
Procedure Xet;
Var     I,J,K:longint;
        Begin
                Fillchar(a,sizeof(a),0);
                fillchar(res,sizeof(res),0);
                For i:=1 to n do
                        For j:=1 to m do
                                if map[i,j]<>0 then
                                        For k:=1 to 4 do
                                                Begin
                                                        A[i,j,k]:=A[i+Dx[k],j+dy[k],K]+1;
                                                End
                                        Else
                                                For K:=1 to 4 do
                                                        a[i,j,k]:=0;
                 For i:=n downto 1 do
                        For j:=m downto 1 do
                                if map[i,j]<>0 then
                                        For k:=5 to 8do
                                                Begin
                                                        A[i,j,k]:=A[i+Dx[k],j+dy[k],K]+1;
                                                End
                                        Else
                                                For K:=5 to 8 do
                                                        A[i,j,k]:=0;

                For i:=1 to n do
                        For j:=1 to m do
                                Begin
                                        Res[i,j]:=0;
                                        For k:=1 to 8 do
                                                inc(res[i,j],a[i,j,k]);
                                End;

        End;
procedure Xuat;
var     I,J:longint;
        Begin
                ASsign(Output,Fo);rewrite(output);
                For i:=1 to n do
                        Begin
                        For j:=1 to m do
                                if map[i,j]=0 then
                                        Write(0,#32)
                                Else
                                        Write(Res[i,j]-7,#32);
                        WRiteln;
                        End;
                Close(Output);
        End;
BEGIN
        Nhap;
        Xet;
        Xuat;
END.