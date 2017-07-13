uses math;
const   fi              ='BLAND.inp';
        fo              ='BLAND.out';
        maxn            =300;
        oo              =trunc(1e9);
var     a,b             :array[1..maxn,1..maxn] of longint;
        m,n,H,res       :longint;
        queueMax,queueMin:array[1..maxn] of longint;
        maxCot,MinCot   :array[1..maxn] of longint;
        f               :array[1..maxn,1..maxn] of longint;
        maxFT,maxFB     :array[1..maxn] of longint;

Procedure Enter;
var     i,j:longint;
begin
        assign(input,fi); reset(input);
        readln(m,n,h);
        for i:= 1 to m do
                begin
                        for j:= 1 to n do read(a[i,j]);
                        readln;
                end;
        close(input);
end;

Procedure Update(top,bot:longint);
var     frontMax,rearMax,frontMin,rearMin,i,j,S:longint;
begin
        frontMax:=1; rearMax:=0;
        frontMin:=1; rearMin:=0;
        F[top,bot]:=0;
        j:=1;
        for i:= 1 to n do
        begin
                maxCot[i]:=max(maxCot[i],a[bot,i]);
                minCot[i]:=min(minCot[i],A[bot,i]);
                while (frontMax<=rearMax) and (MaxCot[QueueMax[rearMax]]<=MaxCot[i]) do dec(rearMax);
                while (frontMin<=rearMin) and (MinCot[QueueMin[rearMin]]>=Mincot[i]) do dec(rearMin);
                inc(rearMax); QueueMax[rearMax]:=i;
                inc(rearMin); QueueMin[rearMin]:=i;
                while (j<=i) and (MaxCot[QueueMax[frontMax]]-MinCot[QueueMin[frontMin]]>H) do
                begin
                        inc(j);
                        while (frontMax<=rearMax) and (QueueMax[frontMax]<j) do inc(frontMax);
                        while (frontMin<=rearMin) and (QueueMin[frontMin]<j) do inc(frontMin);
                end;
                S:=(bot-top+1)*(i-j+1);
                F[top,bot]:=max(F[top,bot],S);
                maxFT[bot]:=max(maxFT[bot],F[top,bot]);
                maxFB[top]:=max(maxFB[top],F[top,bot]);
        end;
end;

Procedure Process;
var     i,j,k:longint;
begin
        for i:= 1 to m do
                begin
                        maxFT[i]:=-oo;
                        maxFB[i]:=-oo;
                end;

        for i:= 1 to m do
        begin
                for j:= 1 to n do
                begin
                        maxCot[j]:=-oo;
                        minCot[j]:=oo;
                end;
                for j:=i to m do
                begin
                        Update(i,j);
                        for k:= 2 to m do
                        begin
                                res:=max(res,maxFT[k-1]+maxFB[k]);
                                maxFT[k]:=max(maxFT[k],maxFT[k-1]);
                        end;
                end;
        end;
end;

Procedure Main;
var     i,j,tmp:longint;
begin
        res:=0;
        Process;
        for i:=1  to m do
                for j:= 1 to n do
                        B[i,j]:=A[i,j];
        tmp:=m; m:=n; n:=tmp;
        fillchar(a,sizeof(a),0);
        for i:= 1 to m do
                for j:= 1 to n do
                        A[i,j]:=B[j,i];
        Process;

        writeln(res);
end;

BEGIN
        Enter;
        assign(output,fo); rewrite(output);
        Main;
        close(output);
END.