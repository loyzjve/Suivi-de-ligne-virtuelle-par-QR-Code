function B_Spline
clear all
close all
load marqueurs.mat
load marqueurs3.mat

N = length(x3);
alpha = 0 : 360/(N-1) : 360;
        
% nb de segments de B-Splines
Nsegment = 8;
% noeuds de la B-Spline
n = (0:360/Nsegment:360)'; 
% Initialisation de la matrice des moindres carr¨¦
M = zeros(length(x3),Nsegment);
        
        for i = 1:length(x3)     % on remplit la matrice M ligne apr¨¨s ligne
            k = 1;
            while alpha(i)-n(1+k)>0 % recherche du sous-ensemble Sk auquel
                k = k+1;        % appartient x(i)
            end
            t = (alpha(i)-n(k))/(n(k+1)-n(k));
            if k == 1                      % cas o¨´ le sous-ensemble est S1
                M(i,1) = b1(t); M(i,2) = b2(t); M(i,Nsegment) = b0(t);
            elseif k == Nsegment        % cas o¨´ le sous-ensemble est SK
                M(i,k-1) = b0(t); M(i,k) = b1(t); M(i,1) = b2(t);
            else                            % autres cas
                M(i,k-1) = b0(t); M(i,k) = b1(t); M(i,k+1) = b2(t);
            end
        end      
                
        % Calcul des points de contr¨¦e optimaux
        PX = pinv(M)*x3;
        PY = pinv(M)*y3;
        % Calcul des y estim¨¦ avec le vecteur de point de contr¨¦e optimal
        X = M*PX;
        Y = M*PY;
        
        % Au final les estim¨¦s sont rang¨¦s dans des vecteurs X et Y
        % qui sont utilis¨¦s ci-dessous pour le trac¨¦
        % Et les coordonn¨¦s des points de contr¨¦es sont rang¨¦s 
        % dans des vecteurs PX et PY
        
        % Trac¨¦ graphique
        figure(1), plot(x1,y1,'b*'), axis('equal') 
        xlabel('variable x3'), ylabel('variable y3'), hold on
        
        % boucle For permettant d'alterner les couleurs
        % pour diff¨¦rencier les portions de B-Spline
        co = ['r' , 'c']; I=1; i=I; c=1;
        for k = 1:length(n)-1,    
            while alpha(i)<n(k+1);
                i=i+1;
            end
            plot(X(I:i),Y(I:i),co(c),'linewidth',1)
            I=i; if c == 1, c = 2; else c = 1; end
        end
        
        figure(1), plot(x3,y3,'r*')
        % boucle permettant de visualiser les points de contr¨¦e
        plot(PX,PY,'ok'), hold on, grid on
        
        
        J=0;
        for i=1:length(x3)
            J=J+(V(i)-Ve(i)).^2;
        end
        J
        
end


% Fonction B0(t)
function b = b0(t)
b = 0.5*(1-2*t+t^2);
end

% Fonction B1(t)
function b = b1(t)
b = 0.5*(1+2*t-2*t^2);
end

% Fonction B2(t)
function b = b2(t)
b = 0.5*t^2;
end

% Fonction A0(t)
function b = a0(t)
b = t^2-2*t+1;
end

% Fonction A1(t)
function b = a1(t)
b = 0.5*(-3*t^2+4*t);
end

% Fonction A2(t)
function b = a2(t)
b = 0.5*t^2;
end

% Fonction C0(t)
function b = c0(t)
b = 0.5*(t^2-2*t+1);
end

% Fonction C1(t)
function b = c1(t)
b = 0.5*(-3*t^2+2*t+1);
end

% Fonction C2(t)
function b = c2(t)
b = t^2;
end
