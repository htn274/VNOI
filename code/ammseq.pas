uses math;
const   fi='amsseq.inp';
        fo='amsseq.out';
        limit=-trunc(1e8);
var     a,t:array[0..10000] of int64;
        s,i,j,n,k:longint;
        m:int64;
        begin
                assign(input,fi); reset(input);
                assign(output,fo); rewrite(output);
                readln(n,k);
                for i:= 1 to n do read(a[i]);
                a[0]:=0;
                t[0]:=0;
                t[1]:=a[1];
                for i:= 2 to n do
                        begin
                                m:=limit;
                                if i-k>=0 then
                                        s:=i-k else s:=0;
                                for j:= s to i-1 do
                                        m:=max(m,t[j]);
                                t[i]:=m+a[i];
                        end;
                m:=0;
                for i:= 1 to n do if t[i]>m then m:=t[i];
                writeln(m);
                close(input);
                close(output);
        end.
