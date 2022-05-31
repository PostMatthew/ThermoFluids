%% Wind Tunnel Analsis
% ME 475: Thermo Fluids
% Experiment #1: Wind Tunnel
% J. Kiley, C. Holler, M. Post

% House Keeping Statement
clc; close all; clear all;

% Read In Recorded Relevant Data Files:
% airfoil_data = load("Airfoil.csv");
% turb_sphere_data = load("Turbulant_Sphere.csv");
% golf_ball_data = load("Golf_ball.csv");
% SmoothSphere_1_data = load("Smooth_Sphere_1.csv");
% SmoothSphere_2_data = load("Smooth_Sphere_2.csv");

alpha_arr = -6:0.5:20;
%% Functions:
function CL = CL_simple(Lift, Area, Air_velocity, rho)
    CL = Lift./(rho*Area.*(Air_velocity.^2)/2);
end

function CD = CD_simple(Drag, Area, Air_velocity, rho)
    CD = Drag./(rho*Area.*(Air_velocity.^2)/2);
end

function [Drag, Lift] = Lift_and_Drag(FN,FA,alpha) % Accounts for 3D lift theory
   Drag = FN.*sind(alpha)+FA.*cosd(alpha);
   Lift = FN.*cosd(alpha)+FA.*cosd(alpha);
end

function Cd = CD_Correlation(Re)
    Cd = 24/Re + 2.6*(Re/5)/(1+(Re/5)^1.52)+0.411*(Re/263000)^(-7.94)/(1+Re/263000)^-8+Re^0.8/461000;
end

function CL = CL_3D(AR,Abs_alpha,emp)
    CL = 2*pi*AR/(AR+2/emp).*(Abs_alpha);
end

function CD = CD_3d(CD_0,CL,AR,emp)
    CD = CD_0 + CL.^2/(pi.*AR.*emp);
end