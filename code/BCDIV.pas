const   fi      ='BCDIV.inp';
        fo      ='BCDIV.out';
        maxn    =25;
        maxk    =25;
var     f       :array[0..maxn,0..maxk] of int64;
        nTest,n,k:longint;

procedure Dp;
var     i,j:longint;
begin
        //F[i,j] la so cach chia i so thanh j nhom
        f[0,0]:=1;
        for i:= 1 to maxn do
                for j:= 1 to maxk do
                        f[i,j]:=f[i-1,j-1]+f[i-1,j]*j;
end;

BEGIN
assign(input,fi); reset(input);
Dp;
readln(nTest);
while nTest>0 do
begin
        readln(n,k);
        writeln(f[n,k]);
        dec(nTest);
end;
close(input);
END.
