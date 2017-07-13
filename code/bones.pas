uses math;
var     s1,s2,s3,i,j,k,s,res,m:longint;
        sum:array[1..100] of longint;
        begin
                fillchar(sum,sizeof(sum),0);
                readln(s1,s2,s3);
                for i:= 1 to s1 do
                        for j:= 1 to s2 do
                                for k:=1 to s3 do
                                        begin
                                                s:=i+j+k;
                                                inc(sum[s]);
                                        end;
                m:=0;
                res:=0;
                for i:= 1 to 80 do
                        if sum[i]>m then
                                begin
                                        m:=sum[i];
                                        res:=i;
                                end else
                        if sum[i]=m then res:=min(res,i);
                writeln(res);
        end.