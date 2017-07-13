uses math;
const   fi='fibistr.inp';
        fo='fibistr.out';
var     t:array[0..201] of int64;
        dau,cuoi:array[0..201] of ansistring;
        z:array[1..trunc(1e6)*8] of longint;
        s,x,y,tam:ansistring;
        k:int64;
        resn:longint;
        function hamz(x,y:ansistring):int64;
        var     a:ansistring;
                l,r,n,i,m:longint;
                dem:int64;
                begin
                        {fillchar(z,sizeof(z),0);
                        a:=x+'@'+y;
                        l:=1; r:=1;
                        n:=length(a);
                        m:=length(x);
                        dem:=0;
                        for i:=2 to n do
                                begin
                                        if i<=r then
                                                z[i]:=min(r-i+1,z[i-l+1]);
                                        while (i+z[i]<=n) and (a[1+z[i]]=a[i+z[i]]) and (z[i]<=n) do
                                        begin
                                                inc(z[i]);
                                                if z[i]>n then break;
                                        end;
                                        if i+z[i]-1>r then
                                                begin
                                                        l:=1;
                                                        r:=i+z[i]-1;
                                                end;
                                end;
                        for i:= m+1 to n do
                                if z[i]=m then inc(dem); }
                           fillchar(z,sizeof(z),0);
                           dem:=0;
                           a:=x+'@'+y;
                           l:=0; r:=0;
                           for i:=2 to length(a) do
                                begin
                                        if i>r then
                                         begin
                                          l:=i; r:=i;
                                          while (r<=length(a)) and (a[r]=a[r-l+1]) do inc(r);
                                          dec(r);
                                          z[i]:=r-l+1;
                                         end
                                                else
                                         begin
                                                if r-i+1>z[i-l+1] then z[i]:=z[i-l+1]
                                                else
                                                 begin
                                                 l:=i;
                                                 while (r<=length(a)) and (a[r]=a[r-l+1]) do inc(r);
                                                 dec(r);
                                                 z[i]:=r-l+1;
                                                 end;
                                         end;
                                if z[i]=length(x) then inc(dem);
                           end;
                        exit(dem);
                end;

        procedure khoitao;
        var     i:longint;
                begin
                        t[1]:=hamz(s,x);
                        t[2]:=hamz(s,y);
                        dau[1]:=copy(x,1,length(s)-1);
                        dau[2]:=copy(y,1,length(s)-1);
                        cuoi[1]:=copy(x,length(x)-length(s)+2,length(s)-1);
                        cuoi[2]:=copy(y,length(y)-length(s)+2,length(s)-1);
                        i:=3;
                        tam:=y+x;
                        repeat
                                        dau[i]:=copy(tam,1,length(s)-1);
                                        cuoi[i]:=copy(tam,length(tam)-length(s)+2,length(s)-1);
                                        t[i]:=t[i-1]+t[i-2]+hamz(s,cuoi[i-1]+dau[i-2]);
                                        x:=y;
                                        y:=tam;
                                        tam:=y+x;
                                        inc(i);
                        until (length(tam)>2*length(s)) or (i>200);
                        resn:=i;
                end;

        procedure thuchien;
        var     i:longint;
                begin
                        if t[resn-1]>=k then
                                begin
                                        for i:= 1 to resn-1 do
                                                if t[i]>=k then
                                                        begin
                                                                resn:=i;
                                                                exit;
                                                        end;
                                end;
                        i:=resn;
                        while (t[i-1]<k) and (i<=200) do
                                begin
                                        dau[i]:=dau[i-1];
                                        cuoi[i]:=cuoi[i-2];
                                        t[i]:=t[i-1]+t[i-2]+hamz(s,cuoi[i-1]+dau[i-2]);
                                        inc(i);
                                end;
                        if t[i-1]=0 then resn:=0 else resn:=i-1;
        end;

begin
        assign(input,fi); reset(input);
        readln(x);
        readln(y);
        readln(s);
        readln(k);
        close(input);
        assign(output,fo);
        rewrite(output);
        fillchar(t,sizeof(t),0);
        khoitao;
        thuchien;
        writeln(resn);
        close(output);
end.









