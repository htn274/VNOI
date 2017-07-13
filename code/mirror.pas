const   fi='mirror.inp';
        fo='mirror.out';
        maxn=33;
var     a:array[0..maxn+1,0..maxn+1] of char;
        n,res:longint;
        dd:array[0..maxn+1,0..maxn+1] of boolean;
        b:array[0..maxn+1,0..maxn+1] of longint;
        hx:array[1..4] of longint=(-1,0,0,1);
        hy:array[1..4] of longint=(0,-1,1,0);
        procedure docfile;
        var     i,j:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        fillchar(dd,sizeof(dd),false);
                        fillchar(a,sizeof(a),'#');
                        for i:= 1 to n do
                                begin
                                        for j:= 1 to n do
                                        begin
                                                read(a[i,j]);
                                                if a[i,j]='.' then
                                                dd[i,j]:=true;
                                        end;
                                        readln;
                                end;
                        fillchar(b,sizeof(b),0);
                        b[1,1]:=0;
                        for i:=2 to n+1 do
                                begin
                                        b[i,0]:=1;
                                        b[0,i]:=1;
                                        b[i,n+1]:=1;
                                        b[n+1,i]:=1;
                                end;
                        close(input);
                end;

        function tinh(x,y:longint):longint;
        var i:longint;
                begin
                        tinh:=0;
                        for i:= 1 to 4 do
                        if a[x+hx[i],y+hy[i]]='#' then
                                tinh:=tinh+1;
                end;

        procedure loang(x,y:longint);
        var     i:longint;
                begin
                        if ((x<0) or (x>n)) and ((y<0) or (y>n)) then exit;
                        dd[x,y]:=false;
                        {if (x<>n) and (y<>n) and (x<>1) and (y<>1) then}
                        b[x,y]:=tinh(x,y);
                        res:=res+b[x,y];
                        for i:= 1 to 4 do
                                if (dd[x+hx[i],y+hy[i]]) and (a[x+hx[i],y+hy[i]]='.') then
                                        loang(x+hx[i],y+hy[i]);
                end;

        procedure xuat;
        var i,j:longint;
                begin
                        for i:= 1 to n do
                                begin
                                        for j:=1 to n do write(b[i,j],' ');
                                        writeln;
                                end;
                end;

begin
        docfile;
        loang(1,1);
        res:=res-b[1,1]-b[n,n]+1;
        assign(output,fo); rewrite(output);
        writeln(res*9);
        close(output);
end.