const   fi='vpoint.inp';
        fo='vpoint.out';
type    point=record
        x,y:longint;
        end;
        line=record
        x1,y1,x2,y2:longint;
        end;
var     a:array[1..2000] of point;
        dt:array[1..1000] of line;
        chon:array[1..1000] of boolean;
        n,dem:longint;

        procedure swapt(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to 2*n do
                                begin
                                        read(a[i].x,a[i].y);
                                        if i mod 2=0 then
                                                begin
                                                        dt[i div 2].x1:=a[i-1].x;
                                                        dt[i div 2].x2:=a[i].x;
                                                        dt[i div 2].y1:=a[i-1].y;
                                                        dt[i div 2].y2:=a[i].y;
                                                        if dt[i div 2].y1*dt[i div 2].x2>dt[i div 2].y2*dt[i div 2].x1 then
                                                                begin
                                                                        swapt(dt[i div 2].x1,dt[i div 2].x2);
                                                                        swapt(dt[i div 2].y1,dt[i div 2].y2);
                                                                end;
                                                        readln;
                                                end;
                                end;
                        close(input);
                end;

        procedure swap(var a,b:point);
        var c:point;
                begin
                        c:=a; a:=b; b:=c;
                end;

        procedure sort(l,r:longint);
        var i,j,mid:longint;
                begin
                        i:=l;
                        j:=r;
                        mid:=i+random(j-i);
                        repeat
                                while a[i].x*a[mid].y>a[i].y*a[mid].x do inc(i);
                                while a[j].x*a[mid].y<a[j].y*a[mid].x do dec(j);
                                if i<=j then
                                        begin
                                                swap(a[i],a[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        procedure thuchien;
        var     i,j,min,luu:longint;
                begin
                        dem:=0;
                        for i:= 1 to 2*n-1 do
                        begin
                                min:=50000;
                                luu:=0;
                                for j:= 1 to n do
                                        if (a[i].y*dt[j].x1>=a[i].x*dt[j].y1) and (a[i+1].y*dt[j].x2<=a[i+1].x*dt[j].y2) then
                                        if dt[j].x1+dt[j].y1<min then
                                                begin
                                                        min:=dt[j].x1+dt[j].y1;
                                                        luu:=j;
                                                end;
                                        if luu<>0 then
                                if not chon[luu] then chon[luu]:=true;
                        end;
                        for i:= 1 to n do
                                if chon[i] then inc(dem);
                end;
begin
        docfile;
        sort(1,2*n);
        thuchien;
        assign(output,fo); rewrite(output);
        writeln(dem);
        close(output);
end.
