function X_H = Eigen_Reweighting(X,order,coef)
% X: original eigenvalues
% order: order, -1 stands for infinity
% coef: weights, decaying constant if order = -1
    if (order == -1)  % infinity
        if (length(coef) == 1)
            if (max(abs(X)) * coef < 1)
              X_H = X ./ (1 - coef * X);
            else
                error('Decaying constant too large.');
            end
        else
            error('Eigen_Reweighting wrong.');
        end
    else
        if (length(coef) == order)
            X_H = coef(1) * X;
            X_temp = X;
            for i = 2:order
                X_temp = X_temp .* X;
                X_H = X_H  + coef(i) * X_temp;
            end
        else
            error('Eigen_Reweighting wrong.');
        end
    end
end
