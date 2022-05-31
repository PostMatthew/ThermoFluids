%% Spark Engine Analysis
% Lab #2
% By: C.Hollar, J.Kiley, M.Post

% House Keeping Statements:
clc; clear all; close all;
dir FirstData
%% LOW THROTTLE DATA ------------------------------------------------------
%% SI1
SI1 = LoadData("FirstData\SI_EngineData_1.xls");
SI1 = ConvertData(SI1);
%PlotData(SI1)
%% SI2
SI2 = LoadData("FirstData\SI_EngineData_2.xls");
SI2 = ConvertData(SI2);
%PlotData(SI2)
%% SI3
SI3 = LoadData("FirstData\SI_EngineData_3.xls");
SI3 = ConvertData(SI3);
%PlotData(SI3)

%% SI4
SI4 = LoadData("FirstData\SI_EngineData_1.xls");
SI4 = ConvertData(SI4);
%PlotData(SI4)
%% SI5
SI5 = LoadData("FirstData\SI_EngineData_5.xls");
SI5 = ConvertData(SI5);
%PlotData(SI5)
%% SI6
SI6 = LoadData("FirstData\SI_EngineData_6.xls");
SI6 = ConvertData(SI6);
%PlotData(SI6)
%% SI7
SI7 = LoadData("FirstData\SI_EngineData_7.xls");
SI7 = ConvertData(SI7);
%PlotData(SI7)
%% SI8
SI8 = LoadData("FirstData\SI_EngineData_8.xls");
SI8 = ConvertData(SI8);
%PlotData(SI8)
%% Make LowThrottle
% Torques
LowThrottle.torques(1) = SI1.torque;
LowThrottle.torques(2) = SI2.torque;
LowThrottle.torques(3) = SI3.torque;
LowThrottle.torques(4) = SI4.torque;
LowThrottle.torques(5) = SI5.torque;
LowThrottle.torques(6) = SI6.torque;
LowThrottle.torques(7) = SI7.torque;
LowThrottle.torques(8) = SI8.torque;
LowThrottle.torquesUncertainty(1) = SI1.torqueUncertainty;
LowThrottle.torquesUncertainty(2) = SI2.torqueUncertainty;
LowThrottle.torquesUncertainty(3) = SI3.torqueUncertainty;
LowThrottle.torquesUncertainty(4) = SI4.torqueUncertainty;
LowThrottle.torquesUncertainty(5) = SI5.torqueUncertainty;
LowThrottle.torquesUncertainty(6) = SI6.torqueUncertainty;
LowThrottle.torquesUncertainty(7) = SI7.torqueUncertainty;
LowThrottle.torquesUncertainty(8) = SI8.torqueUncertainty;

% Mech_eff
LowThrottle.mech_effs(1) = SI1.mech_eff;
LowThrottle.mech_effs(2) = SI2.mech_eff;
LowThrottle.mech_effs(3) = SI3.mech_eff;
LowThrottle.mech_effs(4) = SI4.mech_eff;
LowThrottle.mech_effs(5) = SI5.mech_eff;
LowThrottle.mech_effs(6) = SI6.mech_eff;
LowThrottle.mech_effs(7) = SI7.mech_eff;
LowThrottle.mech_effs(8) = SI8.mech_eff;

LowThrottle.mech_effsUncertainty(1) = SI1.mech_effUncertainty;
LowThrottle.mech_effsUncertainty(2) = SI2.mech_effUncertainty;
LowThrottle.mech_effsUncertainty(3) = SI3.mech_effUncertainty;
LowThrottle.mech_effsUncertainty(4) = SI4.mech_effUncertainty;
LowThrottle.mech_effsUncertainty(5) = SI5.mech_effUncertainty;
LowThrottle.mech_effsUncertainty(6) = SI6.mech_effUncertainty;
LowThrottle.mech_effsUncertainty(7) = SI7.mech_effUncertainty;
LowThrottle.mech_effsUncertainty(8) = SI8.mech_effUncertainty;
% RPMs
LowThrottle.RPMs(1) = SI1.RPM;
LowThrottle.RPMs(2) = SI2.RPM;
LowThrottle.RPMs(3) = SI3.RPM;
LowThrottle.RPMs(4) = SI4.RPM;
LowThrottle.RPMs(5) = SI5.RPM;
LowThrottle.RPMs(6) = SI6.RPM;
LowThrottle.RPMs(7) = SI7.RPM;
LowThrottle.RPMs(8) = SI8.RPM;

%% Making LowThrottle Torque-RPM & Eff-RPM
PlotRPMTorque(LowThrottle.RPMs, LowThrottle.torques,LowThrottle.torquesUncertainty)
PlotRPMeff(LowThrottle.RPMs,LowThrottle.mech_effs,LowThrottle.mech_effs)

%% MID THROTTLE DATA ------------------------------------------------------

%% SI9
SI9 = LoadData("SecondData\SI_EngineData_9.xls");
SI9 = ConvertData(SI9);
%PlotData(SI9)
%% SI10
SI10 = LoadData("SecondData\SI_EngineData_10.xls");
SI10 = ConvertData(SI10);
%PlotData(SI10)
%% SI11
SI11 = LoadData("SecondData\SI_EngineData_11.xls");
SI11 = ConvertData(SI11);
%PlotData(SI11)
%% SI12
SI12 = LoadData("SecondData\SI_EngineData_12.xls");
SI12 = ConvertData(SI12);
%PlotData(SI12)
%% SI13
SI13 = LoadData("SecondData\SI_EngineData_13.xls");
SI13 = ConvertData(SI13);
%PlotData(SI13)
%% SI14
SI14 = LoadData("SecondData\SI_EngineData_14.xls");
SI14 = ConvertData(SI14);
%PlotData(SI14)
%% SI18
SI18 = LoadData("SecondData\SI_EngineData_18.xls");
SI18 = ConvertData(SI18);
%PlotData(SI18)
%% SI22
SI22 = LoadData("SecondData\SI_EngineData_22.xls");
SI22 = ConvertData(SI22);
%PlotData(SI22)
%% SI26
SI26 = LoadData("SecondData\SI_EngineData_26.xls");
SI26 = ConvertData(SI26);
%PlotData(SI26)
%% SI30
SI30 = LoadData("SecondData\SI_EngineData_30.xls");
SI30 = ConvertData(SI30);
%PlotData(SI30)
%% SI34
SI34 = LoadData("SecondData\SI_EngineData_34.xls");
SI34 = ConvertData(SI34);
%PlotData(SI34)
%% SI38
SI38 = LoadData("SecondData\SI_EngineData_38.xls");
SI38 = ConvertData(SI38);
%PlotData(SI38)
%% SI42
SI42 = LoadData("SecondData\SI_EngineData_42.xls");
SI42 = ConvertData(SI42);
%PlotData(SI42)
%% SI46
SI46 = LoadData("SecondData\SI_EngineData_46.xls");
SI46 = ConvertData(SI46);
%PlotData(SI46)
%% SI50
SI50 = LoadData("SecondData\SI_EngineData_50.xls");
SI50 = ConvertData(SI50);
%PlotData(SI50)
%% SI54
SI54 = LoadData("SecondData\SI_EngineData_54.xls");
SI54 = ConvertData(SI54);
%PlotData(SI54)
%% SI58
SI58 = LoadData("SecondData\SI_EngineData_58.xls");
SI58 = ConvertData(SI58);
%PlotData(SI58)
%% SI62
SI62 = LoadData("SecondData\SI_EngineData_62.xls");
SI62 = ConvertData(SI62);
%PlotData(SI62)
%% SI66
SI66 = LoadData("SecondData\SI_EngineData_66.xls");
SI66 = ConvertData(SI66);
%PlotData(SI66)

%% Make MiddleThrottle
% Torques
MidThrottle.torque(1) = SI9.torque;
MidThrottle.torque(2) = SI10.torque;
MidThrottle.torque(3) = SI11.torque;
MidThrottle.torque(4) = SI14.torque;
MidThrottle.torque(5) = SI18.torque;
MidThrottle.torque(6) = SI22.torque;
MidThrottle.torque(7) = SI26.torque;
MidThrottle.torque(8) = SI30.torque;
MidThrottle.torque(9) = SI34.torque;
MidThrottle.torque(10) = SI38.torque;
MidThrottle.torque(11) = SI42.torque;
MidThrottle.torque(12) = SI46.torque;
MidThrottle.torque(13) = SI50.torque;
MidThrottle.torque(14) = SI54.torque;
MidThrottle.torque(15) = SI58.torque;
MidThrottle.torque(16) = SI62.torque;
MidThrottle.torque(17) = SI66.torque;
MidThrottle.torquesUncertainty(1) = SI9.torqueUncertainty;
MidThrottle.torquesUncertainty(2) = SI10.torqueUncertainty;
MidThrottle.torquesUncertainty(3) = SI11.torqueUncertainty;
MidThrottle.torquesUncertainty(4) = SI14.torqueUncertainty;
MidThrottle.torquesUncertainty(5) = SI18.torqueUncertainty;
MidThrottle.torquesUncertainty(6) = SI22.torqueUncertainty;
MidThrottle.torquesUncertainty(7) = SI26.torqueUncertainty;
MidThrottle.torquesUncertainty(8) = SI30.torqueUncertainty;
MidThrottle.torquesUncertainty(9) = SI34.torqueUncertainty;
MidThrottle.torquesUncertainty(10) = SI38.torqueUncertainty;
MidThrottle.torquesUncertainty(11) = SI42.torqueUncertainty;
MidThrottle.torquesUncertainty(12) = SI46.torqueUncertainty;
MidThrottle.torquesUncertainty(13) = SI50.torqueUncertainty;
MidThrottle.torquesUncertainty(14) = SI54.torqueUncertainty;
MidThrottle.torquesUncertainty(15) = SI58.torqueUncertainty;
MidThrottle.torquesUncertainty(16) = SI62.torqueUncertainty;
MidThrottle.torquesUncertainty(17) = SI66.torqueUncertainty;
% Mech_effs
MidThrottle.mech_effs(1) = SI9.mech_eff;
MidThrottle.mech_effs(2) = SI10.mech_eff;
MidThrottle.mech_effs(3) = SI11.mech_eff;
MidThrottle.mech_effs(4) = SI14.mech_eff;
MidThrottle.mech_effs(5) = SI18.mech_eff;
MidThrottle.mech_effs(6) = SI22.mech_eff;
MidThrottle.mech_effs(7) = SI26.mech_eff;
MidThrottle.mech_effs(8) = SI30.mech_eff;
MidThrottle.mech_effs(9) = SI34.mech_eff;
MidThrottle.mech_effs(10) = SI38.mech_eff;
MidThrottle.mech_effs(11) = SI42.mech_eff;
MidThrottle.mech_effs(12) = SI46.mech_eff;
MidThrottle.mech_effs(13) = SI50.mech_eff;
MidThrottle.mech_effs(14) = SI54.mech_eff;
MidThrottle.mech_effs(15) = SI58.mech_eff;
MidThrottle.mech_effs(16) = SI62.mech_eff;
MidThrottle.mech_effs(17) = SI66.mech_eff;

MidThrottle.mech_effsUncertainty(1) = SI9.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(2) = SI10.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(3) = SI11.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(4) = SI14.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(5) = SI18.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(6) = SI22.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(7) = SI26.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(8) = SI30.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(9) = SI34.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(10) = SI38.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(11) = SI42.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(12) = SI46.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(13) = SI50.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(14) = SI54.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(15) = SI58.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(16) = SI62.mech_effUncertainty;
MidThrottle.mech_effsUncertainty(17) = SI66.mech_effUncertainty;
% RPMs
MidThrottle.RPMs(1) = SI9.RPM;
MidThrottle.RPMs(2) = SI10.RPM;
MidThrottle.RPMs(3) = SI11.RPM;
MidThrottle.RPMs(4) = SI14.RPM;
MidThrottle.RPMs(5) = SI18.RPM;
MidThrottle.RPMs(6) = SI22.RPM;
MidThrottle.RPMs(7) = SI26.RPM;
MidThrottle.RPMs(8) = SI30.RPM;
MidThrottle.RPMs(9) = SI34.RPM;
MidThrottle.RPMs(10) = SI38.RPM;
MidThrottle.RPMs(11) = SI42.RPM;
MidThrottle.RPMs(12) = SI46.RPM;
MidThrottle.RPMs(13) = SI50.RPM;
MidThrottle.RPMs(14) = SI54.RPM;
MidThrottle.RPMs(15) = SI58.RPM;
MidThrottle.RPMs(16) = SI62.RPM;
MidThrottle.RPMs(17) = SI66.RPM;

%% Making MiddleThrottle Torque-RPM & Eff-RPM
PlotRPMTorque(MidThrottle.RPMs, MidThrottle.torque,MidThrottle.torquesUncertainty)
PlotRPMeff(MidThrottle.RPMs,MidThrottle.mech_effs,MidThrottle.mech_effsUncertainty)

%% HIGH THROTTLE DATA -------------------------------------------------
%% SI67
SI67 = LoadData("ThirdData\SI_EngineData_67.xls");
SI67 = ConvertData(SI67);
%PlotData(SI67)
%% SI69
SI69 = LoadData("ThirdData\SI_EngineData_69.xls");
SI69 = ConvertData(SI69);
%PlotData(SI69)
%% SI71
SI71 = LoadData("ThirdData\SI_EngineData_71.xls");
SI71 = ConvertData(SI71);
%PlotData(SI71)
%% SI73
SI73 = LoadData("ThirdData\SI_EngineData_73.xls");
SI73 = ConvertData(SI73);
%PlotData(SI73)
%% SI75
SI75 = LoadData("ThirdData\SI_EngineData_75.xls");
SI75 = ConvertData(SI75);
%PlotData(SI75)
%% SI77
SI77 = LoadData("ThirdData\SI_EngineData_77.xls");
SI77 = ConvertData(SI77);
%PlotData(SI77)
%% SI79
SI79 = LoadData("ThirdData\SI_EngineData_79.xls");
SI79 = ConvertData(SI79);
%PlotData(SI79)
%% SI81
SI81 = LoadData("ThirdData\SI_EngineData_81.xls");
SI81 = ConvertData(SI81);
%PlotData(SI81)
%% SI83
SI83 = LoadData("ThirdData\SI_EngineData_83.xls");
SI83 = ConvertData(SI83);
%PlotData(SI83)
%% Make HighThrottle
% Torques
HighThrottle.torque(1) = SI67.torque;
HighThrottle.torque(2) = SI69.torque;
HighThrottle.torque(3) = SI71.torque;
HighThrottle.torque(4) = SI73.torque;
HighThrottle.torque(5) = SI75.torque;
HighThrottle.torque(6) = SI77.torque;
HighThrottle.torque(7) = SI79.torque;
HighThrottle.torque(8) = SI81.torque;
HighThrottle.torque(9) = SI83.torque;
HighThrottle.torqueUncertainty(1) = SI67.torqueUncertainty;
HighThrottle.torqueUncertainty(2) = SI69.torqueUncertainty;
HighThrottle.torqueUncertainty(3) = SI71.torqueUncertainty;
HighThrottle.torqueUncertainty(4) = SI73.torqueUncertainty;
HighThrottle.torqueUncertainty(5) = SI75.torqueUncertainty;
HighThrottle.torqueUncertainty(6) = SI77.torqueUncertainty;
HighThrottle.torqueUncertainty(7) = SI79.torqueUncertainty;
HighThrottle.torqueUncertainty(8) = SI81.torqueUncertainty;
HighThrottle.torqueUncertainty(9) = SI83.torqueUncertainty;

% Mech_effs
HighThrottle.mech_effs(1) = SI67.mech_eff;
HighThrottle.mech_effs(2) = SI69.mech_eff;
HighThrottle.mech_effs(3) = SI71.mech_eff;
HighThrottle.mech_effs(4) = SI73.mech_eff;
HighThrottle.mech_effs(5) = SI75.mech_eff;
HighThrottle.mech_effs(6) = SI77.mech_eff;
HighThrottle.mech_effs(7) = SI79.mech_eff;
HighThrottle.mech_effs(8) = SI81.mech_eff;
HighThrottle.mech_effs(9) = SI83.mech_eff;

HighThrottle.mech_effsUncertainty(1) = SI67.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(2) = SI69.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(3) = SI71.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(4) = SI73.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(5) = SI75.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(6) = SI77.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(7) = SI79.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(8) = SI81.mech_effUncertainty;
HighThrottle.mech_effsUncertainty(9) = SI83.mech_effUncertainty;
% RPMs
HighThrottle.RPMs(1) = SI67.RPM;
HighThrottle.RPMs(2) = SI69.RPM;
HighThrottle.RPMs(3) = SI71.RPM;
HighThrottle.RPMs(4) = SI73.RPM;
HighThrottle.RPMs(5) = SI75.RPM;
HighThrottle.RPMs(6) = SI77.RPM;
HighThrottle.RPMs(7) = SI79.RPM;
HighThrottle.RPMs(8) = SI81.RPM;
HighThrottle.RPMs(9) = SI83.RPM;

%% Getting Manufactor Data
manufactor.RPM = [1740,2000,2400,2800,3060,3200, 3600]; 
manufactor.HP = [7.05, 8.43, 10.35, 11.95, 12.74, 13.07, 13.71];
manufactor.Torque = manufactor.HP.*5252./manufactor.RPM;
%% Making HighThrottle Torque-RPM & Eff-RPM
PlotRPMTorque(HighThrottle.RPMs, HighThrottle.torque,HighThrottle.torqueUncertainty)
PlotRPMeff(HighThrottle.RPMs,HighThrottle.mech_effs,HighThrottle.mech_effsUncertainty)

%% Plotting Report Graphs
PlotPaperPicturesEffs(LowThrottle,MidThrottle,HighThrottle)
PlotPaperPicturesTorques(LowThrottle,MidThrottle,HighThrottle,manufactor)
%% Loading Data As A Struct:
function ExperimentStruct = LoadData(fname)
    data = load(fname);
    ExperimentStruct.crank_angle = data(:,1); % degrees
    ExperimentStruct.voltage = data(:,2); % Volts
    ExperimentStruct.onecycle = cycleguy(ExperimentStruct);
    ExperimentStruct.torque = mean(data(:,3))+0.2033; % ft-lbs
    ExperimentStruct.RPM = mean(data(:,4)); % RPM
    ExperimentStruct.torqueUncertainty = std(data(:,3))
end

function ExperimentStruct = ConvertData(ExperimentStruct)
    ExperimentStruct.pressure = PressureFromVoltage(ExperimentStruct.onecycle.voltage); % PSI, pressure
    ExperimentStruct.Vol = VolFromCrank(ExperimentStruct.onecycle.crank_angle); % in^3, volume of cylinder
    ExperimentStruct.FluidWork= 2*WorkFromPV(ExperimentStruct.pressure,ExperimentStruct.Vol); % J, work under curve
    ExperimentStruct.FluidWorkUncertainty = 2*WorkFromPV(ExperimentStruct.pressure,ExperimentStruct.Vol*0.01);
    ExperimentStruct.Omega = ExperimentStruct.RPM/9.5493; % Rad/s, angular velocity
    ExperimentStruct.BrakePower = BrakePower(ExperimentStruct.torque,ExperimentStruct.Omega); % W
    ExperimentStruct.BrakePowerUncertainty = BrakePower(ExperimentStruct.torqueUncertainty,ExperimentStruct.Omega); % W
    ExperimentStruct.CycleTime = TimeFromRPM(ExperimentStruct.RPM); % cycle time, sec
    ExperimentStruct.FluidPower = ExperimentStruct.FluidWork/ExperimentStruct.CycleTime; % W
    ExperimentStruct.FluidPowerUncertainty = ExperimentStruct.FluidWorkUncertainty/ExperimentStruct.CycleTime; % W
    ExperimentStruct.mech_eff = Eff(ExperimentStruct.BrakePower,ExperimentStruct.FluidPower);
    ExperimentStruct.mech_effUncertainty = EffUncertainty(ExperimentStruct.torque,ExperimentStruct.torqueUncertainty,ExperimentStruct.FluidPower)
    ExperimentStruct.PressureMax = PressureMax(ExperimentStruct.onecycle.voltage)
    ExperimentStruct.PressureMin = PressureMin(ExperimentStruct.onecycle.voltage)
end

%% Extracting Data Functions:

function p = PressureFromVoltage(Voltage)
    p = 14.70+22.717*(Voltage-0.5); %PSI
end

function vol = VolFromCrank(gamma)
    % m_to_in = 0.0254; % m/in
    a = 1.3; % m
    b = 4.134;% m
    clearance = 0.346; % m
    bore = 2.68; % m
    d2 = a*cosd(gamma); % m
    c = sqrt(a.^2+d2.^2); % m
    d1 = sqrt(b.^2-c.^2); % m
    d3 = d1+d2; % m
    vol = (clearance + a + b - d3)*(pi*bore^2/4); % m^3
end

function work = WorkFromPV(pressure,volume)
    work = 2*trapz(volume,pressure)/12;
end

function brakePower = BrakePower(Torque,omega)
    brakePower = Torque.*omega;
end

function t = TimeFromRPM(RPM)
    placeholder = 60/pi;
    t = placeholder/RPM;
end

function mech_eff = Eff(BrakePower,FluidPower)
    mech_eff = BrakePower/FluidPower;
end

%
% Uncertainty
%

% Pressure
function p = PressureMax(Voltage)
    VoltageMax = Voltage * 1.02;
    p = 14.70+22.717*(VoltageMax-0.5);
end
function p = PressureMin(Voltage)
    VoltageMax = Voltage * 0.98;
    p = 14.70+22.717*(VoltageMax-0.5);
end

function effUnc = EffUncertainty(torque,torqueUncertainty,fluidPower)
    syms t fp
    eqn = (t * 60 / pi / 9.5493) / ( fp );
    dt = diff(eqn,t)
    dfp = diff(eqn,fp)
    
    t = torque;
    fp = fluidPower;
    
    dt = 200000/(31831*fp*pi);
    dfp = -(200000*t)/(31831*fp^2*pi);
    fpUncertainty = 0.01*fluidPower;
    effUnc = sqrt((dt*torqueUncertainty)^2 + (dfp*fpUncertainty)^2);
end

%% Plotting Stuff From ExperimentStruct
function PlotData(ExperimentStruct)
    figure()
    hold on
    xlabel("Volume, in^{3}")
    ylabel("Pressure, Psi")
    plot(ExperimentStruct.Vol,ExperimentStruct.pressure/1E3,".")
    plot(ExperimentStruct.Vol,ExperimentStruct.PressureMax/1E3,"go")
    plot(ExperimentStruct.Vol,ExperimentStruct.PressureMin/1E3,"ro")
    legend("Experimental Data", "Upper Bound", "Lower Bound")
    %errorbar(ExperimentStruct.Vol,ExperimentStruct.pressure/1E3,ExperimentStruct.PressureMin/1E3,ExperimentStruct.PressureMax/1E3)
    hold off
end
function PlotRPMTorque(RPMs,Torques,TorquesUncertainty)
    figure()
    hold on
    ylim([0 20])
    xlabel("Engine Speed, RPM")
    ylabel("Torque, #-ft")
    plot(RPMs,Torques,"o")
    RPM_Uncertainty = zeros(size(RPMs))+0.0005;
    errorbar(RPMs,Torques,TorquesUncertainty,TorquesUncertainty,RPM_Uncertainty,RPM_Uncertainty,"o")
    hold off
end
function PlotRPMeff(RPMs,effs,effsUncertainty)
    figure()
    hold on
    %ylim([0 1])
    xlabel("Engine Speed, RPM")
    ylabel("Efficiancy")
    plot(RPMs,effs,"o")
    RPM_Uncertainty = zeros(size(RPMs))+0.0005;
    errorbar(RPMs,effs,effsUncertainty,effsUncertainty,RPM_Uncertainty,RPM_Uncertainty,"o")
    hold off
end

function PlotPaperPicturesEffs(Data1,Data2,Data3)
    figure()
    hold on
    ylim([0 1])
    xlabel("Engine Speed, RPM")
    ylabel("Efficiancy")
    Data1.RPM_Uncertainty = zeros(size(Data1.RPMs))+0.0005;
    errorbar(Data1.RPMs,Data1.mech_effs,Data1.mech_effsUncertainty,Data1.mech_effsUncertainty,Data1.RPM_Uncertainty,Data1.RPM_Uncertainty,"o")
    Data2.RPM_Uncertainty = zeros(size(Data1.RPMs))+0.0005;
    errorbar(Data2.RPMs,Data2.mech_effs,Data2.mech_effsUncertainty,"o")
    % ,Data2.mech_effsUncertainty,Data2.RPM_Uncertainty,Data2.RPM_Uncertainty,
    Data3.RPM_Uncertainty = zeros(size(Data3.RPMs))+0.0005;
    errorbar(Data3.RPMs,Data3.mech_effs,Data3.mech_effsUncertainty,Data3.mech_effsUncertainty,Data3.RPM_Uncertainty,Data3.RPM_Uncertainty,"o")
    hold off
    legend("Low Throttle Data", "Middle Throttle Data", "High Throttle Data")
end

function PlotPaperPicturesTorques(Data1,Data2,Data3,manufactor)
    figure()
    hold on
    RPM_Uncertainty = zeros(size(Data1.RPMs))+0.0005;
    errorbar(Data1.RPMs,Data1.torques,Data1.torquesUncertainty,Data1.torquesUncertainty,RPM_Uncertainty,RPM_Uncertainty,"o")
    RPM_Uncertainty = zeros(size(Data2.RPMs))+0.0005;
    errorbar(Data2.RPMs,Data2.torque,Data2.torquesUncertainty,Data2.torquesUncertainty,RPM_Uncertainty,RPM_Uncertainty,"o")
    RPM_Uncertainty = zeros(size(Data3.RPMs))+0.0005;
    errorbar(Data3.RPMs,Data3.torque,Data3.torqueUncertainty,Data3.torqueUncertainty,RPM_Uncertainty,RPM_Uncertainty,"o")
    plot(manufactor.RPM,manufactor.Torque)
    xlabel("Engine Speed, RPM")
    ylabel("Torque, lb-ft")
    ylim([0 25])
    hold off
    legend("Low Throttle Data", "Middle Throttle Data", "High Throttle Data","Manufacturer Data")
end