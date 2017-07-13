const   fi='barica.inp';
        fo='barica.out';
var
        procedure docfile;
        var
                begin
                        assign(input,fi); reset(input);
                        readln(n,k);
                        for i:= 1 to n do
                                begin
                                        readln(a[i].x,a[i].y,a[i].m);
                                        a[i].id:=i;
                                end;
                        close(input);
                end;

        function ss(i,j:beo):boolean;
        begin
                if a[i].x<>a[j].x the
                        begin
                                if a[i].x<a[j].x then exit(true) else exit(false);
                        end else
                        begin
                                if a[i].y<a[j].y then exit(true) else exit(false);
                        end;
        end;

        procedure sort(l,r:longint);
        var
                begin
