%% Error Analysis General Functions:
% ME 475: Thermo-Fluids
% By: J.Kiley, C.Holler, M.Post

% House Keeping Statements
clc; close all; clear all;

data_test = 1:1:10;
[Sample_Deviation,average_of_sample,degrees_of_freedom,uncertainity_total,T_score,sum_diff_square] = Basic_Precision_Uncertainty(data_test)
%%
function [uncertainity_total] = Basic_Precision_Uncertainty(Data)
    N = length(Data);
    average_of_sample = 1/N*sum(Data);
    degrees_of_freedom = N-1;
    T_score = tinv(0.975, degrees_of_freedom); % Student T score for 97.5% confidence
    for i = 1:N
        sum_diff_square(i) = (Data(i) - average_of_sample)^2;
    end
    sum_diff_square = sum(sum_diff_square);
    Sample_Deviation = sqrt(1/(N-1).*sum_diff_square);
    uncertainity_total = T_score.*Sample_Deviation;
end

function u_dy_dx = Unc_Deritive(X_data,Unc_x,Y_data,Unc_y);
    % Uncertainity for x and y should be column vectors of uncertainity for
    % each data point this will allow for the uncertianty of each 
    % deritive point to be found
    for i = 2:length(X_data)
        u_dy_dx(i) = sqrt(2*(Unc_y*1/(X_data(i)-X_data(i-1)))^2+2*(Unc_X*(Y_data(i)-Y_data(i-1))/((X(i)-X(i-1))^2))^2);
    end
end

function Unc_DAQ = DAQ_unc(Span, Bit)
    Unc_DAQ = 0.5*Span/(2^Bit);
end

function CoSampleDeviation = RegressionUnc(X,Y,Y_CF,