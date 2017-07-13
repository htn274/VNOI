const   fi='PS.inp';
        fo='PS.out';
        maxn=trunc(1e5)*5;
var     a,t,csmin:array[0..maxn] of longint;
        n,res1,res2,p,MAX:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi);
                        reset(input);
                        readln(n,p);
                        t[0]:=0;
                        for i:= 1 to n do
                        begin
                                readln(a[i]);
                                t[i]:=t[i-1]+a[i];
                        end;
                        close(input);
                end;

        procedure xuli;
        var     i,j,min,jd:longint;
                begin
                        max:=-1;
                        csmin[0]:=0; min:=high(longint);
                        for i:= 1 to n do
                                if t[i]<min then
                                        begin
                                                min:=t[i];
                                                csmin[i]:=i;
                                        end else csmin[i]:=csmin[i-1];
                        jd:=n;
                        for i:= n-1 downto 0 do
                                if csmin[i]=i then
                                        begin
                                        for j:= jd downto i+1 do
                                                if t[j]-t[i]>=p then
                                                        begin
                                                                if max<j-i then
                                                                begin
                                                                        max:=j-i;
                                                                        res1:=i+1;
                                                                        res2:=j;
                                                                end;
                                                                break;
                                                        end else
                                                        if max>j-i then
                                                        begin
                                                        jd:=j;
                                                        break;
                                                        end;
                                        end;

                end;
begin
        docfile;
        xuli;
        assign(output,fo);
        rewrite(output);
        writeln(max);
        //writeln(res1,' ',res2);
        close(output);
end.
