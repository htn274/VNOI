const   fi      ='BARICAVN.INP';
        fo      ='BARICAVN.OUT';
        maxn    =trunc(1e5)*3;

type    sen     =record
        x,y,f:longint;
        end;

var     a       :array[0..maxn] of sen;
        n,k     :longint;
        maxX,maxy:array[0..maxn] of longint;
        dp,order      :array[0..maxn] of longint;

Procedure Docfile;
var     i:longint;
begin
        assign(input,fi); reset(input);
        readln(n,k);
        for i:= 1 to n do
                with a[i] do
                        begin
                        order[i]:=i;
                        read(x,y,f);
                        end;
        close(input);
end;

operator < (a,b:sen) c:boolean;
begin
        if a.x<>b.x then c:=a.x<b.x else
        c:=a.y<b.y;
        exit;
end;

Procedure Swap(var x,y:longint);
var z:longint;
begin
        z:=x; x:=y; y:=z;
end;

Procedure Sort(l,r:longint);
var     i,j,x:longint;
begin
        i:=l;
        j:=r;
        x:=order[i+random(j-i)];
        repeat
                while a[order[i]] < a[x]  do inc(i);
                while a[x] < a[order[j]] do dec(j);
                if i<=j then
                        begin
                                swap(order[i],order[j]);
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<r then sort(i,r);
        if l<j then sort(l,j);
end;

Procedure Xuli;
var i,xx,yy,vt:longint;
begin
        sort(1,n);
        fillchar(maxX,sizeof(maxX),0);
        fillchar(maxY,sizeof(maxY),0);

          dp[0] := -high(longint);
          for i := 1 to n do begin
                vt := order[i];

                dp[vt] := -high(longint);
                if vt = 1 then dp[vt] := a[vt].f;

                xx := maxX[a[vt].x];
                yy := maxY[a[vt].y];

                if (dp[xx] >= k) and (dp[vt] < dp[xx] + a[vt].f - k) then
                dp[vt] := dp[xx] + a[vt].f - k;
      if (dp[yy] >= k) and (dp[vt] < dp[yy] + a[vt].f - k) then
         dp[vt] := dp[yy] + a[vt].f - k;

                if dp[vt] > dp[xx] then maxX[a[vt].x] := vt;
                if dp[vt] > dp[yy] then maxY[a[vt].y] := vt;
   end;

        writeln(dp[n]);
end;

BEGIN
Docfile;
assign(output,fo); rewrite(output);
Xuli;
close(output);
END.
