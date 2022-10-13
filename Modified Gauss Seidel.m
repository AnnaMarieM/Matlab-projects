function [Q,R]=mGS(A)
    [m,n] = size(A);
    R = zeros(n);
    v_1 = A(:,1);
    r_11 = norm(v_1, 2); 
    u_1 = v_1/r_11;
    Q = u_1;
    R(1,1) = r_11;
    for i = 2:n
        v_i = A(:,i);
        ubn_i = v_i;
        for k = 1:i-1
            u_k = Q(:,k);
            r_ki = u_k' * ubn_i;
            R(k,i) = r_ki;
            ubn_i = ubn_i - r_ki * u_k;
        end
        r_ii = norm(ubn_i, 2);
        R(i,i) = r_ii;
        u_i = ubn_i/r_ii;
        Q(:,i) = u_i;      
    end
end