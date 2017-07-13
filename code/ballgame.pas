const   fi='ballgame.inp';
        fo='ballgame.out';
        maxn=2*1000;
type    ball=record
        x,y:longint;
end;
var     a:array[1..maxn] of ball;
        xanh,doo,xnew,ynew,color:array[1..maxn] of longint;
        ts:array[1..maxn] of extended;
        red,green,n,dem:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n);
                        for i:= 1 to 2*n do
                                with a[i] do
                                        readln(x,y);

                        close(input);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure swapex(var x,y:extended);
        var z:extended;
                begin
                        z:=x; x:=y; y:=z;
                end;

        function chia(a,b:longint):extended;
        begin
                if (a=0) then exit(0);
                if (b=0) then exit(1.0e+14);
                exit(a/b);
        end;

        procedure print(i:longint);
                begin
                        assign(output,fo); rewrite(output);
                        write(i,' ');
                        if red>=2 then
                                write(doo[1],' ',doo[2]) else
                                write(xanh[1],' ',doo[1]);
                        close(output);
                end;

        procedure sort(l,r:longint);
        var i,j:longint; x:extended;
        begin
                i:=l; j:=r;
                x:=ts[i+random(j-i)];
                repeat
                        while x>ts[i] do inc(i);
                        while x<ts[j] do dec(j);
                        if i<=j then
                                begin
                                        swapex(ts[i],ts[j]);
                                        swap(xnew[i],xnew[j]);
                                        swap(ynew[i],ynew[j]);
                                        swap(color[i],color[j]);
                                        inc(i);
                                        dec(j);
                                end;
                until i>j;
                if i<r then sort(i,r);
                if l<j then sort(l,j);
        end;

        procedure thuchien;
        var     i,j:longint;
                begin
                        for i:= 1 to n do
                        begin
                                dem:=0;
                                for j:=i+1 to 2*n do
                                        begin
                                                inc(dem);
                                                xnew[dem]:=a[j].x-a[i].x;
                                                ynew[dem]:=a[j].y-a[i].y;
                                                ts[dem]:=chia(xnew[dem],ynew[dem]);
                                                color[dem]:=j;
                                        end;
                                sort(1,dem);
                                j:=1;
                                while j<=dem do
                                begin
                                 green:=0;
                                red:=0;
                                if color[j]>n then
                                        begin
                                                inc(red);
                                                doo[red]:=color[j];
                                        end else
                                        begin
                                                inc(green);
                                                xanh[green]:=color[j];
                                        end;
                                while (ts[j]=ts[j+1]) and (j<dem) do
                                        begin
                                                if color[j+1]>n then
                                                begin
                                                        inc(red);
                                                        doo[red]:=color[j+1];
                                                end else
                                                begin
                                                        inc(green);
                                                        xanh[green]:=color[j+1];
                                                end;
                                                if ((green>=1) and (red>=1)) or (red>=2) then
                                                        begin
                                                                print(i);
                                                                exit;
                                                        end;
                                                inc(j);
                                        end;
                                inc(j);
                                end;
                        end;
                        assign(output,fo); rewrite(output);
                        writeln(-1);
                        close(output);
                end;

begin
        docfile;
        thuchien;
end.








