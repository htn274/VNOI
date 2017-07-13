const   fi='KITE.inp';
        fo='KITE.out';
var     i,n,x,j,sl:longint;
        a:array[1..trunc(1e5)] of longint;
        begin
                assign(input,fi); reset(input);
                assign(output,fo); rewrite(output);
                readln(n);
                readln(x);
                writeln(1);
                a[1]:=x;
                sl:=1;
                for i:=2 to n do
                        begin
                                readln(x);
                              j:=sl;
                              while (x>a[j]) and (j>=1) do dec(j);
                              inc(j);
                              a[j]:=x;
                              writeln(j);
                              if j>sl then sl:=j;
                        end;
                close(input);close(output);
        end.

