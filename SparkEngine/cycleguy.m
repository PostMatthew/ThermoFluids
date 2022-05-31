
function onecycle = cycleguy(ExperimentStruct)

% ExperimentStruct.crank_angle = data(:,1); % degrees
% ExperimentStruct.voltage = data(:,2); % Volts
% ExperimentStruct.torque = mean(data(:,3)*1.35582); % Newton-meters
% ExperimentStruct.RPM = mean(data(:,4));
z = zeros(size(ExperimentStruct.crank_angle));
for i=2:length(ExperimentStruct.crank_angle)-1
    
    if ((ExperimentStruct.crank_angle(i))==0&&(ExperimentStruct.crank_angle(i-1)~=0))
        z(i-1)=1;
    end
end
q = find(z);
onecycle.crank_angle = ExperimentStruct.crank_angle(q(3):q(5));
onecycle.voltage = ExperimentStruct.voltage(q(3):q(5));
end
