function outs=obshk(gam,arg1,arg2,prb)
%OBSHK : solve oblique shock problems
%usage : outs=obshk(gam,arg1,arg2,prb)
%
%   INPUTS: gam = ratio of spec. heats
%           arg1= value of 1st input number
%           arg2= value of 2nd input number 
%      
%           prb = problem code : 1...6 
%                          arg1      arg2
%                        __________________
%             prb=1:        M1 ,      th   weak root
%                 2:        M1 ,      th   strong root
%                 3:        M1             get detachment point 
%                 4:        M1 ,      M2   
%                 5:        M1 ,      bet
%                 6:        bet,      th
%   NOTE:  angles th & bet are in radians!
%
%   defaults:
%                  0 run help + example of prb=1
%        nargin=   2 is equivalent to prb=3
%                  3 is equivalent to prb=1
%   dimensions: arg1 arg2 can be column vectors of same length
%               gam & prb are scalars
%
%   OUTPUTS:  outs=[M1,th,bet,M2,p2/p1,r2/r1,a2/a1,1-p02/p01];
%
%  SITE: /home/roger/l/aerodyn/AAE334/NSHOCKS
%
%   M.H. Williams, 2/17/96
%   wiliams@ecn.purdue.edu
%   School of Aero & Astro, Purdue Univ. 
%
%  See also  NSHK 

%                         DEMO SECTION
if nargin==0
 help obshk

 disp('type any key to see examples')
 pause

 clc
 disp('example: outs=obshk(gam,M1,th) OR obshk(gam,M1,th,1)')
 gam=1.4
 M1=[2;3]
 th=pi/180*[10;20]
 disp('    M1     th     bet    M2     p2/p1    r2/r1    a2/a1    1-p01/p01 ')
 disp('_________________________________________________________________________')
 outs=obshk(gam,M1,th)

 disp('type any key to see another')
 pause

 clc
 disp('example: outs=obshk(gam,M1,bet,5)')
 gam=1.4
 M1=[2;3]
 bet=pi/180*[60;80]
 disp('    M1     th     bet    M2     p2/p1    r2/r1    a2/a1    1-p01/p01 ')
 disp('_________________________________________________________________________')
 outs=obshk(gam,M1,bet,5)

 disp('type any key to see examples')
 pause

 clc
 disp('example: detachment : outs=obshk(gam,M1)')
 gam=1.4
 M1=[2;3]
 disp('    M1     th     bet    M2     p2/p1    r2/r1    a2/a1    1-p01/p01 ')
 disp('_________________________________________________________________________')
 outs=obshk(gam,M1)

 disp('type any key to see examples')
 pause

 clc
 disp('example: plot M2 vs th for M1=3 : SEE FIGURE WINDOW')
 disp('>M1=3;')
 disp('>macha=asin(1./M1);')
 disp('>bet= macha + (pi/2-macha)*[0:.01:1]'';')
 disp('>M1=M1*ones(size(bet));')
 disp('>out=obshk(1.4,M1,bet,5);')
 disp('>plot(out(:,2),out(:,4));')
 hfig=figure;
 M1=3;
 macha=asin(1./M1);
 bet= macha + (pi/2-macha)*[0:.01:1]';
 M1=M1*ones(size(bet));
 out=obshk(1.4,M1,bet,5);
 plot(out(:,2),out(:,4));
 xlabel('theta')
 ylabel('M2')
 title(' gamma=1.4 & M1=3')
 drawnow

 disp('type any key to see examples')
 pause
 close(hfig);

 clc
 disp('example: pretty print result: obshk(1.4,2,.3)')
 obshk(1.4,2.,.3);
 return
end

%          COMPUTATION SECTION:

if nargin==3;prb=1;end
if nargin==2;prb=3;end

 g1=(gam-1)/2;
 g2=(gam+1)/2;
 ep=g1/g2;

if prb<6
 M1=arg1;
 M12=M1.^2;
 fg1=1+g1*M12;
 fg2=1+g2*M12;

 c2=(M12-1)/3;
 c=sqrt(c2);
 a = fg2./c/3;
 b=1.5*(1+fg1./c2./fg2);
 
% detachment angle given M1:
 Xm= (b.^2-3)/2;
 Xm=1./sqrt(Xm+sqrt(Xm.^2+2*b-3));
 thm=atan(Xm./a);
 if prb==3
  arg2=thm;
  prb=1;
 end
end


if prb<3
 th=arg2;
 tau=tan(th);

 X=a.*tau;
 Y=sqrt(1.+X.^2);

 csi=-X.*(X.^2+b)./Y.^3;

%[weak,strong] solns:
 psi=acos(csi);
 if prb==2; psi=2*pi-psi;end   ;%strong root
 
 tausi= c.*(2*Y.*cos(psi/3)-X);
 bet=atan(1./tausi);

 kf=find(th>thm);
 bet(kf)=NaN*ones(size(kf));

end


%

% M1 & M2 specified:
if prb==4
 M1=arg1;M2=arg2;
 M12=M1.^2;M22=M2.^2;
 T2T1=(1+g1*M12)./(1+g1*M22);
 p2p1=(T2T1 -1 + sqrt((T2T1-1).^2 + 4*ep^2*T2T1) )/(2*ep);
 Mn12=1 + g2/gam*(p2p1-1);
 Mn1=sqrt(Mn12);
 bet=asin(Mn1./M1);
 prb=5;arg2=bet;
end

% M1 & bet specified
if prb==5
 M1=arg1;bet=arg2;
 taus=tan(bet);taus2=taus.^2;
 tau= (3*c2.*taus2 -1)./(fg2 + fg1.*taus2)./taus;
 th = atan(tau);
end

% th & bet specified:
if prb==6
 th=arg2;bet=arg1;
 tau=tan(th);taus=tan(bet);taus2=taus.^2;
 M12 = (1 + tau.*taus).*(1+taus2)./(taus.*(taus - g2*tau - g1*tau.*taus2));
 M1=sqrt(M12);
end

M1n=M1.*sin(bet);
nouts=nshk(gam,'m1',M1n);
M2n=nouts(:,2);
M2=M2n./sin(bet-th);
outs= real([M1,th,bet,M2,nouts(:,3:6)]);

if nargout==0 & size(outs,1)==1
 disp('   ')
 disp('    OBLIQUE SHOCK PROPERTIES')
 disp('___________________________________')
 disp('   ')
 disp([ 'M1 ___ ', num2str(outs(1))])
 disp([ 'theta ___ ', num2str(outs(2))])
 disp([ 'beta ___ ', num2str(outs(3))])
 disp([ 'M2 ___ ', num2str(outs(4))])
 disp([ 'p2/p1 ___ ', num2str(outs(5))])
 disp([ 'r2/r1 ___ ', num2str(outs(6))])
 disp([ 'a2/a1 ___ ', num2str(outs(7))])
 disp([ '1-p02/p01 ___ ', num2str(outs(8))])
 disp('___________________________________')
end
