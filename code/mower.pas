const   fi='mower.inp';
        fo='mower.out';
        max=40;
var     a:array[0..max+1,0..max+1] of char;
        dd:array[0..max+1,0..max+1] of boolean;
        hx:array[1..8] of longint=(-1,-1,-1,0,0,1,1,1);
        hy:array[1..8] of longint=(-1,0,1,-1,1,-1,0,1);
        hi:array[1..4] of longint=(0,0,-3,3);
        hj:array[1..4] of longint=(-3,3,0,0);
        d,r,vti,vtj:longint;
        procedure docfile;
        var     i,j:longint;c:char;
                begin
                        assign(input,fi); reset(input);
                        readln(d,r);
                        fillchar(dd,sizeof(dd),true);
                        for i:=0 to r+1 do
                                begin
                                        a[0,i]:='+';
                                        a[d+1,i]:='+';
                                end;
                        for i:=0 to d+1 do
                                begin
                                        a[i,0]:='+';
                                        a[i,r+1]:='+';
                                end;
                        for i:= 1 to d do
                        begin
                                for j:= 1 to r do
                                begin
                                        read(a[i,j],c);
                                        if a[i,j]='M' then
                                                begin
                                                        vti:=i;
                                                        vtj:=j;
                                                end;
                                end;
                                readln;
                        end;
                        close(input);
                end;

        function check(x,y:longint):boolean;
        var k,x1,y1:longint;
                begin
                      for k:= 1 to 8 do
                                begin
                                        x1:=x+hx[k];
                                        y1:=y+hy[k];
                                        if (x1>=0) and (y1>=0) then
                                        if a[x1,y1]='+' then exit(false);
                                end;
                      exit(true);
                end;

        procedure loang(x,y:longint);
        var     k,x1,y1:longint;
                begin
                        dd[x,y]:=false;
                        if ((x<0) or (x>d)) and ((y<0) and (y>r)) then exit;
                        a[x,y]:='O';
                        for k:= 1 to 8 do
                                begin
                                        x1:=x+hx[k];
                                        y1:=y+hy[k];
                                        a[x1,y1]:='O';
                                end;
                        for k:= 1 to 8 do
                                if (check(x+hx[k],y+hy[k])) and (dd[x+hx[k],y+hy[k]]) then
                                begin
                                        loang(x+hx[k],y+hy[k]);
                                end;
                end;

        procedure xuat;
        var     i,j:longint;
                begin
                        writeln(d,' ',r);
                        for i:= 1 to d do
                                begin
                                        for j:= 1 to r do write(a[i,j],' ');
                                        writeln;
                                end;
                end;

begin
        docfile;
        loang(vti,vtj);
        assign(output,fo); rewrite(output);
        xuat;
        close(output);
end.
