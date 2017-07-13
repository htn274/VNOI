uses math;
const   fi='swindow.inp';
        fo='swindow.out';
        maxn=trunc(1e6);
        c='@';
var     n,m,l,k:longint;
        t,p,x:ansistring;
        z:array[1..2*maxn+1] of longint;
        luu:array[0..maxn] of longint;
        procedure docfile;
                begin
                        assign(input,fi); reset(input);
                        readln(t);
                        readln(p);
                        readln(k);
                        n:=length(t);
                        m:=length(p);
                        x:=p+c+t;
                        close(input);
                end;

        procedure hamz;
        var     i,front,rear:longint;
                begin
                        l:=m+n+1;
                        front:=1;
                        rear:=1;
                        fillchar(z,sizeof(z),0);
                        for i:=2 to l do
                                begin
                                        if i<=rear then
                                                z[i]:=min(rear-i+1,z[i-front+1]);
                                        while (i+z[i]<=l) and (x[i+z[i]]=x[1+z[i]]) do inc(z[i]);
                                        if i+z[i]-1>rear then
                                                begin
                                                        front:=i;
                                                        rear:=i+z[i]-1;
                                                end;
                                end;
                end;

        function kq:int64;
        var     i,j:longint;
                dem:int64;
                begin
                        dem:=0;
                        luu[0]:=0;
                        for i:= 1 to n do
                                if z[i+m+1]=m then luu[i]:=luu[i-1]+1 else luu[i]:=luu[i-1];
                       for i:= 1 to n-k+1 do
                       if (luu[i+k-m+1]-luu[i-1]>=1) then
                        inc(dem);
                       exit(dem);
                end;


begin
        docfile;
        assign(output,fo); rewrite(output);
        if (k<m) then writeln(0) else
        begin
        hamz;
        writeln(kq);
        end;
        close(output);
end.
