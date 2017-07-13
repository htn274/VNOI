const   fi='square.inp';
        fo='square.out';
type    point=record
        x,y:longint;
end;
var     a:array[1..1001] of point;
        n:longint;
        max:int64;
        procedure swap(var x,y:point);
        var z:point;
                begin
                        z:=x; x:=y; y:=z;
                end;

        function ss(a,b:point):byte;
        begin
                if (a.x=b.x) and (a.y=b.y) then exit(0);
                if a.x>b.x then exit(1) else
                if a.x<b.x then exit(2) else
                if a.y>b.y then exit(1)  else
                exit(2);
        end;

        procedure sort(l,r:longint);
        var i,j:longint;x:point;
                begin
                        i:=l;
                        j:=r;
                        x:=a[i+random(j-i)];
                        repeat
                                while ss(x,a[i])=1 do inc(i);
                                while ss(a[j],x)=1 do dec(j);
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

        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to n do
                                readln(a[i].x,a[i].y);
                        close(input);
                end;

        function BST(x,y:longint):longint;
        var     i,j,mid:longint;
                t:point;
                begin
                        i:=1;
                        j:=n;
                        t.x:=x;
                        t.y:=y;
                        while i<=j do
                                begin
                                        mid:=(i+j) div 2;
                                        if ss(a[mid],t)=0 then exit(mid);
                                        if ss(a[mid],t)=1 then j:=mid-1 else i:=mid+1;
                                end;
                        exit(-1);
                end;


        procedure xuli;
        var     i,j,vx,vy,k,h:longint;
                dt:int64;
                begin
                        max:=0;
                        for i:= 1 to n-1 do
                                for j:= i+1 to n do
                                if a[i].y>=a[j].y then
                                        begin
                                                vx:=abs(a[j].x-a[i].x);
                                                vy:=abs(a[i].y-a[j].y);
                                                k:=BST(a[i].x+vy,a[i].y+vx);
                                                h:=BST(a[j].x+vy,a[j].y+vx);
                                                if (k<>-1) and (h<>-1) and (k<>i) and (k<>j) and (h<>i) and (h<>j) then
                                                        begin
                                                                dt:=sqr(abs(a[i].x-a[j].x))+sqr(abs(a[i].y-a[j].y));
                                                                if dt>max then
                                                                        max:=dt;
                                                        end;
                                        end;
                end;

begin
        docfile;
        sort(1,n);
        xuli;
        assign(output,fo); rewrite(output);
        writeln(max);
        close(output);
end.
