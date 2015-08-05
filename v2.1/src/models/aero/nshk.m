function pouts=nshk(arg1,arg2,arg3)
% NSHK  usage:  pouts=nshk(gam,flag,flagvalue)
%                 or, if no output & scalar input specified; as in:
%               nshk(gam,flag,flagvalue);  pretty print answer, which 
%                is also stored in a variable [ans].
%
%              NORMAL SHOCK RELATIONS
%                for ideal gas
%
%    3 inputs :
%       arg1 =  gam = rat of spec hts
%       arg2 =  flag = 'm1','m2','p','r','a','p0', or 'du' as desired
%       arg3 =  value of flagged parameter
%                may be an [N,1] vector
% 
%                flag  flagvalue
%                'm1'    M1             upstream Mach no.
%                'm2'    M2             downstream Mach no.
%                'p'     p2/p1          pressure ratio
%                'r'     r2/r1          density ratio
%                'a'     a2/a1          speed of sound ratio
%                'p0'    1-p02/p01      stagnation pressure loss
%                'du'    (u1-u2)/a1     relative speed Mach number
%
%       pouts= [M1,M2,p2/p1,r2/r1,a2/a1,dp0=1-p02/p01]
%        if arg3=[N,1] then pouts=[N,6]
%
%
%    2 inputs : (called internally when flag = 'p0')
%       arg1 = gam
%       arg2 = dp0
%       pouts = r2/r1 
%
%    0 inputs : runs help and examples
%================================================================
%
%  SITE: /home/roger/l/aerodyn/AAE334/NSHOCKS
%
%   M.H. Williams, 2/17/96
%   wiliams@ecn.purdue.edu
%   School of Aero & Astro, Purdue Univ. 
%================================================================
%
%  See also  PITOT ISEN OBSHK

global gam akek0

if nargin == 0
 help nshk

 disp('hit any key for examples')
 pause

 clc
 disp('example: M1 input, vector output:out= nshk(1.4,''m1'',2.)')
 disp(' out= [M1,M2,p2/p1,r2/r1,a2/a1,dp0=1-p02/p01]');
 out=nshk(1.4,'m1',2.)


 disp('hit any key to continue')
 pause

 clc
 disp(' example of p2/p1 table input, matrix output:')
 disp('outs=nshk(1.4,''p'',[1:.1:2]'')');
 disp(' outs= [M1,M2,p2/p1,r2/r1,a2/a1,dp0=1-p02/p01]');
 outs=nshk(1.4,'p',[1:.1:2]')
 
 disp('hit any key to continue')
 pause

 clc
 disp(' example of pretty print output (scalar input only):')
 disp('>nshk(1.4,''p'',2)');
 nshk(1.4,'p',2);
end


%  pouts = nshk(gam,dp0) :return r2/r1 given dp0

if nargin ==2 
 gam=arg1;
 dp0=arg2;
 
         ep = (gam-1.)/(gam+1.);
          
%        weak shock approx.
          rm = 1./3.;
          akek0 = (1. -dp0).^(1.-gam);
          K0=1./akek0;
          dkek0 = akek0-1.;
          b = (dkek0./akek0).^rm;
          c = (gam*(gam^2-1.)/12.)^rm;
          c1 = 2.*c/(gam-1.) -1. -1./(2.*c);
%
          x = 1.+ b/c .* ( 1. +b/c/2. +c1*b.*b );

%        strong shock case  (Newton iteration)
%
          dx=ones(size(x));
          tol=1.e-6;
         while max(abs(dx)) > tol
          xg = x.^gam;
          K = xg.* (1.-ep*x)./(x-ep) ;
          Kp = K.*(gam./x - ep./(1-ep*x) - 1./(x-ep));
          dx = (K0-K)./Kp ;
          x = x + dx;
         end
          r2r1=x;
%

    pouts = r2r1;
%
end


if nargin==3
 gam=arg1;
 flag=arg2;
 para=arg3;

 ep = (gam-1.)/(gam+1.);
 flagi = flag;
 
  if flag == 'm1'
         if min(para)<1
          disp('ERROR: must have M1>=1.')
         end

         am1 = para;
  end
 
  if flag == 'm2'
        am2min=sqrt(.5*(1.-1./gam));
         if max(para)>1. | min(para)<am2min
          disp(['ERROR: must have ',num2str(am2min),'<M2<=1.'])
         end

         am2 = para;
         am22 = am2.^2;
         am1 = sqrt(( (gam-1)*am22 +2)./( 2*gam*am22 -gam+1) );
   end
 
   if flag == 'a' 
         if min(para)<1.
          disp('ERROR: must have a2/a1 >=1.')
         end

         a2a1 = para;
         y = a2a1.^2;
         x = ( y - 1.)/(2.*ep);
         p2p1 =  x + sqrt(x.^2 + y); 
         flag = 'p';
         para = p2p1;
    end	
 
    if flag == 'p0'
         if max(para)>1. | min(para)<0.
          disp('ERROR: dp0p0 must be <1 and >0')
         end
         dp0p0 = para;
         r2r1= nshk(gam,dp0p0);  
         flag = 'r';
         para = r2r1;
        end
 
        if flag == 'p'
         if min(para)<1.
          disp('ERROR: must have p2/p1 >=1.')
         end
         p2p1 = para;
         am1 = sqrt( ((gam+1)*p2p1 +gam-1 )/(2*gam) );
     end	
 
     if flag == 'r' 
          rmx=(gam+1)/(gam-1);
         if min(para)<1.|max(para)>rmx
          disp(['ERROR: must have ',num2str(rmx),'> rho2/rho1 >=1.'])
         end
         r2r1 = para;
         am1 = sqrt( r2r1*(1.-ep)./(1.-ep*r2r1) );
      end	
 
      if flag == 'du'
         if min(para)<0.
          disp('ERROR: must have u1-u2  >=0.')
         end
         x= (gam+1.)/4.*para;
         am1 = x + sqrt(x.^2+1);
       end
 
       am12 = am1.^2;
 
       am2 = sqrt( ((gam-1)*am12 +2)./( 2*gam*am12 -gam+1) );
       p2p1 = (2*gam*am12 -gam+1)/(gam+1);
       r2r1 = (p2p1 + ep)./(1. + p2p1*ep);
       a2a1 = sqrt(p2p1./r2r1);
       dp0p0 = -(p2p1.*r2r1.^(-gam) ).^(1./(1.-gam)) +1.;
 
       flag = flagi;
 
pouts=[am1,am2,p2p1,r2r1,a2a1,dp0p0];

if nargout==0 & length(arg3)==1
 disp('  ')
 disp(' NORMAL SHOCK PROPERTIES')
 disp('_________________________________')
 disp('   ')
 disp([' M1 __ ',num2str(am1)]);
 disp([' M2 __ ',num2str(am2)]);
 disp([' p2/p1 __ ',num2str(p2p1)]);
 disp([' rho2/rho1 __ ',num2str(r2r1)]);
 disp([' a2/a1 __ ',num2str(a2a1)]);
 disp([' 1-p02/p01 __ ',num2str(dp0p0)]);
 disp('_________________________________')
end

end
