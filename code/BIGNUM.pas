uses math;
const   fi='';
        fo='';
        maxn=2001;
        base=trunc(1e9);
type giatri= array[0..maxn]of longint;
     bignum = record
         gt: giatri;
         dau: boolean;
         sl: longint;
     end;
var a,b:bignum;
procedure getnum(var tmp:ansistring; var a:bignum);
    var i,loi:longint;
    begin
        a.dau:=FALSE;
        i:=length(tmp);
        a.sl:=0;
        fillchar(a.gt,sizeof(a.gt),0);
        while i>=9 do begin
            inc(a.sl);
            val(copy(tmp,i-9+1,9),a.gt[a.sl],loi);
            delete(tmp,i-9+1,9);
            i:=length(tmp);
        end;
        if i>0 then begin
            inc(a.sl);
            val(tmp,a.gt[a.sl],loi);
        end;
    end;
procedure nhap;
    var tmp:ansistring;
    begin
        assign(input,fi);reset(input);
        readln(tmp);
        getnum(tmp,a);
        readln(tmp);
        getnum(tmp,b);
        close(input);
    end;
procedure printBignum(a:bignum);
    var i:longint;
        s:string[9];
    begin
        if a.dau and ((a.sl>1)or ((a.sl=1)and(a.gt[1]<>0))) then write('-');
        write(a.gt[a.sl]);
        for i:=a.sl-1 downto 1 do begin
            str(a.gt[i],s);
            while length(s)<9 do s:='0'+s;
            write(s);
        end;
    end;
function sosanh(a,b:bignum):integer;
    begin
        if a.sl > b.sl then exit(1);
        if b.sl > a.sl then exit(-1);
        if a.gt[a.sl]=b.gt[b.sl] then exit(0);
        if a.gt[a.sl]>b.gt[b.sl] then exit(1);
        exit(-1);
    end;
function cong(a,b:bignum):bignum;
    var i:longint;
        nho,tmp:longint;
        kq:bignum;
    begin
        i:=1;
        nho:=0;
        kq.dau:=false;
        kq.sl:=0;
        fillchar(kq.gt,sizeof(kq.gt),0);
        while i<=max(a.sl,b.sl) do begin
             tmp:= a.gt[i]+b.gt[i]+nho;
             nho:=tmp div base;
             inc(kq.sl);
             kq.gt[kq.sl]:=tmp mod base;
             inc(i);
        end;
        exit(kq);
    end;
function tru(a,b:bignum;dau:boolean):bignum;
    var i:longint;
        muon,tmp:longint;
        kq:bignum;
    begin
        if sosanh(a,b)<0 then exit(tru(b,a,true));
        if sosanh(a,b)=0 then begin
            kq.sl:=1;
            kq.gt[1]:=0;
            exit(kq);
        end;
        kq.sl:=0;
        kq.dau:=dau;
        fillchar(kq.gt,sizeof(kq.gt),0);
        muon:=0;
        for i:=1 to max(a.sl,b.sl) do begin
            tmp:=a.gt[i]-b.gt[i]-muon;
            if tmp<0 then begin
                muon:=1;
                tmp:=tmp+base;
            end else muon:=0;
            inc(kq.sl);
            kq.gt[kq.sl]:=tmp;
        end;
        while (kq.gt[kq.sl]=0)and (kq.sl>1) do dec(kq.sl);
        exit(kq);
    end;
function nhan(a,b:bignum):bignum;
    var i,j:longint;
        kq,tmp:bignum;
        tmp1:int64;
        nho:longint;
    begin
        kq.sl:=1;
        kq.dau:=false;
        fillchar(kq.gt,sizeof(kq.gt),0);
        for i:=1 to a.sl do begin
            tmp.sl:=i-1;
            tmp.dau:=false;
            fillchar(tmp.gt,sizeof(tmp.gt),0);
            nho:=0;
            for j:=1 to b.sl do begin
                tmp1:=a.gt[i];
                tmp1:=tmp1*b.gt[j];
                tmp1:=tmp1+nho;
                nho:=tmp1 div base;
                inc(tmp.sl);
                tmp.gt[tmp.sl]:=tmp1 mod base;
            end;
            while nho>0 do begin
                inc(tmp.sl);
                tmp.gt[tmp.sl]:=nho;
				nho:=nho div base;
            end;
            while (tmp.sl>1) and (tmp.gt[tmp.sl]=0) do dec(tmp.sl);
            kq:=cong(kq,tmp);
        end;
        while (kq.sl>1) and (kq.gt[kq.sl]=0) do dec(kq.sl);
        exit(kq);
    end;
procedure xuat;

    var c:bignum;
    begin
        assign(output,fo);rewrite(output);
        c:=cong(a,b);
        printBignum(c); writeln;
        c:=tru(a,b,false);
        printBignum(c);writeln;
        c:=nhan(a,b);
        printBigNum(c);
        close(output);
    end;
begin
    nhap;
    xuat;
end.