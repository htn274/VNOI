const   fi='region.inp';
        fo='region.out';
        maxn=trunc(1e5)+1;
var     reg,sc,med,d,sum:array[1..maxn] of longint;
        free:array[1..maxn] of boolean;
        m,n,r,one,dem:longint;
        procedure docfile;
        var     i,id:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m,r);
                        fillchar(free,sizeof(free),false);
                        one:=0;
                        fillchar(d,sizeof(d),0);
                        for i:= 1 to n do
                                begin
                                        readln(id,reg[i],sc[i],med[i]);
                                        inc(d[reg[i]]);
                                        if med[i]=1 then
                                        begin
                                        inc(one);
                                        dec(d[reg[i]]);
                                        free[reg[i]]:=true;
                                        end;
                                end;
                        dec(m,one);
                        close(input);
                end;

        procedure swap(var x,y:longint);
        var z:longint;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var     i,j,x:longint;
                begin
                        i:=l;
                        j:=r;
                        x:=sc[i+random(j-i)];
                        repeat
                                while x>sc[i] do inc(i);
                                while x<sc[j] do dec(j);
                                if i<=j then
                                        begin
                                                swap(sc[i],sc[j]);
                                                swap(reg[i],reg[j]);
                                                swap(med[i],med[j]);
                                                inc(i);
                                                dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        function sl(vt,diem:longint):longint;
                begin
                        sl:=n-vt+1+dem-sum[vt];

                end;

        procedure xuli;
        var     i:longint;
                begin
                        for i:=n downto 1 do sum[i]:=sum[i+1]+med[i];
                        dem:=0;
                        for i:= 1 to n do
                                begin
                                if sl(i,sc[i])=m then
                                        begin
                                                writeln(sc[i]);
                                                exit;
                                        end else
                                begin
                                if (not free[reg[i]]) and (d[reg[i]]>0) then dec(d[reg[i]]);
                                if (not free[reg[i]]) and (d[reg[i]]=0) then inc(dem);
                                if sl(i+1,sc[i]+1)=m then
                                        begin
                                                writeln(sc[i]+1);
                                                exit;
                                        end;
                                end;
                                end;
                end;

begin
        docfile;
        sort(1,n);
        assign(output,fo); rewrite(output);
        xuli;
        close(output);
end.
