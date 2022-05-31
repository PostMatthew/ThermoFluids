
%% Steam Turbine Analysis
% By: Matt Post, James Kiley, Christian Hollar,

%% NEXT STEPS:
% WRITE THE DAMN REPORT
%% Analysis
% House Keeping Statements
clc; clear all; close all;

% Load Data
Data = LoadData("SteamTurbineData.xlsx");
Data = GetTotalEnthaplyAndEntropy(Data);
PlotAllExperiments(Data)
Data = GetAllGenEffs(Data);
Data = GetAllMassFlows(Data);
Data = GetAllFluidWork(Data);
Data = GetAllTurbineWork(Data);
Data = GetAllTurbEff(Data);
% PlotTurbineEfficiencies(Data)
Data.OneBulb = CondensorEffectiviness(Data.OneBulb);
Data = GetAllCondensorEff(Data);
% PlotCondensorEffectiviness(Data)
Data.OneBulb = ThermalEff(Data.OneBulb);
Data = GetAllEnthalpyEntropyUnc(Data);
Data = GetAllThermalEff(Data);
Data = SetAllUncertainties(Data);
% PlotThermalEff(Data)
PlotAllEffs(Data)
%% FUNCTIONS BEGIN HERE------------------------------------------------------------------------------------

%% Loading Data
function ExperimentStruct = LoadExperiment(data,i)
% USE THIS FOR DESKTOP ANALYSIS
    ExperimentStruct.T9 = table2array(data(2,i)); %F, Temperature after HV10
    ExperimentStruct.T1 = table2array(data(3,i)); %F, Temperature after turbine
    ExperimentStruct.T5 = table2array(data(4,i)); %F, 
    ExperimentStruct.T4 = table2array(data(5,i)); %F
    ExperimentStruct.T2 = table2array(data(6,i)); %F
    ExperimentStruct.T3 = table2array(data(7,i)); %F
    ExperimentStruct.T8 = table2array(data(8,i)); %F, Temperature prior to going into super heater
    ExperimentStruct.T7 = table2array(data(9,i)); %F, Temperature after going into super heater
    ExperimentStruct.P0 = table2array(data(10,i)); %PSI, Pressure after entering the flow meters
    ExperimentStruct.P1 = table2array(data(11,i)); %PSI, pressure after turbine
    ExperimentStruct.P3 = table2array(data(12,i)); %In of Hg, 
    ExperimentStruct.P8 = table2array(data(13,i)); %PSI, Pressure prior to going into super heater
    ExperimentStruct.P9 = table2array(data(14,i)); %PSI, Pressure after HV10
    ExperimentStruct.StemCondesnseFlowRate = table2array(data(15,i)); %kg/s
    ExperimentStruct.CoolWaterFlow = table2array(data(16,i)); %Hz
    ExperimentStruct.GenVoltage = table2array(data(17,i)); %Voltage
    ExperimentStruct.GenCurrent = table2array(data(18,i)); %Amps
    ExperimentStruct.AmbTemp = table2array(data(19,i)); %C
    ExperimentStruct.BarometerPressure = table2array(data(20,i)); % mb Hpa
    ExperimentStruct.RPM = table2array(data(21,i)); %RPM
    ExperimentStruct.Load = table2array(data(22,i)); % Number of bulbs (load)
    ExperimentStruct.Load_Percent = table2array(data(23,i)); % Load Percentage (Number of Bublbs divided by 100 bulbs [max load])
% USE THESE FOR PC ANALYSIS
%     ExperimentStruct.T9 = table2array(data(1,i)); %F, Temperature after HV10
%     ExperimentStruct.T1 = table2array(data(2,i)); %F, Temperature after turbine
%     ExperimentStruct.T5 = table2array(data(3,i)); %F, 
%     ExperimentStruct.T4 = table2array(data(4,i)); %F
%     ExperimentStruct.T2 = table2array(data(5,i)); %F
%     ExperimentStruct.T3 = table2array(data(6,i)); %F
%     ExperimentStruct.T8 = table2array(data(7,i)); %F, Temperature prior to going into super heater
%     ExperimentStruct.T7 = table2array(data(8,i)); %F, Temperature after going into super heater
%     ExperimentStruct.P0 = table2array(data(9,i)); %PSI, Pressure after entering the flow meters
%     ExperimentStruct.P1 = table2array(data(10,i)); %PSI, pressure after turbine
%     ExperimentStruct.P3 = table2array(data(11,i)); %In of Hg, 
%     ExperimentStruct.P8 = table2array(data(12,i)); %PSI, Pressure prior to going into super heater
%     ExperimentStruct.P9 = table2array(data(13,i)); %PSI, Pressure after HV10
%     ExperimentStruct.StemCondesnseFlowRate = table2array(data(14,i)); %kg/s
%     ExperimentStruct.CoolWaterFlow = table2array(data(15,i)); %Hz
%     ExperimentStruct.GenVoltage = table2array(data(16,i)); %Voltage
%     ExperimentStruct.GenCurrent = table2array(data(17,i)); %Amps
%     ExperimentStruct.AmbTemp = table2array(data(18,i)); %C
%     ExperimentStruct.BarometerPressure = table2array(data(19,i)); % mb Hpa
%     ExperimentStruct.RPM = table2array(data(20,i)); %RPM
%     ExperimentStruct.Load = table2array(data(21,i)); % Number of bulbs (load)
%     ExperimentStruct.Load_Percent = table2array(data(22,i)); % Load Percentage (Number of Bublbs divided by 100 bulbs [max load])
end

% This function loads all of data within multiple structs
function Struct = LoadData(fname)
    data = readtable(fname);
    Struct.NoLoad = LoadExperiment(data,3);
    Struct.NoLoad = ConvertExperimentData(Struct.NoLoad);
    Struct.OneBulb = LoadExperiment(data,4);
    Struct.OneBulb = ConvertExperimentData(Struct.OneBulb);
    Struct.TwoBulb=LoadExperiment(data,5);
    Struct.TwoBulb = ConvertExperimentData(Struct.TwoBulb);
    Struct.ThreeBulb=LoadExperiment(data,6);
    Struct.ThreeBulb = ConvertExperimentData(Struct.ThreeBulb);
    Struct.FourBulb = LoadExperiment(data,7);
    Struct.FourBulb = ConvertExperimentData(Struct.FourBulb);
    Struct.FiveBulb = LoadExperiment(data,8);
    Struct.FiveBulb = ConvertExperimentData(Struct.FiveBulb);
    Struct.SixBulb = LoadExperiment(data,9);
    Struct.SixBulb = ConvertExperimentData(Struct.SixBulb);
    Struct.SevenBulb = LoadExperiment(data,10);
    Struct.SevenBulb = ConvertExperimentData(Struct.SevenBulb);
    Struct.EightBulb = LoadExperiment(data,11);
    Struct.EightBulb = ConvertExperimentData(Struct.EightBulb);
    Struct.NineBulb = LoadExperiment(data,12);
    Struct.NineBulb = ConvertExperimentData(Struct.NineBulb);
    Struct.TenBulb = LoadExperiment(data,13);
    Struct.TenBulb = ConvertExperimentData(Struct.TenBulb);
%     Struct.NoLoad = LoadExperiment(data,3);
%     Struct.NoLoad = ConvertExperimentData(Struct.NoLoad);
%     Struct.OneBulb = LoadExperiment(data,4);
%     Struct.OneBulb = ConvertExperimentData(Struct.OneBulb);
%     Struct.TwoBulb=LoadExperiment(data,5);
%     Struct.TwoBulb = ConvertExperimentData(Struct.TwoBulb);
%     Struct.ThreeBulb=LoadExperiment(data,6);
%     Struct.ThreeBulb = ConvertExperimentData(Struct.ThreeBulb);
%     Struct.FourBulb = LoadExperiment(data,7);
%     Struct.FourBulb = ConvertExperimentData(Struct.FourBulb);
%     Struct.FiveBulb = LoadExperiment(data,8);
%     Struct.FiveBulb = ConvertExperimentData(Struct.FiveBulb);
%     Struct.SixBulb = LoadExperiment(data,9);
%     Struct.SixBulb = ConvertExperimentData(Struct.SixBulb);
%     Struct.SevenBulb = LoadExperiment(data,10);
%     Struct.SevenBulb = ConvertExperimentData(Struct.SevenBulb);
%     Struct.EightBulb = LoadExperiment(data,11);
%     Struct.EightBulb = ConvertExperimentData(Struct.EightBulb);
%     Struct.NineBulb = LoadExperiment(data,12);
%     Struct.NineBulb = ConvertExperimentData(Struct.NineBulb);
%     Struct.TenBulb = LoadExperiment(data,13);
%     Struct.TenBulb = ConvertExperimentData(Struct.TenBulb);
%     Struct = GetTotalEnthaplyAndEntropy(Struct);
end

%% Converting Data to Right Units:
function Struct=ConvertExperimentData(Struct)
    P_atm = 101325; % atmospheric pressure, Pa
    % Convert Temperatures to K
    %5/9*(F-32)+273
    Struct.T9 = 5/9*(Struct.T9-32)+273; %K, Temperature after HV10
    Struct.T1 = 5/9*(Struct.T1-32)+273; %K, Temperature after turbine
    Struct.T5 = 5/9*(Struct.T5-32)+273; %K, 
    Struct.T4 = 5/9*(Struct.T4-32)+273; %K
    Struct.T2 = 5/9*(Struct.T2-32)+273; %K
    Struct.T3 = 5/9*(Struct.T3-32)+273; %K
    Struct.T8 = 5/9*(Struct.T8-32)+273; %K, Temperature prior to going into super heater
    Struct.T7 = 5/9*(Struct.T7-32)+273; %K, Temperature after going into super heater
    
    % Convert Pressures to Pa
    Struct.P0 = Struct.P0*6894.76+P_atm; %PA, Pressure after entering the flow meters
    Struct.P1 = Struct.P1*6894.76+P_atm; %PA, pressure after turbine
    Struct.P3 = Struct.P3*3386.389+P_atm; %PA
    Struct.P8 = Struct.P8*6894.76+P_atm; %PA, Pressure prior to going into super heater
    Struct.P9 = Struct.P9*6894.76+P_atm; %PA, Pressure after HV10
end

%% Cool Props Functions:
function Struct = GetEnthalpyAndEntropy(Struct)
    Struct.H.SuperHeaterIn = PropsSI('H','Q',1,'P',Struct.P8,'Water');
    Struct.S.SuperHeaterIn = PropsSI('S','Q',1,'P',Struct.P8,'Water');

    T_SH_in = Struct.T8;
    Struct.H.SuperHeaterOut = PropsSI('H','T',Struct.T7,'P',Struct.P9,'Water');
    Struct.S.SuperHeaterOut = PropsSI('S','T',Struct.T7,'P',Struct.P9,'Water');

    T_Turb_out = Struct.T1;
    Struct.H.Turbine_in = Struct.H.SuperHeaterOut;
    Struct.S.Turbine_in = PropsSI('S','H',Struct.H.SuperHeaterOut,'P',Struct.P0,'Water');
    T_Turb_in = PropsSI('T','H',Struct.H.SuperHeaterOut,'P',Struct.P0,'Water');
    
    Struct.H.Turbine_out = PropsSI('H','T',Struct.T1,'P',Struct.P1,'Water');
    Struct.S.Turbine_out = PropsSI('S','T',Struct.T1,'P',Struct.P1,'Water');
    
    Struct.H.Condensor_in = PropsSI('H','T',Struct.T1,'P',Struct.P3,'Water');
    Struct.S.Condensor_in = PropsSI('S','T',Struct.T1,'P',Struct.P3,'Water');
    T_Cond_in = Struct.T1;
    
    Struct.H.Condensor_out = PropsSI('H','T',Struct.T3,'P',Struct.P3,'Water');
    Struct.S.Condensor_out = PropsSI('S','T',Struct.T3,'P',Struct.P3,'Water');
    T_Cond_out = Struct.T3;

    T_SH_out = Struct.T7;

    T_PumpOut = PropsSI('T','S',Struct.S.Condensor_out,'P',Struct.P3,'Water'); 
    Struct.H.PumpOut = PropsSI('P','S',Struct.S.Condensor_out,'P',Struct.P3,'Water');
    Q1_T_dummy = PropsSI('T','P',Struct.P3,'Q',1,'Water');
    Q0_T_dummy = PropsSI('T','P',Struct.P8,'Q',0,'Water');
    Q0_S_dummy = PropsSI('S','P',Struct.P8,'Q',0,'Water');
    Struct.H_arr = [Struct.H.SuperHeaterIn,Struct.H.SuperHeaterOut,Struct.H.Turbine_in,Struct.H.Turbine_out,Struct.H.Condensor_in,Struct.H.Condensor_out,Struct.H.PumpOut];
    Struct.S_arr = [Struct.S.SuperHeaterIn,Struct.S.SuperHeaterOut,Struct.S.Turbine_in,Struct.S.Turbine_out,Struct.S.Condensor_in,Struct.S.Condensor_in,Struct.S.Condensor_out,Q0_S_dummy,Struct.S.SuperHeaterIn];
    Struct.T_arr= [T_SH_in,T_SH_out,T_Turb_in,T_Turb_out,T_Cond_in,Q1_T_dummy,T_Cond_out,(Q0_T_dummy),T_SH_in];
    %Struct.T_arr_real = [T_SH_in,T_SH_out,T]
end
%% Getting H & S for Each Experiment
function Struct = GetTotalEnthaplyAndEntropy(Struct)
    Struct.NoLoad = GetEnthalpyAndEntropy(Struct.NoLoad);
    Struct.OneBulb = GetEnthalpyAndEntropy(Struct.OneBulb);
    Struct.TwoBulb = GetEnthalpyAndEntropy(Struct.TwoBulb);
    Struct.ThreeBulb = GetEnthalpyAndEntropy(Struct.ThreeBulb);
    Struct.FourBulb = GetEnthalpyAndEntropy(Struct.FourBulb);
    Struct.FiveBulb = GetEnthalpyAndEntropy(Struct.FiveBulb);
    Struct.SixBulb = GetEnthalpyAndEntropy(Struct.SixBulb);
    Struct.SevenBulb = GetEnthalpyAndEntropy(Struct.SevenBulb);
    Struct.EightBulb = GetEnthalpyAndEntropy(Struct.EightBulb);
    Struct.NineBulb = GetEnthalpyAndEntropy(Struct.NineBulb);
    Struct.TenBulb = GetEnthalpyAndEntropy(Struct.TenBulb);
end
%% Interp1 Functions:
function m_dot_out = GetMassFlowRate(freq_query)
    freq_chart = [0,70.1,88.5,92.6,130.8,173.9,216.6,258.8,288.9,314.1,326.6]; % Hz, Turbine Flow Meter Sampling Freq
    m_dot_chart = [0,1.141,1.39,1.473,2.107,2.761,3.488,4.233,4.666,5.034,5.310]; % #-m/sec, Turbine Mass Flow Rate
    m_dot_chart = m_dot_chart*.453; %kg/s
    m_dot_out = interp1(freq_chart,m_dot_chart,freq_query); %interperlorating to find our mass flow rate
end

function gen_eff_out = GetGenEff(PercentLoad_query)
    PercentLoad_query=PercentLoad_query*100;
    PercentLoad_chart = [0,9.47,25.71,38.35,50.68,63.31,75.79,87.97,100.3,112.78,125.26]; % percent load, units of %, from ME 475 manual
    GenEff_chart = [0.0027,0.4384,0.7222,0.8123,0.8483,0.8649,0.8724,0.8814,0.8904,0.8844,0.8784]; % unitless, Generator Efficiency from ME 475 manual
    gen_eff_out = interp1(PercentLoad_chart,GenEff_chart,PercentLoad_query); % interperlorating to find our Gen Efficiency
end

%% Work Functions:
function Struct = GetFluidWork(Struct)
    Struct.FluidWork = Struct.StemCondesnseFlowRate*(Struct.H.Turbine_in-Struct.H.Turbine_out);
end

function Struct = GetWorkOut(Struct)
    Struct.WorkOut =  (Struct.GenVoltage * Struct.GenCurrent)/Struct.gen_eff_out ;
end

%% Efficiency Functions:
function Struct = TurbineMechEff(Struct)
    % work_out: units of ft-lbs
    % work_fluid: units of ft-lbs
    Struct.Turbine_mech_eff = Struct.turbine_power_out./Struct.FluidWork; % unitless
end

function Struct = GetPowerOut(Struct)
    Struct.turbine_power_out = (Struct.GenVoltage*Struct.GenCurrent)/Struct.gen_eff_out;
end

function Struct = CondensorEffectiviness(Struct)
    T_cold_in = Struct.T5;
    T_cold_out = Struct.T4;
    T_hot_in = Struct.T2;
    T_hot_out = Struct.T3;
    Struct.condensor_eff = (T_hot_in-T_hot_out)/(T_hot_in-T_cold_in);
end

function Struct = ThermalEff(Struct)
    h1 = Struct.H.SuperHeaterOut; 
    h2 = Struct.H.Turbine_out;
    h3 = Struct.H.Condensor_out;
    h4 = Struct.H.PumpOut;
    Struct.thermal_eff = ((h1-h2))/(-h4);
end
%% Running Calculations For All Experiments
function Struct = GetAllGenEffs(Struct)
    Struct.NoLoad.gen_eff_out = GetGenEff(Struct.NoLoad.Load_Percent);
    Struct.OneBulb.gen_eff_out = GetGenEff(Struct.OneBulb.Load_Percent);
    Struct.TwoBulb.gen_eff_out = GetGenEff(Struct.TwoBulb.Load_Percent);
    Struct.ThreeBulb.gen_eff_out = GetGenEff(Struct.ThreeBulb.Load_Percent);
    Struct.FourBulb.gen_eff_out = GetGenEff(Struct.FourBulb.Load_Percent);
    Struct.FiveBulb.gen_eff_out = GetGenEff(Struct.FiveBulb.Load_Percent);
    Struct.SixBulb.gen_eff_out = GetGenEff(Struct.SixBulb.Load_Percent);
    Struct.SevenBulb.gen_eff_out = GetGenEff(Struct.SevenBulb.Load_Percent);
    Struct.EightBulb.gen_eff_out = GetGenEff(Struct.EightBulb.Load_Percent);
    Struct.NineBulb.gen_eff_out = GetGenEff(Struct.NineBulb.Load_Percent);
    Struct.TenBulb.gen_eff_out = GetGenEff(Struct.TenBulb.Load_Percent);
end


function Struct = GetAllMassFlows(Struct)
    Struct.NoLoad.cooling_m_dot_out = GetMassFlowRate(Struct.NoLoad.CoolWaterFlow);
    Struct.OneBulb.cooling_m_dot_out = GetMassFlowRate(Struct.OneBulb.CoolWaterFlow);
    Struct.TwoBulb.cooling_m_dot_out = GetMassFlowRate(Struct.TwoBulb.CoolWaterFlow);
    Struct.ThreeBulb.cooling_m_dot_out = GetMassFlowRate(Struct.ThreeBulb.CoolWaterFlow);
    Struct.FourBulb.cooling_m_dot_out = GetMassFlowRate(Struct.FourBulb.CoolWaterFlow);
    Struct.FiveBulb.cooling_m_dot_out = GetMassFlowRate(Struct.FiveBulb.CoolWaterFlow);
    Struct.SixBulb.cooling_m_dot_out = GetMassFlowRate(Struct.SixBulb.CoolWaterFlow);
    Struct.SevenBulb.cooling_m_dot_out = GetMassFlowRate(Struct.SevenBulb.CoolWaterFlow);
    Struct.EightBulb.cooling_m_dot_out = GetMassFlowRate(Struct.EightBulb.CoolWaterFlow);
    Struct.NineBulb.cooling_m_dot_out = GetMassFlowRate(Struct.NineBulb.CoolWaterFlow);
    Struct.TenBulb.cooling_m_dot_out = GetMassFlowRate(Struct.TenBulb.CoolWaterFlow);
end

function Struct = GetAllFluidWork(Struct)
   Struct.NoLoad = GetFluidWork(Struct.NoLoad);
   Struct.OneBulb = GetFluidWork(Struct.OneBulb);
   Struct.TwoBulb= GetFluidWork(Struct.TwoBulb);
   Struct.ThreeBulb = GetFluidWork(Struct.ThreeBulb);
   Struct.FourBulb = GetFluidWork(Struct.FourBulb);
   Struct.FiveBulb = GetFluidWork(Struct.FiveBulb);
   Struct.SixBulb = GetFluidWork(Struct.SixBulb);
   Struct.SevenBulb = GetFluidWork(Struct.SevenBulb);
   Struct.EightBulb = GetFluidWork(Struct.EightBulb);
   Struct.NineBulb = GetFluidWork(Struct.NineBulb);
   Struct.TenBulb = GetFluidWork(Struct.TenBulb);
end

function Struct = GetAllTurbineWork(Struct)
    Struct.NoLoad = GetPowerOut(Struct.NoLoad);
    Struct.OneBulb = GetPowerOut(Struct.OneBulb);
    Struct.TwoBulb = GetPowerOut(Struct.TwoBulb);
    Struct.ThreeBulb = GetPowerOut(Struct.ThreeBulb);
    Struct.FourBulb = GetPowerOut(Struct.FourBulb);
    Struct.FiveBulb = GetPowerOut(Struct.FiveBulb);
    Struct.SixBulb = GetPowerOut(Struct.SixBulb);
    Struct.SevenBulb = GetPowerOut(Struct.SevenBulb);
    Struct.EightBulb = GetPowerOut(Struct.EightBulb);
    Struct.NineBulb = GetPowerOut(Struct.NineBulb);
    Struct.TenBulb= GetPowerOut(Struct.TenBulb);
end

function Struct = GetAllTurbEff(Struct)
    Struct.NoLoad = TurbineMechEff(Struct.NoLoad);
    Struct.OneBulb = TurbineMechEff(Struct.OneBulb);
    Struct.TwoBulb = TurbineMechEff(Struct.TwoBulb);
    Struct.ThreeBulb = TurbineMechEff(Struct.ThreeBulb);
    Struct.FourBulb = TurbineMechEff(Struct.FourBulb);
    Struct.FiveBulb= TurbineMechEff(Struct.FiveBulb);
    Struct.SixBulb = TurbineMechEff(Struct.SixBulb);
    Struct.SevenBulb = TurbineMechEff(Struct.SevenBulb);
    Struct.EightBulb = TurbineMechEff(Struct.EightBulb);
    Struct.NineBulb = TurbineMechEff(Struct.NineBulb);
    Struct.TenBulb = TurbineMechEff(Struct.TenBulb);
end

function Struct = GetAllCondensorEff(Struct)
    Struct.NoLoad = CondensorEffectiviness(Struct.NoLoad);
    Struct.OneBulb = CondensorEffectiviness(Struct.OneBulb);
    Struct.TwoBulb = CondensorEffectiviness(Struct.TwoBulb);
    Struct.ThreeBulb = CondensorEffectiviness(Struct.ThreeBulb);
    Struct.FourBulb = CondensorEffectiviness(Struct.FourBulb);
    Struct.FiveBulb = CondensorEffectiviness(Struct.FiveBulb);
    Struct.SixBulb= CondensorEffectiviness(Struct.SixBulb);
    Struct.SevenBulb= CondensorEffectiviness(Struct.SevenBulb);
    Struct.EightBulb = CondensorEffectiviness(Struct.EightBulb);
    Struct.NineBulb = CondensorEffectiviness(Struct.NineBulb);
    Struct.TenBulb = CondensorEffectiviness(Struct.TenBulb);
end

function Struct = GetAllThermalEff(Struct)
    Struct.NoLoad = ThermalEff(Struct.NoLoad);
    Struct.OneBulb = ThermalEff(Struct.OneBulb);
    Struct.TwoBulb= ThermalEff(Struct.TwoBulb);
    Struct.ThreeBulb = ThermalEff(Struct.ThreeBulb);
    Struct.FourBulb = ThermalEff(Struct.FourBulb);
    Struct.FiveBulb = ThermalEff(Struct.FiveBulb);
    Struct.SixBulb = ThermalEff(Struct.SixBulb);
    Struct.SevenBulb = ThermalEff(Struct.SevenBulb);
    Struct.EightBulb = ThermalEff(Struct.EightBulb);
    Struct.NineBulb = ThermalEff(Struct.NineBulb);
    Struct.TenBulb= ThermalEff(Struct.TenBulb);
end
%% Plotting Functions:
function PlotVaporDome()
    T_Range = 1:368; %C
    T_Range = T_Range+273; %K
    for j = 1:368
        sLiq(j) = PropsSI('S','T',T_Range(j),'Q',0,'water');
        sVap(j) = PropsSI('S','T',T_Range(j),'Q',1,'water');
    end
    plot(sLiq,T_Range,"b")
    plot(sVap,T_Range,"b")
end

function PlotExperiment(Struct)
    plot(Struct.S_arr,Struct.T_arr)
end

function PlotAllExperiments(Struct)
    figure()
    hold on
    xlabel("Entropy, Kj/Kg*K")
    ylabel("Temperature, K")
%     PlotExperiment(Struct.NoLoad)
    PlotExperiment(Struct.OneBulb)
%     PlotExperiment(Struct.TwoBulb)
    PlotExperiment(Struct.ThreeBulb)
%     PlotExperiment(Struct.FourBulb)
    PlotExperiment(Struct.FiveBulb)
%     PlotExperiment(Struct.SixBulb)
    PlotExperiment(Struct.SevenBulb)
%     PlotExperiment(Struct.EightBulb)
    PlotExperiment(Struct.NineBulb)
%     PlotExperiment(Struct.TenBulb)
    PlotVaporDome()
    hold off
%     legend("No Load", "One Bulb","Two Bulb","Three Bulb","Four Bulb","Five Bulb","Six Bulb", "Seven Bulb", "Eight Bulb", "Nine Bulb", "Ten Bulb")
    legend("One Bulb","Three Bulb","Five Bulb","Seven Bulb", "Nine Bulb")
end

function PlotTurbineEfficiencies(Struct)
    hold on
    errorbar(Struct.NoLoad.Load_Percent*100,Struct.NoLoad.Turbine_mech_eff,Struct.NoLoad.uTurbineEfficiency,"*")
    errorbar(Struct.OneBulb.Load_Percent*100,Struct.OneBulb.Turbine_mech_eff,Struct.OneBulb.uTurbineEfficiency,"*")
    errorbar(Struct.TwoBulb.Load_Percent*100,Struct.TwoBulb.Turbine_mech_eff,Struct.TwoBulb.uTurbineEfficiency,"*")
    errorbar(Struct.ThreeBulb.Load_Percent*100,Struct.ThreeBulb.Turbine_mech_eff,Struct.ThreeBulb.uTurbineEfficiency,"*")
    errorbar(Struct.FourBulb.Load_Percent*100,Struct.FourBulb.Turbine_mech_eff,Struct.FourBulb.uTurbineEfficiency,"*")
    errorbar(Struct.FiveBulb.Load_Percent*100,Struct.FiveBulb.Turbine_mech_eff,Struct.FiveBulb.uTurbineEfficiency,"*")
    errorbar(Struct.SixBulb.Load_Percent*100,Struct.SixBulb.Turbine_mech_eff,Struct.SixBulb.uTurbineEfficiency,"*")
    errorbar(Struct.SevenBulb.Load_Percent*100,Struct.SevenBulb.Turbine_mech_eff,Struct.SevenBulb.uTurbineEfficiency,"*")
    errorbar(Struct.EightBulb.Load_Percent*100,Struct.EightBulb.Turbine_mech_eff,Struct.EightBulb.uTurbineEfficiency,"*")
    errorbar(Struct.NineBulb.Load_Percent*100,Struct.NineBulb.Turbine_mech_eff,Struct.NineBulb.uTurbineEfficiency,"*")
    errorbar(Struct.TenBulb.Load_Percent*100,Struct.TenBulb.Turbine_mech_eff,Struct.TenBulb.uTurbineEfficiency,"*")
    xlabel("Load Percent (%)")
    ylabel("Turbine Efficiency")
    hold off
    legend("No Load", "One Bulb", "Two Bulb","Three Bulb", "Four Bulb","Five Bulb","Six Bulb","Seven Bulb","Eight Bulb", "Nine Bulb","Ten Bulb","Location","East","NumColumns",3)
end

function PlotCondensorEffectiviness(Struct)
    hold on
    errorbar(Struct.NoLoad.Load_Percent*100,Struct.NoLoad.condensor_eff,Struct.NoLoad.uCondensorEffectiveness,"*")
    errorbar(Struct.OneBulb.Load_Percent*100,Struct.OneBulb.condensor_eff,Struct.OneBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.TwoBulb.Load_Percent*100,Struct.TwoBulb.condensor_eff,Struct.TwoBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.ThreeBulb.Load_Percent*100,Struct.ThreeBulb.condensor_eff,Struct.ThreeBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.FourBulb.Load_Percent*100,Struct.FourBulb.condensor_eff,Struct.FourBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.FiveBulb.Load_Percent*100,Struct.FiveBulb.condensor_eff,Struct.FiveBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.SixBulb.Load_Percent*100,Struct.SixBulb.condensor_eff,Struct.SixBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.SevenBulb.Load_Percent*100,Struct.SevenBulb.condensor_eff,Struct.SevenBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.EightBulb.Load_Percent*100,Struct.EightBulb.condensor_eff,Struct.EightBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.NineBulb.Load_Percent*100,Struct.NineBulb.condensor_eff,Struct.NineBulb.uCondensorEffectiveness,"*")
    errorbar(Struct.TenBulb.Load_Percent*100,Struct.TenBulb.condensor_eff,Struct.TenBulb.uCondensorEffectiveness,"*")
    ylim([0.3 0.35])
    xlabel("Load Percent (%)")
    ylabel("Condensor Effectiviness")
    hold off
    legend("No Load", "One Bulb", "Two Bulb","Three Bulb", "Four Bulb","Five Bulb","Six Bulb","Seven Bulb","Eight Bulb", "Nine Bulb","Ten Bulb","Location","North","NumColumns",3)
end

function PlotThermalEff(Struct)
    hold on
    errorbar(Struct.NoLoad.Load_Percent*100,Struct.NoLoad.thermal_eff,Struct.NoLoad.uThermalEff,"*")
    errorbar(Struct.OneBulb.Load_Percent*100,Struct.OneBulb.thermal_eff,Struct.OneBulb.uThermalEff,"*")
    errorbar(Struct.TwoBulb.Load_Percent*100,Struct.TwoBulb.thermal_eff,Struct.TwoBulb.uThermalEff,"*")
    errorbar(Struct.ThreeBulb.Load_Percent*100,Struct.ThreeBulb.thermal_eff,Struct.ThreeBulb.uThermalEff,"*")
    errorbar(Struct.FourBulb.Load_Percent*100,Struct.FourBulb.thermal_eff,Struct.FourBulb.uThermalEff,"*")
    errorbar(Struct.FiveBulb.Load_Percent*100,Struct.FiveBulb.thermal_eff,Struct.FiveBulb.uThermalEff,"*")
    errorbar(Struct.SixBulb.Load_Percent*100,Struct.SixBulb.thermal_eff,Struct.SixBulb.uThermalEff,"*")
    errorbar(Struct.SevenBulb.Load_Percent*100,Struct.SevenBulb.thermal_eff,Struct.SevenBulb.uThermalEff,"*")
    errorbar(Struct.EightBulb.Load_Percent*100,Struct.EightBulb.thermal_eff,Struct.EightBulb.uThermalEff,"*")
    errorbar(Struct.NineBulb.Load_Percent*100,Struct.NineBulb.thermal_eff,Struct.NineBulb.uThermalEff,"*")
    errorbar(Struct.TenBulb.Load_Percent*100,Struct.TenBulb.thermal_eff,Struct.TenBulb.uThermalEff,"*")
    ylim([0 0.05])
    xlabel("Load Percent (%)")
    ylabel("Thermal Efficiency")
    hold off
    legend("No Load", "One Bulb", "Two Bulb","Three Bulb", "Four Bulb","Five Bulb","Six Bulb","Seven Bulb","Eight Bulb", "Nine Bulb","Ten Bulb","Location","North","NumColumns",3)
end

function PlotAllEffs(Struct)
figure()
    subplot(3,1,1)
    PlotTurbineEfficiencies(Struct)
    
    subplot(3,1,2)
    PlotCondensorEffectiviness(Struct)
    
    subplot(3,1,3)
    PlotThermalEff(Struct)
end
%% Uncertainty

function uWorkOut = uncertaintyWorkOut(generatorEff, generatorVoltage, generatorCurrent)
    syms eff voltage current
    workOut = eff / (voltage * current);
    
    dEff = diff(workOut,eff);
    dVoltage = diff(workOut,voltage);
    dCurrent = diff(workOut,current);
    eff = generatorEff;
    voltage = generatorVoltage;
    current = generatorCurrent;
    if current == 0;
        current =0.01;
    end
    dEff = subs(dEff);
    dVoltage = subs(dVoltage);
    dCurrent = subs(dCurrent);

    uEff = 0;
    uVoltage = 0.00001;
    uCurrent = 0.00001;
    
    uWorkOut = sqrt((dEff*uEff)^2+(dVoltage*uVoltage)^2+(dCurrent*uCurrent)^2);
end

function uWorkFluid = uncertaintyWorkFluid(massFlowRate,enthalpyBeforeTurbine,uEnthalpyBeforeTurbine,enthalpyAfterTurbine,uEnthalpyAfterTurbine)
    syms hBefore hAfter mDot

    workFluid = mDot * (hBefore-hAfter);
    
    dEnthalpyBefore = diff(workFluid,hBefore);
    dEnthalpyAfter = diff(workFluid,hAfter);
    dMassFlowRate = diff(workFluid,mDot);
    
    hBefore = enthalpyBeforeTurbine;
    hAfter = enthalpyAfterTurbine;
    mDot = massFlowRate;

    dEnthalpyBefore = subs(dEnthalpyBefore);
    dEnthalpyAfter = subs(dEnthalpyAfter);
    dMassFlowRate = subs(dMassFlowRate);

    uMassFlowRate = 0;

    uWorkFluid = sqrt((dMassFlowRate*uMassFlowRate)^2+(dEnthalpyBefore*uEnthalpyBeforeTurbine)^2+(dEnthalpyAfter*uEnthalpyAfterTurbine)^2);
end


function uMechEff = uncertaintyMechEff(workOut,uWorkOut,workFluid,uWorkFluid)
    syms wout wfluid
    mechEff = wout / wfluid;
    
    dWorkOut = diff(mechEff,wout);
    dWorkFluid = diff(mechEff,wfluid);
    
    wout = workOut;
    wfluid = workFluid;

    dWorkOut = subs(dWorkOut);
    dWorkFluid = subs(dWorkFluid);

    uMechEff = sqrt((dWorkOut*uWorkOut)^2+(dWorkFluid*uWorkFluid)^2);
end

function uCondensorEff = uCondensorEff(Thin,Thout,Tcoldin)
    syms T_h_in T_h_out T_cold_in
    condensorEffectiveness = (T_h_in - T_h_out)/(T_h_in - T_cold_in);
    
    dT_h_in = diff(condensorEffectiveness,T_h_in);
    dT_h_out = diff(condensorEffectiveness,T_h_out);
    dT_cold_in = diff(condensorEffectiveness, T_cold_in);
    
    T_h_in = Thin;
    T_h_out = Thout;
    T_cold_in = Tcoldin;
    
    dT_h_in = subs(dT_h_in);
    dT_h_out = subs(dT_h_out);
    dT_cold_in = subs(dT_cold_in);

    uT_h_in = 0.1;
    uT_h_out = 0.1;
    uT_cold_in = 0.1;

    uCondensorEff = sqrt((dT_h_in*uT_h_in)^2+(dT_h_out*uT_h_out)^2+(dT_cold_in*dT_cold_in)^2);
end

function uThermalEff = uThermalEff(hone,uh1,htwo,uh2,hfour,uh4)
    syms h1 h2 h4

    thermalEfficiency = (h1 - h2)/(h1 - h4);

    dh1 = diff(thermalEfficiency,h1);
    dh2 = diff(thermalEfficiency,h2);
    dh4 = diff(thermalEfficiency,h4);

    h1 = hone;
    h2 = htwo;
    h4 = hfour;

    dh1 = subs(dh1);
    dh2 = subs(dh2);
    dh4 = subs(dh4);

    uThermalEff = sqrt((dh1*uh1)^2+(dh2*uh2)^2+(dh4*uh4)^2);
end
%% Uncertainity For Enthalpy & Entropy
function partial_d = UncLookUpTableEnthalpy(name_constant_prop,constant_prop_value,name_changing_prop,changing_prop_value)
    eta = 0.01;
    h1 = PropsSI('H',name_constant_prop,constant_prop_value,name_changing_prop,changing_prop_value*(1+eta),'Water');
    h2 = PropsSI('H',name_constant_prop,constant_prop_value,name_changing_prop,changing_prop_value*(1-eta),'Water');
    partial_d = (h1-h2)/(eta*changing_prop_value); 
end

function partial_d = UncLookUpTableEntropy(name_constant_prop,constant_prop_value,name_changing_prop,changing_prop_value)
    eta = 0.01;
    S1 = PropsSI('S',name_constant_prop,constant_prop_value,name_changing_prop,changing_prop_value*(1+eta),'Water');
    S2 = PropsSI('S',name_constant_prop,constant_prop_value,name_changing_prop,changing_prop_value*(1-eta),'Water');
    partial_d = (S1-S2)/(eta*changing_prop_value); 
end

function Struct = UncSuperHeaterIn(Struct)
    % Enthalpy Uncertainity
    partial_HP = UncLookUpTableEnthalpy('P',Struct.P8,'Q',1);
    parial_HQ = UncLookUpTableEnthalpy('Q',1,'P',Struct.P8);
    Struct.UncSuperHeaterIn_H = sqrt((partial_HP*Struct.UncPressure)^2+(parial_HQ*Struct.UncQuality)^2);
    
    % Entropy Uncertainity 
    partial_SP = UncLookUpTableEntropy('P',Struct.P8,'Q',1);
    parial_SQ = UncLookUpTableEntropy('Q',1,'P',Struct.P8);
    Struct.UncSuperHeaterIn_S = sqrt((partial_SP*Struct.UncPressure)^2+(parial_SQ*Struct.UncQuality)^2);
end

function Struct = UncSuperHeaterOut(Struct)
    % Enthalpy Uncertainity
    partial_HP = UncLookUpTableEnthalpy('P',Struct.P9,'T',Struct.T7);
    parial_HT = UncLookUpTableEnthalpy('T',Struct.T7,'P',Struct.P9);
    Struct.UncSuperHeaterOut_H = sqrt((partial_HP*Struct.UncPressure)^2+(parial_HT*Struct.UncTemp)^2);
    
    % Entropy Uncertainity 
    partial_SP = UncLookUpTableEntropy('P',Struct.P9,'T',Struct.T7);
    parial_ST = UncLookUpTableEntropy('T',Struct.T7,'P',Struct.P9);
    Struct.UncSuperHeaterOut_S = sqrt((partial_SP*Struct.UncPressure)^2+(parial_ST*Struct.UncTemp)^2);
end

function Struct = UncTurbineIn(Struct)
    % Enthalpy Uncertainity
    partial_HP = UncLookUpTableEnthalpy('P',Struct.P9,'T',Struct.T9);
    parial_HT = UncLookUpTableEnthalpy('T',Struct.T9,'P',Struct.P9);
    Struct.UncTurbineIn_H = sqrt((partial_HP*Struct.UncPressure)^2+(parial_HT*Struct.UncTemp)^2);

    % Enthalpy Uncertainity
    partial_SP = UncLookUpTableEntropy('P',Struct.P9,'T',Struct.T9);
    parial_ST = UncLookUpTableEntropy('T',Struct.T9,'P',Struct.P9);
    Struct.UncSuperHeaterOut_S = sqrt((partial_SP*Struct.UncPressure)^2+(parial_ST*Struct.UncTemp)^2);
end

function Struct = UncTurbineOut(Struct)
    % Enthalpy Uncertainity
    partial_HP = UncLookUpTableEnthalpy('P',Struct.P1,'T',Struct.T1);
    parial_HT = UncLookUpTableEnthalpy('T',Struct.T1,'P',Struct.P1);
    Struct.UncTurbineOut_H = sqrt((partial_HP*Struct.UncPressure)^2+(parial_HT*Struct.UncTemp)^2);

    % Enthalpy Uncertainity
    partial_SP = UncLookUpTableEntropy('P',Struct.P1,'T',Struct.T1);
    parial_ST = UncLookUpTableEntropy('T',Struct.T1,'P',Struct.P1);
    Struct.UncTurbineOut_S = sqrt((partial_SP*Struct.UncPressure)^2+(parial_ST*Struct.UncTemp)^2);
end

function Struct = UncPumpOut(Struct)
    % Enthalpy Uncertainity
%         T_PumpOut = PropsSI('T','S',Struct.S.Condensor_out,'P',Struct.P3,'Water'); 
%     Struct.H.PumpOut = PropsSI('P','S',Struct.S.Condensor_out,'P',Struct.P3,'Water');
    partial_HS = UncLookUpTableEnthalpy('S',Struct.S.Condensor_out,'P',Struct.P3);
    parial_HP = UncLookUpTableEnthalpy('P',Struct.P3,'S',Struct.S.Condensor_out);
    Struct.UncPumpOut_H = sqrt((partial_HS*0.01)^2+(parial_HP*Struct.UncPressure)^2);

    % Enthalpy Uncertainity
    partial_SS = UncLookUpTableEntropy('S',Struct.S.Condensor_out,'P',Struct.P3);
    parial_SP = UncLookUpTableEntropy('P',Struct.P3,'S',Struct.S.Condensor_out);
    Struct.UncPumpOut_S = sqrt((partial_SS*Struct.UncPressure)^2+(parial_SP*Struct.UncTemp)^2);
end

% Getting Uncertainities For Each State Within The Cycle
function Struct = GetExperimentEnthalpyEntropyUnc(Struct)
    Struct.UncPressure = 0.01;
    Struct.UncQuality = 0.001;
    Struct.UncTemp = 0.1;
    Struct = UncSuperHeaterIn(Struct);
    Struct = UncSuperHeaterOut(Struct);
    Struct = UncTurbineIn(Struct);
    Struct = UncTurbineOut(Struct);
    Struct = UncPumpOut(Struct);
end
% Getting Uncertainities for All Experiments
function Struct = GetAllEnthalpyEntropyUnc(Struct)
    Struct.NoLoad = GetExperimentEnthalpyEntropyUnc(Struct.NoLoad);
    Struct.OneBulb= GetExperimentEnthalpyEntropyUnc(Struct.OneBulb);
    Struct.TwoBulb = GetExperimentEnthalpyEntropyUnc(Struct.TwoBulb);
    Struct.ThreeBulb = GetExperimentEnthalpyEntropyUnc(Struct.ThreeBulb);
    Struct.FourBulb = GetExperimentEnthalpyEntropyUnc(Struct.FourBulb);
    Struct.FiveBulb = GetExperimentEnthalpyEntropyUnc(Struct.FiveBulb);
    Struct.SixBulb = GetExperimentEnthalpyEntropyUnc(Struct.SixBulb);
    Struct.SevenBulb = GetExperimentEnthalpyEntropyUnc(Struct.SevenBulb);
    Struct.EightBulb = GetExperimentEnthalpyEntropyUnc(Struct.EightBulb);
    Struct.NineBulb = GetExperimentEnthalpyEntropyUnc(Struct.NineBulb);
    Struct.TenBulb = GetExperimentEnthalpyEntropyUnc(Struct.TenBulb);
end

function Struct = setUWorkOut(Struct)
Struct.uWorkOut = uncertaintyWorkOut(Struct.gen_eff_out,Struct.GenVoltage,Struct.GenCurrent);
end

function Struct = setUWorkFluid(Struct)
    Struct.uWorkFluid = uncertaintyWorkFluid(Struct.cooling_m_dot_out,Struct.H.Turbine_in,Struct.UncTurbineOut_H,Struct.H.Turbine_out,Struct.UncTurbineOut_H);
end

function Struct = setUTurbineEfficiency(Struct)
    Struct.uTurbineEfficiency = uncertaintyMechEff(Struct.turbine_power_out,Struct.uWorkOut,Struct.FluidWork,Struct.uWorkFluid);
end

function Struct = setUCondensorEffectiveness(Struct)
    T_cold_in = Struct.T5;
    T_cold_out = Struct.T4;
    T_hot_in = Struct.T2;
    T_hot_out = Struct.T3;
    Struct.uCondensorEffectiveness = uCondensorEff(T_hot_in,T_hot_out,T_cold_in);
end

function Struct = setUThermalEfficiency(Struct)
    h1 = Struct.H.SuperHeaterOut; 
    h2 = Struct.H.Turbine_out;
    h4 = Struct.H.PumpOut;
    uh1 = Struct.UncSuperHeaterOut_H; 
    uh2 =  Struct.UncTurbineOut_H;
    uh4 = Struct.H.PumpOut;
    Struct.uThermalEff = uThermalEff(h1,uh1,h2,uh2,h4,uh4);
end

function Struct = setUncertainties(Struct)
    Struct = setUWorkOut(Struct);
    Struct = setUWorkFluid(Struct);
    Struct = setUTurbineEfficiency(Struct);
    Struct = setUCondensorEffectiveness(Struct);
    Struct = setUThermalEfficiency(Struct);
end

function Struct = SetAllUncertainties(Struct)
    Struct.NoLoad = setUncertainties(Struct.NoLoad);
    Struct.OneBulb= setUncertainties(Struct.OneBulb);
    Struct.TwoBulb = setUncertainties(Struct.TwoBulb);
    Struct.ThreeBulb = setUncertainties(Struct.ThreeBulb);
    Struct.FourBulb = setUncertainties(Struct.FourBulb);
    Struct.FiveBulb = setUncertainties(Struct.FiveBulb);
    Struct.SixBulb = setUncertainties(Struct.SixBulb);
    Struct.SevenBulb = setUncertainties(Struct.SevenBulb);
    Struct.EightBulb = setUncertainties(Struct.EightBulb);
    Struct.NineBulb = setUncertainties(Struct.NineBulb);
    Struct.TenBulb = setUncertainties(Struct.TenBulb);
end

