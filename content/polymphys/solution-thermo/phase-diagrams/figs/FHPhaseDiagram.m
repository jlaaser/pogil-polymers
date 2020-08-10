function [spinodal,binodal] = FHPhaseDiagram( N )

    spinodal_X = [];
    spinodal_phi1 = [];
    binodal_X = [];
    binodal_phi1 = [];

    for Xinv = 0.25:0.001:2
        
        X = 1/Xinv;
        
        phi1S = SpinodalPoints( X, N );
        
        spinodal_phi1 = horzcat( spinodal_phi1, phi1S );
        spinodal_X = horzcat( spinodal_X, X*ones(size(phi1S)) );
        
        % NOTE: fit to extract binodal is currently very poorly conditioned
        % - need to rethink this and revise before this section will be
        % usable.
        
        %if(length(phi1S)==2)
        %    phi1B = BinodalPoints( X, N );
        %end
        %binodal_phi1 = horzcat( binodal_phi1, phi1B );
        %binodal_X = horzcat( binodal_X, X*ones(size(phi1B)) );
        
    end
    
    [sP_sort, sortorder] = sort( spinodal_phi1 );
    spinodal.phi1 = spinodal_phi1(sortorder);
    spinodal.X = spinodal_X(sortorder);
    
    %[bP_sort, sortorder] = sort( binodal_phi1 );
    %binodal.phi1 = binodal_phi1(sortorder);
    %binodal.X = binodal_X(sortorder);
    binodal = [];

end

function GG = G( phi1, X, N )
    phi2 = 1-phi1;
    
    GG = X*phi1.*phi2 + phi1.*log(phi1) + phi2.*log(phi2)/N;
end

function Gp = dGdP( phi1, X, N )

    Gp = X*(1-2*phi1) + (1+log(phi1)) - (1/N)*(1+log(1-phi1));

end

function Gpp = d2GdP2( phi1, X, N )

    Gpp = -2*X + (1./phi1) + (1/N)./(1-phi1);

end

function phi1s = SpinodalPoints( X, N )

    a = 2*X;
    b = (1/N - 2*X - 1);
    c = 1;
    
    det = sqrt(b^2 - 4*a*c);
    if(isreal(det))
        if(det == 0)
            phi1s = -b/(2*a);
        else
            phi1s = [(-b+det)/(2*a) (-b-det)/(2*a)];
        end
    else
        phi1s = [];
    end
    
    if(max(phi1s) > 1)
        phi1s = [];
    end
    
end

function phi1b = BinodalPoints( X, N )

    phi_crit = sqrt(N)/(1+sqrt(N))

    slope =@(phis) (G(phis(1),X,N) - G(phis(2),X,N))/(phis(1)-phis(2));   % slope of the line connecting two points on the curve
    objectivefun =@(phis) [dGdP(phis(1),X,N) - slope(phis); dGdP(phis(2),X,N) - slope(phis)];  % errors in slope vs tangents
    
    phis_guess = [mean([0 phi_crit]) 0.99999];
    phis_lb = [0 phi_crit];
    phis_ub = [phi_crit 1];
    
    phis_fitted = lsqnonlin( objectivefun, phis_guess, phis_lb, phis_ub );
    
    phi1b = phis_fitted;
    
end