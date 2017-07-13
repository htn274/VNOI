const   fi='seqsum.inp';
        fo='seqsum.out';
        maxn=trunc(1e5);
var     a:array[0..maxn] of longint;
        s:array[0..maxn] of int64;
        n,m:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,m);
                        s[0]:=0;
                        for i:=1 to n do
                                begin
                                        read(a[i]);
                                        s[i]:=s[i-1]+a[i];
                                end;
                        close(input);
                end;

        procedure swap(var x,y:int64);
        var z:int64;
                begin
                        z:=x; x:=y; y:=z;
                end;

        procedure sort(l,r:longint);
        var i,j,tam:longint; x:int64;
                begin
                        i:=l;
                        j:=r;
                        x:=s[i+random(j-i)];
                        repeat
                                while x>s[i] do inc(i);
                                while x<s[j] do dec(j);
                                if i<=j then
                                        begin
                                                swap(s[i],s[j]);
                                                inc(i);
                                                Dec(j);
                                        end;
                        until i>j;
                        if i<r then sort(i,r);
                        if l<j then sort(l,j);
                end;

        function BST(x:int64):longint;
        var i,j,mid:longint;
                begin
                        i:=0; j:=n;
                        while i<=j do
                                begin
                                        mid:=(i+j) div 2;
                                        if x=s[mid] then exit(mid);
                                        if x=s[i] then exit(i);
                                        if x=s[j] then exit(j);
                                        if x<s[mid] then
                                                j:=mid-1
                                        else i:=mid+1;
                                end;
                        exit(-1);
                end;

        procedure thuchien;
        var     i,J,min:longint;
                begin
                        sort(0,n);
                        min:=-1;
                        for i:= n downto 0 do
                                begin
                                        //k:=s[i]-m;
                                        {if k>=0 then
                                                begin }
                                                        j:=BST(s[i]-m);
                                                        if j<>-1 then
                                                        if (i-j<min) or (min=-1) then
                                                                min:=i-j;
                                               // end;
                                end;
                        assign(output,fo); rewrite(output);
                        //if min=-1 then write(-1) else
                        writeln(min);
                        closE(output);
                end;

begin
        docfile;
        thuchien;
end.

