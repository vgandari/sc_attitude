function [out1,out2]=spisen(arg1,arg2,arg3);
%             [out1,out2]=spisen(arg1,arg2,arg3);
%SPISEN usages :1)  out1=spisen(gam,flg,value)
%               2)  nu=spisen(gam,M)
%               3) [nu,M]=spisen(gam,flg,pin);
%               4) spisen(gam,flg,value)  : same as 1) but pretty print answer (scalar value only)
%  this does simple wave (Prandtl-Meyer) supersonic flow
%^^^^^^^^^^^^^^^^^^^^^^^^
% definitions:
%
% gam = ratio of specific heats
% pick input type with one of the following flgs
% flg
%  'm' :  mach no. 
%          range: 1<m<inf
%  'p' :  p/p* = press./sonic press
%          range: 1>p>0
%  'V':   V/a* = flow speed/sonic speed of snd
%          range: 1<V<Vmax
%  'L':   L/L* = length of Mach line/ length at M=1
%          range: 1<L<inf
%  'pmf': Prandtl Meyer func (rad) = th* - th
%          range: 0<nu< numax 
%          numax = pi/2*(sqrt((gam+1)/(gam-1)-1)
%  'thw': Mach wave angle given (rad)= thw-th* = mu-nu
%          range: pi/2>thw>-numax
%  'h':   print this table
%
% output: same quantities
%       out1=[M,p/p*,V/a*,L/L*,nu,thw]
%       or out1=nu,out2=M if nargout=2  (flg='m' or 'pmf')
%       or out1=nu is nargin=2 (gam & M)
%
%NOTE: angles are in radians. Both nu and thw are 
%      from an arbitrary fixed reference "th*", at
%      which you would have M=1.
%      To compress 1rad, reduce nu by 1
%      To expand 1rad, increase nu by 1
%      If compression is too much you get subsonic flow: input data
%        in this range is set to sonic (possible error!)
%      If expansion is too great you get vacuum: input data in this 
%        range is set to vacuum! (possible error)
%      input data can be a vector: value size [N,1]
%        if so out1 will be matrix of size {N,6] in usage 1)
%           in general, each row of the output corresponds to the
%           rows of the input. 
%
%  SITE: ~/aerodyn/AAE334/ISENTROPIC
%
%   M.H. Williams, 2/17/96
%   wiliams@ecn.purdue.edu
%   School of Aero & Astro, Purdue Univ. 
%
%  See also  PITOT, ISEN.

      if nargin==0;
       help spisen;
       disp('type any key to see examples')
       pause
       clc
       disp('example use 1: out1=spisen(1.4,''m'',2)')
       disp('out1=[M,p/p*,V/a*,L/L*,nu,thw] :')
       out1=spisen(1.4,'m',2)
       disp('type any key to continue')
       pause
       clc
       disp('example use 2: nu=spisen(1.4,2)')
       nu=spisen(1.4,2)
       disp('type any key to continue')
       pause
       clc
       disp('example use 3: [nu,M]=spisen(1.4,''m'',[2 3 4]'')')
        M=[2 3 4]';
       [nu,M]=spisen(1.4,'m',M)
       return;
      end
      if (arg1 == 'h' ); help spisen;return;end
      if (arg2 == 'h' ); help spisen;return;end

       gam=arg1;
       fg1=(gam+1)/2;
       fg2=(gam-1)/2;
       fg3=fg2/fg1;
       fg4=1-1./gam;
       akap=sqrt(fg3);

if nargin==3 & nargout~=2
       flg=arg2;
       value=arg3(:);

%
      if (flg == 'm') 
        M=value;
        T=1./(1.+fg3*(M.^2-1.));
      end
%
      if (flg == 'p') 
       p = value;
       T=p.^fg4;
      end
%
      if (flg == 'V') 
       V = value;
       T=1.+fg2*(1.-V.^2);
      end
%
      if ( flg == 'L') 
       rL=value;
       T=rL.^(-2*fg3);
      end
%
      if (flg=='pmf') 
       [nu,M]=spisen(gam,flg,value);
       T=1./(1.+fg3*(M.^2-1.));
      end
%
      if (flg=='thw') 
       thw=value;
       T=(cos(akap*(pi/2.-thw))).^2;
      end
%
%     compute state from T:
       T=max(0,T);           %cutoff any T<0 as garbage!
       rho=T.^(1./(gam-1.));
       p=rho.*T;
       a=sqrt(T);
       V= sqrt(1.+(1.-T)/fg2);
       M=V./a;
       Mi=1./M;
       nu= spisen(gam,M);
       thw=asin(Mi)-nu;
       rL=1./(a.*rho);

        out1=[M,p,V,rL,nu,thw];
 
end

if nargout==2
% usage: [nu,M]=spisen(gam,flg,pin);
      gam=arg1;flg=arg2;pin=arg3(:);
%     out1=nu;out2=Mach;
%=============================================================
%          PRANDTL-MEYER FUNCTION
%      INPUT: gam = ratio of specific hts.
%             pin =  nu (in degrees) or Mach depending on:
%             flg ='m'    then pin is mach no. (output nu)
%             flg =.not.'m'    then pin is nu (output mach no. )
%=============================================================
% 
      if ( flg == 'm'  ) 
%       compute nu given mach
       Mach = pin;
       nu=spisen(gam,Mach);
       out1=nu;
       out2=Mach;
       return
      end
%     
%       compute Mach given nu (flg.ne.'m')
%
       nu = pin;
%      check for over expansion
       numx=spisen(gam,inf);
        kinf=find(nu>numx);
        nu(kinf)=numx*ones(size(kinf));
        if length(kinf)>0
          mess=['some values of nu are > numax !       '; ...
                'these values are set to numax (vacuum)'; ...
                'make sure your data is what you want! '];
          warning(mess)
        end
%      check for over compression and peg at 0
        kneg=find(nu<0);
        nu(kneg)=zeros(size(kneg));
        if length(kneg)>0
          mess=[ 'WARNING: some values of nu are <0 !  '; ...
                 'these values are set to 0            '; ...
                 'make sure your data is what you want!'];
          warning(mess)
        end
%
%      solve : x is 1/mach ( which is between 0 and 1)
      err = 1.e-8;
      slope=-sqrt(numx);
      f=sqrt(nu);
      x=1+f/slope;     %init. guess based on approx nu=numx*(1-x)^2;
      dx=2*err;

% pseudo newton iteration: (frozen slope)
      while max(abs(dx))>err
       rn0=spisen(gam,1./x);
       f0=sqrt(rn0);
       dx=(f-f0)/slope;
       x=x+dx;
      end
%
      Mach = 1./x;
      nu = pin;

      out1=nu;
      out2=Mach;
%
      return;
end;
%


if nargin==2
%usage: nu=spisen(gam,M);
%purpose: get P.M.F from M and gam
%      M= mach no.
%      nu = prandtl-meyer function 
%
      M = arg2;
      rl=sqrt(M.^2-1.);
      nu=1./akap*atan(akap*rl)-atan(rl);
%
      out1=nu;
%
      return
end

 if nargout==0 & length(arg3)==1
 disp(' SUPERSONIC ISENTROPIC PROPERTIES')
 disp('____________________________________')
 disp('   ')
 disp(['Mach _____ ',num2str(out1(1))]);
 disp(['p/p* _____ ',num2str(out1(2))]);
 disp(['V/a* _____ ',num2str(out1(3))]);
 disp(['L/L* _____ ',num2str(out1(4))]);
 disp(['nu _______ ',num2str(out1(5))]);
 disp(['thw-th* __ ',num2str(out1(6))]);
 disp('____________________________________')
 end
 
