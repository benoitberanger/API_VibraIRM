clear
clc


%% Initialize the communication
% This part is mandatory

vb = FTDI_VIBRA_IRM(); % Instantiate the object
vb.Open ();            % Open connection
vb.Setup();            % Setup specific parameters of the FTDI chip so TechnoConcept protocol can be used


%% Open/Close valves
% Open successively each valve at 100%, then close.
% The pause give us some time to hear the "clic", because the execution of
% the command (start/stop) is fast : 2-3ms on my computer

vb.SetValue([100 100 100 100]);

for valve = 1 : 4
    
    tic, vb.Start( valve ); toc
    fprintf('Valve %d opened \n', valve)
    pause(0.5)
    
    tic, vb.Stop ( valve ); toc,
    fprintf('Valve %d closed \n', valve)
    pause(0.5)
    
end


%% Open gradually a valve

% WARNING : for real behavior recording, please use accurate clock functions,
% such as WaitSecs in Psychtooblox.
% Matlab pause() function is not enough accurate.

valve_opening_000 = 40; % 40% is the highest value when the valve remains opened
valve_opening_100 = 80; % 80% is the lowest value to have the valve fully opened<

ramp_time = 5.000; % seconds
step_time = 0.100; % seconds

opening_vect = round( linspace(valve_opening_000, valve_opening_100, round(ramp_time/step_time)) );

for valve = 1 : 4
    
    tic
    for idx = 1 : length(opening_vect)
        vb.Start(valve, opening_vect(idx));
        pause(step_time);
    end
    vb.Stop ( valve );
    toc
    
end


%% Cleanup

% Close all valves
vb.StopAll();

% Close connection and delete object
vb.Close();
delete(vb)
clear('vb')
