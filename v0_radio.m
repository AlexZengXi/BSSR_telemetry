classdef v0_radio < matlab.apps.AppBase & handle
    
    properties (Access = public)                                 
        new_table
        jtable
        % telemetry
        optimalTable = [];
        %% serial port variables
        comone = [];
        comtwo = [];
        %% packet contruction variables
        escaped = 0;
        started = 0;
        length = 0;
        sender = 0;
        sequence = 0;
        dataid = 0;
        data = 0;
        crc = 0;
        complete = 0;
        corrupt = 0;
        packet = [];
        contents = [];              
        %% data variables
        % ------- sender id not used ------- %      
        % sender_id_not_used
        sender_id_not_used = 0;
        % ------- solar cell ------- %        
        % insolation
        solar_cell_insolation = 0;  
        % ------- gps ------- %        
        % gps_location
        car_latitude = 0;
        car_longitude = 0;        
        % ------- bbmb ------- %        
        % bbmb_bus_metrics        
        bbmb_bus_metrics_voltage = 0;
        bbmb_bus_metrics_current = 0;
        % bbmb_relay_states
        bbmb_relay_states_battery_health_state = 0;
        bbmb_relay_states_battery_relay_state = 0;
        bbmb_relay_states_array_relay_state = 0;
        % bbmb_text_string
        bbmb_text_string_byte_stream = 0;   
        % bbmb_lp_bus_metrics
        bbmb_lp_bus_metrics_voltage = 0;
        bbmb_lp_bus_metrics_current = 0;
        % bbmb_sample
        bbmb_sample_1 = 0;
        bbmb_sample_2 = 0;
        % bbmb_heartbeat
        bbmb_heartbeat_toggle = 0;        
        % ------- pptmb ------- %        
        % pptmb_bus_metrics        
        pptmb_bus_metrics_voltage = 0;
        pptmb_bus_metrics_current = 0;
        % pptmb_ppt_metrics
        pptmb_ppt_metrics_voltage_0 = 0;
        pptmb_ppt_metrics_voltage_1 = 0;
        pptmb_ppt_metrics_voltage_2 = 0;
        pptmb_ppt_metrics_current_0 = 0;
        pptmb_ppt_metrics_current_1 = 0;
        pptmb_ppt_metrics_current_2 = 0;
        % pptmb_relay_states
        pptmb_relay_states_battery_health_state = 0;
        pptmb_relay_states_battery_relay_state = 0;
        pptmb_relay_states_array_relay_state = 0;
        % pptmb_text_string
        pptmb_text_string_byte_stream = 0;
        % pptmb_heartbeat
        pptmb_heartbeat_toggle = 0;        
        % ------- mcmb ------- %        
        % mcmb_bus_metrics        
        mcmb_bus_metrics_voltage = 0;
        mcmb_bus_metrics_current = 0;
        % mcmb_car_speed
        mcmb_car_speed_car_speed = 0;
        % mcmb_motor_temperature
        mcmb_motor_temperature_temperature = 0;
        % mcmb_supp_battery_metrics
        mcmb_supp_battery_metrics_voltage = 0;
        % mcmb_text_string
        mcmb_text_string_byte_stream = 0;
        % mcmb_heartbeat
        mcmb_heartbeat_toggle = 0;        
        % ------- dcmb ------- %
        % dcmb_steering_wheel
        dcmb_steering_wheel_data_1_acc8 = 0;
        dcmb_steering_wheel_data_1_acc7 = 0;
        dcmb_steering_wheel_data_1_acc6 = 0;
        dcmb_steering_wheel_data_1_acc5 = 0;
        dcmb_steering_wheel_data_1_acc4 = 0;
        dcmb_steering_wheel_data_1_acc3 = 0;
        dcmb_steering_wheel_data_1_acc2 = 0;
        dcmb_steering_wheel_data_1_acc1 = 0;
        dcmb_steering_wheel_data_2_cruise = 0;
        dcmb_steering_wheel_data_2_horn = 0;
        dcmb_steering_wheel_data_2_radio = 0;
        dcmb_steering_wheel_data_2_right_indicator = 0;
        dcmb_steering_wheel_data_2_left_indicator= 0;
        dcmb_steering_wheel_data_3_select = 0;
        dcmb_steering_wheel_data_3_right = 0;
        dcmb_steering_wheel_data_3_left = 0;
        dcmb_steering_wheel_data_3_down = 0;
        dcmb_steering_wheel_data_3_up = 0;       
        % dcmb_motor_control_state
        dcmb_motor_control_state_motor_state = 0;
        dcmb_motor_control_state_5_digital_buttons = 0;
        dcmb_motor_control_state_target_power = 0;
        dcmb_motor_control_state_target_speed = 0;
        % dcmb_relay_states
        dcmb_relay_states_battery_health_state = 0;
        ddcmb_relay_states_battery_relay_state = 0;
        dcmb_relay_states_array_relay_state = 0;
        % dcmb_pedals_angle
        dcmb_pedals_angle_acc_pedal_angle = 0;
        dcmb_pedals_angle_regen_pedal_angle = 0;
        % dcmb_side_panel
        dcmb_side_panel_data_ignition = 0;
        dcmb_side_panel_data_camera = 0;
        dcmb_side_panel_data_fwd_rev = 0;
        dcmb_side_panel_data_fan = 0;
        dcmb_side_panel_data_aux_2 = 0;
        dcmb_side_panel_data_aux_1 = 0;
        dcmb_side_panel_data_aux_0 = 0;
        dcmb_side_panel_data_array = 0;
        % dcmb_text_string
        dcmb_text_string_byte_stream = 0;
        % dcmb_heartbeat
        dcmb_heartbeat_toggle = 0;        
        % ------- bms ------- %        
        % bms_cell_temperature
        bms_cell_temperature_module_id = 0;
        bms_cell_temperature_temp_0 = 0;
        bms_cell_temperature_temp_1 = 0;
        bms_cell_temperature_temp_2 = 0;
        bms_cell_temperature_temp_3 = 0;
        bms_cell_temperature_temp_4 = 0;  
        % bms_cell_voltage
        bms_cell_voltage_module_id = 0;
        bms_cell_voltage_voltage_0 = 0;
        bms_cell_voltage_voltage_1 = 0;
        bms_cell_voltage_voltage_2 = 0;
        bms_cell_voltage_voltage_3 = 0;
        bms_cell_voltage_voltage_4 = 0;            
        % bms_cell_state_of_charge
        bms_cell_state_of_charge_module_id = 0;
        bms_cell_state_of_charge_battery_soc_group_0 = 0;
        bms_cell_state_of_charge_battery_soc_group_1 = 0;
        bms_cell_state_of_charge_battery_soc_group_2 = 0;
        bms_cell_state_of_charge_battery_soc_group_3 = 0;
        bms_cell_state_of_charge_battery_soc_group_4 = 0;
        % bms_text_string
        bms_text_string_byte_stream = 0;
        %% telemetry state variables
        telpackets = cell(10000,2);        
        teldata = {};
        packetCount = 0;
        csvCount = 0;        
    end   
    
    methods (Access = private)                      
        function createComponents(app)  
            columnNames = {' ', 'BBMB', ' ', 'PPTMB', ' ', 'MCMB', ' ', 'DCMB', ' ', 'BMS'};
            
           app.new_table = uitable('v0', {'bus_metrics_voltage', 0, 'bus_metrics_voltage', 0, 'bus_metrics_voltage', 0, 'steering_wheel_data_1_acc8', 0, 'cell_temp_module_id', 0; ...
                                                    'bus_metrics_current', 0, 'bus_metrics_current', 0, 'bus_metrics_current', 0, 'steering_wheel_data_1_acc7', 0, 'cell_temp_0', 0; ...
                                                    'bbmb_sample_1', 0, 'ppt_metrics_volt_0', 0, 'car_speed', 0, 'steering_wheel_data_1_acc6', 0, 'cell_temp_1', 0; ...
                                                    'bbmb_sample_2', 0, 'ppt_metrics_volt_1', 0, 'motor_temperature', 0, 'steering_wheel_data_1_acc5', 0, 'cell_temp_2', 0; ...
                                                    'relay_states_battery_health_state', 0, 'ppt_metrics_volt_2', 0, 'supp_battery_metrics_voltage', 0, 'steering_wheel_data_1_acc4', 0, 'cell_temp_3', 0; ...
                                                    'relay_states_battery_relay_state', 0, 'ppt_metrics_current_0', 0, 'text_string', 0, 'steering_wheel_data_1_acc3', 0, 'cell_temp_4', 0; ...
                                                    'relay_states_array_relay_state', 0, 'ppt_metrics_current_1', 0, 'heartbeat', 0, 'steering_wheel_data_1_acc2', 0, 'cell_voltage_module_id', 0; ...
                                                    'text_string', 0, 'ppt_metrics_current_2', 0, ' ', ' ', 'steering_wheel_data_1_acc1', 0, 'cell_voltage_0', 0; ...
                                                    'lp_bus_metrics_voltage', 0, 'relay_states_battery_health_state', 0, ' ', ' ', 'steering_wheel_data_2_cruise', 0, 'cell_voltage_1', 0; ...
                                                    'lp_bus_metrics_current', 0, 'relay_states_battery_relay_state', 0, ' ', ' ', 'steering_wheel_data_2_horn', 0, 'cell_voltage_2', 0; ...
                                                    'heartbeat', 0, 'relay_states_array_relay_state', 0, ' ', ' ', 'steering_wheel_data_2_radio', 0, 'cell_voltage_3', 0; ...
                                                    ' ', ' ', 'text_string', 0, ' ', ' ', 'steering_wheel_data_2_right_indicator', 0, 'cell_voltage_4', 0; ...
                                                    ' ', ' ', 'heartbeat', 0, ' ', ' ', 'steering_wheel_data_2_left_indicator', 0, 'soc_module_id', 0; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'steering_wheel_data_3_select', 0, 'soc_group_0', 0; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'steering_wheel_data_3_right', 0, 'soc_group_1', 0; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'steering_wheel_data_3_left', 0, 'soc_group_2', 0; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'steering_wheel_data_3_down', 0, 'soc_group_3', 0; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'steering_wheel_data_3_up', 0, 'soc_group_4', 0; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'motor_control_state_motor_state', 0, 'text_string', 0; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'motor_control_state_5_digital_buttons', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'motor_control_state_target_power', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'motor_control_state_target_speed', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'relay_states_battery_health_state', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'relay_states_battery_relay_state', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'relay_states_array_relay_state', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'pedals_angle_acc_pedal_angle', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'pedals_angle_regen_pedal_angle', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_ignition', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_camera', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_fwd_rev', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_fan', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_aux_2', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_aux_1', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_aux_0', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'side_panel_array', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'text_string', 0, ' ', ' '; ...
                                                    ' ', ' ', ' ', ' ', ' ', ' ', 'heartbeat', 0, ' ', ' '}, columnNames);
            % The java jtable object
            app.jtable = app.new_table.getTable;
            
            % Allow table to resize with app window
            set(app.new_table, 'Units', 'Normalized')
            set(app.new_table, 'Position', [0.05 0 1 1])
            
            % Adjust column size
            app.jtable.getColumnModel().getColumn(0).setPreferredWidth(250);
            app.jtable.getColumnModel().getColumn(2).setPreferredWidth(250);
            app.jtable.getColumnModel().getColumn(4).setPreferredWidth(250);
            app.jtable.getColumnModel().getColumn(6).setPreferredWidth(275);
            app.jtable.getColumnModel().getColumn(8).setPreferredWidth(250);

        end
    end   
    methods (Access = public)                       
        % dashboard
        function app = v0_radio                        
            % Create UIFigure and components
            createComponents(app)
        end        
        function delete(app)                        

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
        % telemetry
        function app = startcomone(app)             
            app.comone = serialport("/dev/cu.usbserial-110",115200,"Timeout",1000000);
        end 
        function app = startcomtwo(app)             
            app.comtwo = serialport("COM4",115200,"Timeout",1000000);
        end
        function app = writecomtwo(app)             
            % loop variables
            load('C:\Users\Ayman\Desktop\stratapp\files\pktsdec.mat');            
            % main loop
            for i = 104:size(pktsdec,2)/4
                write(app.comtwo,pktsdec(i),"uint8");
            end
        end        
        function app = readcomone(app)              
%             flush(app.comone);
%             flush(app.comtwo);
            t1 = datevec(now);

            starttime = strrep(strrep(strrep(datestr(now),'-','_'),':','_'),' ','_');
            while 1
                % read byte
                byte = read(app.comone,1,"uint8");    
                % disp byte
                disp(app.comone.NumBytesAvailable);                
                % escaped byte
                if byte == 0x5a && app.escaped ~= 1
                    app.escaped = 1;                    
                % started byte
                elseif byte == 0xa5 && app.started ~= 1 && app.escaped ~= 1
                    app.started = 1;
                    app.packet = [app.packet,byte]; %#ok<*AGROW>                    
                % length byte
                elseif app.started && ~app.length
                    if app.escaped
                        app.escaped = 0;
                        app.length = 1;
                        payloadlength = byte;
                        app.packet = [app.packet,byte];
                    else
                        app.length = 1;
                        payloadlength = byte;
                        app.packet = [app.packet,byte];
                    end                    
                % sender byte
                elseif app.started && app.length && ~app.sender
                    if app.escaped
                        app.escaped = 0;
                        app.sender = 1;
                        app.packet = [app.packet,byte];
                    else
                        app.sender = 1;
                        app.packet = [app.packet,byte];
                    end                    
                % sequence byte
                elseif app.started && app.length && app.sender && ~app.sequence
                    if app.escaped
                        app.escaped = 0;
                        app.sequence = 1;
                        app.packet = [app.packet,byte];
                    else
                        app.sequence = 1;
                        app.packet = [app.packet,byte];
                    end                    
                % dataid byte
                elseif app.started && app.length && app.sender && app.sequence && ~app.dataid
                    if app.escaped
                        app.escaped = 0;
                        app.dataid = 1;
                        payloadlength = payloadlength - 1;
                        app.packet = [app.packet,byte];
                        app.contents = [app.contents,byte];
                    else
                        app.dataid = 1;
                        payloadlength = payloadlength - 1;
                        app.packet = [app.packet,byte];
                        app.contents = [app.contents,byte];
                    end                    
                % data bytes
                elseif app.started && app.length && app.sender && app.sequence && app.dataid && ~app.data
                    % loop counter
                    c = 1;
                    % while loop
                    while c <= payloadlength
                        % escaped byte
                        if byte == 0x5a && app.escaped ~= 1
                            app.escaped = 1;
                        elseif app.escaped
                            app.escaped = 0;
                            app.packet = [app.packet,byte];
                            app.contents = [app.contents,byte];
                            c = c +1;
                            %pause(0.2);
                        else
                            app.packet = [app.packet,byte];
                            app.contents = [app.contents,byte];
                            c = c + 1;
                            %pause(0.2);
                        end
                        if c <= payloadlength
                            % read byte from payload
                            byte = read(app.comone,1,"uint8");
                            % show byte
                            %disp(byte);
                        end
                    end
                    payloadlength = 0;
                    app.data = 1;                    
                % crc bytes
                elseif app.started && app.length && app.sender && app.sequence && app.dataid && app.data && ~app.crc
                    app.crc = 1;
                    % loop counter
                    c = 1;
                    % while loop
                    while c <= 4
                        % escaped byte
                        if byte == 0x5a && app.escaped ~= 1
                            app.escaped = 1;
                        elseif app.escaped
                            app.escaped = 0;
                            app.packet = [app.packet,byte];
                            c = c +1;
                            %pause(0.2);
                        else
                            app.packet = [app.packet,byte];
                            c = c + 1;
                            %pause(0.2);
                        end
                        if c <= 4
                            % read byte from payload
                            byte = read(app.comone,1,"uint8");
                            % show byte
                            %disp(byte);
                        end
                    end                    
                    % complete packet
                    if app.started && app.length && app.sender && app.sequence && app.dataid && app.data && app.crc
                        % read byte from payload
                        byte = read(app.comone,1,"uint8");
                        %check if packet is valid
                        if byte == 0xA5
                            % update complete
                            app.complete = 1;
                            % extract data and update gui
                            
                            tic
                            app.extractdata();
                            toc

                            % update packet count 
                            app.packetCount = app.packetCount + 1;
                            % store packet
                            if app.packetCount <= 1000                                
                                app.telpackets{app.packetCount,1} = app.packet;
                                app.telpackets{app.packetCount,2} = datevec(now);
                            else
                                app.csvCount = app.csvCount + 1;
                                writecell(app.telpackets,append(starttime,'_Packets.csv'),'WriteMode','append');
                                app.telpackets = cell(1000,2);
                                app.packetCount = 0;
                            end                        
                            % clear buffer
%                             if app.comone.NumBytesAvailable > 500
%                                 flush(app.comone);
%                                 flush(app.comtwo);
%                             end
                            % 
                            
                            % reset loop variables
                            app.escaped = 0;
                            app.started = 0;                        
                            app.length = 0;
                            app.sender = 0;
                            app.sequence = 0;
                            app.dataid = 0;
                            app.data = 0;
                            app.crc = 0;
                            app.complete = 0;
                            app.corrupt = 0;
                            app.contents = [];
                            app.packet = [];
                            % start new packet 
                            app.started = 1;
                            app.packet = [app.packet,byte]; %#ok<*AGROW> 
                        % packet is corrupt and is ignored
                        else
                            % reset loop variables
                            app.escaped = 0;
                            app.started = 0;                        
                            app.length = 0;
                            app.sender = 0;
                            app.sequence = 0;
                            app.dataid = 0;
                            app.data = 0;
                            app.crc = 0;
                            app.complete = 0;
                            app.corrupt = 0;
                            app.contents = [];
                            app.packet = [];
                        end
                    end
                elseif ~app.started && ~app.length && ~app.sender && ~app.sequence && ~app.dataid && ~app.data && ~app.crc && app.escaped == 1
                    app.escaped = 0;
                end  
            end            
        end
        function app = extractdata(app)             
            if app.complete
                % sender_id_not_used
                if app.packet(3) == 0
                    app.sender_id_not_used = 0;                
                % bbmb
                elseif app.packet(3) == 1 && (app.packet(5) ~= 7 && app.packet(5) ~= 8 && app.packet(5) ~= 9)
                    %disp("BBMB RECIEVED");
                    % bus_metrics
                    if app.contents(1) == 0                        
                        app.bbmb_bus_metrics_voltage = swapbytes(typecast(uint8(app.contents(5:8)),'single'));                        
                        app.jtable.setValueAt(num2str(app.bbmb_bus_metrics_voltage), 0, 1);                        
                        app.bbmb_bus_metrics_current = swapbytes(typecast(uint8(app.contents(9:12)),'single'));   
                        app.jtable.setValueAt(num2str(app.bbmb_bus_metrics_current), 1, 1);    
                    elseif app.contents(1) == 4                        
                        app.bbmb_sample_1 = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.bbmb_sample_1), 2, 1);                          
                        app.bbmb_sample_2 = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.bbmb_sample_2), 3, 1);
                    % bbmb_relay_states
                    elseif app.contents(1) == 6
                        app.bbmb_relay_states_battery_health_state = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        app.jtable.setValueAt(num2str(app.bbmb_relay_states_battery_health_state), 4, 1);                     
                        app.bbmb_relay_states_battery_relay_state = swapbytes(typecast(uint8(app.contents(3)),'uint8'));
                        app.jtable.setValueAt(num2str(app.bbmb_relay_states_battery_relay_state), 5, 1);                       
                        app.bbmb_relay_states_array_relay_state = swapbytes(typecast(uint8(app.contents(4)),'uint8')); 
                        app.jtable.setValueAt(num2str(app.bbmb_relay_states_array_relay_state), 6, 1); 
                    % text_string
                    elseif app.contents(1) == 11                        
                        app.bbmb_text_string_byte_stream = native2unicode(swapbytes(app.contents));
                        app.jtable.setValueAt(num2str(app.bbmb_text_string_byte_stream), 7, 1);
                    % lp_bus_metrics
                    elseif app.contents(1) == 13                        
                        app.bbmb_lp_bus_metrics_voltage = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.bbmb_lp_bus_metrics_voltage), 8, 1);                     
                        app.bbmb_lp_bus_metrics_current = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.bbmb_lp_bus_metrics_current), 9, 1);
                    % heartbeat
                    elseif app.contents(1) == 15
                        app.bbmb_heartbeat_toggle = swapbytes(typecast(uint8(app.contents(2)),'uint8')); 
                        app.jtable.setValueAt(num2str(app.bbmb_heartbeat_toggle), 10, 1);
                    end
                % pptmb   
                elseif app.packet(3) == 2
                    %disp("PPTMB RECIEVED");
                    % bus_metrics
                    if app.contents(1) == 0
                        app.pptmb_bus_metrics_voltage = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.pptmb_bus_metrics_voltage), 0, 3);                  
                        app.pptmb_bus_metrics_current = swapbytes(typecast(uint8(app.contents(9:12)),'single'));                                           
                        app.jtable.setValueAt(num2str(app.pptmb_bus_metrics_voltage), 1, 3);   
                    % ppt_metrics
                    elseif app.contents(1) == 1
                        app.pptmb_ppt_metrics_voltage_0 = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.pptmb_ppt_metrics_voltage_0), 2, 3);                        
                        app.pptmb_ppt_metrics_voltage_1 = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.pptmb_ppt_metrics_voltage_1), 3, 3);                       
                        app.pptmb_ppt_metrics_voltage_2 = swapbytes(typecast(uint8(app.contents(13:16)),'single'));
                        app.jtable.setValueAt(num2str(app.pptmb_ppt_metrics_voltage_2), 4, 3);                      
                        app.pptmb_ppt_metrics_current_0 = swapbytes(typecast(uint8(app.contents(17:20)),'single'));
                        app.jtable.setValueAt(num2str(app.pptmb_ppt_metrics_current_0), 5, 3);                          
                        app.pptmb_ppt_metrics_current_1 = swapbytes(typecast(uint8(app.contents(21:24)),'single'));
                        app.jtable.setValueAt(num2str(app.pptmb_ppt_metrics_current_1), 6, 3);                     
                        app.pptmb_ppt_metrics_current_2 = swapbytes(typecast(uint8(app.contents(25:28)),'single'));                                               
                        app.jtable.setValueAt(num2str(app.pptmb_ppt_metrics_current_2), 7, 3);  
                    % relay_states
                    elseif app.contents(1) == 6
                        app.pptmb_relay_states_battery_health_state = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        app.jtable.setValueAt(num2str(app.pptmb_relay_states_battery_health_state), 8, 3);                      
                        app.pptmb_relay_states_battery_relay_state = swapbytes(typecast(uint8(app.contents(3)),'uint8'));
                        app.jtable.setValueAt(num2str(app.pptmb_relay_states_battery_relay_state), 9, 3);                       
                        app.pptmb_relay_states_array_relay_state = swapbytes(typecast(uint8(app.contents(4)),'uint8')); 
                        app.jtable.setValueAt(num2str(app.pptmb_relay_states_array_relay_state), 10, 3);                  % text_string
                    elseif app.contents(1) == 11                        
                        app.pptmb_text_string_byte_stream = native2unicode(swapbytes(app.contents));
                        app.jtable.setValueAt(num2str(app.pptmb_text_string_byte_stream), 11, 3); 
                    % heartbeat
                    elseif app.contents(1) == 15
                        app.pptmb_heartbeat_toggle = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        app.jtable.setValueAt(num2str(app.pptmb_heartbeat_toggle), 12, 3);
                    end
                % mcmb
                elseif app.packet(3) == 3
                    %disp(app.contents);
                    %disp("MCMB RECIEVED");
                    % bus_metrics
                    if app.contents(1) == 0
                        app.mcmb_bus_metrics_voltage = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.mcmb_bus_metrics_voltage), 0, 5);                        
                        app.mcmb_bus_metrics_current = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.mcmb_bus_metrics_current), 1, 5);
                    % car_speed
                    elseif app.contents(1) == 1
                        app.mcmb_car_speed_car_speed = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        app.jtable.setValueAt(num2str(app.mcmb_car_speed_car_speed), 2, 5);
                    % motor_temperature
                    elseif app.contents(1) == 2
                        app.mcmb_motor_temperature_temperature = swapbytes(typecast(uint8(app.contents(2)),'uint8'));   
                        app.jtable.setValueAt(num2str(app.mcmb_motor_temperature_temperature), 3, 5);
                    % mcmb_supp_battery_metrics
                    elseif app.contents(1) == 3
                        app.mcmb_supp_battery_metrics_voltage = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.mcmb_supp_battery_metrics_voltage), 4, 5);
                    % text_string
                    elseif app.contents(1) == 11                        
                        app.mcmb_text_string_byte_stream = native2unicode(swapbytes(app.contents));
                        app.jtable.setValueAt(num2str(app.mcmb_text_string_byte_stream), 5, 5);
                    % heartbeat
                    elseif app.contents(1) == 15
                        app.mcmb_heartbeat_toggle = swapbytes(typecast(uint8(app.contents(2)),'uint8')); 
                        app.jtable.setValueAt(num2str(app.mcmb_heartbeat_toggle), 6, 5);
                    end
                % dcmb
                elseif app.packet(3) == 4
                    %disp("DCMB RECIEVED");
                    % steering_wheel
                    if app.contents(1) == 4
                        % steering_wheel
                        app.dcmb_steering_wheel_data_1_acc8 = bitget(uint8(app.contents(2)),8);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc8), 0, 7);                 
                        app.dcmb_steering_wheel_data_1_acc7 = bitget(uint8(app.contents(2)),7);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc7), 1, 7);                       
                        app.dcmb_steering_wheel_data_1_acc6 = bitget(uint8(app.contents(2)),6);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc6), 2, 7);                       
                        app.dcmb_steering_wheel_data_1_acc5 = bitget(uint8(app.contents(2)),5);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc5), 3, 7);                       
                        app.dcmb_steering_wheel_data_1_acc4 = bitget(uint8(app.contents(2)),4);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc4), 4, 7);                      
                        app.dcmb_steering_wheel_data_1_acc3 = bitget(uint8(app.contents(2)),3);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc3), 5, 7);                    
                        app.dcmb_steering_wheel_data_1_acc2 = bitget(uint8(app.contents(2)),2);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc2), 6, 7);                     
                        app.dcmb_steering_wheel_data_1_acc1 = bitget(uint8(app.contents(2)),1);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_1_acc1), 7, 7);                     
                        app.dcmb_steering_wheel_data_2_cruise = bitget(uint8(app.contents(3)),5);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_2_cruise), 8, 7);                        
                        app.dcmb_steering_wheel_data_2_horn = bitget(uint8(app.contents(3)),4);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_2_horn), 9, 7);                        
                        app.dcmb_steering_wheel_data_2_radio = bitget(uint8(app.contents(3)),3);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_2_radio), 10, 7);                        
                        app.dcmb_steering_wheel_data_2_right_indicator = bitget(uint8(app.contents(3)),2);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_2_right_indicator), 11, 7);                       
                        app.dcmb_steering_wheel_data_2_left_indicator= bitget(uint8(app.contents(3)),1);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_2_left_indicator), 12, 7);                        
                        app.dcmb_steering_wheel_data_3_select = bitget(uint8(app.contents(4)),5);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_3_select), 13, 7);                         
                        app.dcmb_steering_wheel_data_3_right = bitget(uint8(app.contents(4)),4);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_3_right), 14, 7);                         
                        app.dcmb_steering_wheel_data_3_left = bitget(uint8(app.contents(4)),3);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_3_left), 15, 7);                        
                        app.dcmb_steering_wheel_data_3_down = bitget(uint8(app.contents(4)),2);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_3_down), 16, 7);                  
                        app.dcmb_steering_wheel_data_3_up = bitget(uint8(app.contents(4)),1);
                        app.jtable.setValueAt(num2str(app.dcmb_steering_wheel_data_3_up), 17, 7);   
                    % motor_control_state
                    elseif app.contents(1) == 5                        
                        app.dcmb_motor_control_state_motor_state = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        if app.dcmb_motor_control_state_motor_state == 0
                            app.dcmb_motor_control_state_motor_state = convertStringsToChars("Off");
                        elseif app.dcmb_motor_control_state_motor_state == 1
                            app.dcmb_motor_control_state_motor_state = convertStringsToChars("Pedal");
                        elseif app.dcmb_motor_control_state_motor_state == 2
                            app.dcmb_motor_control_state_motor_state = convertStringsToChars("Cruise");
                        elseif app.dcmb_motor_control_state_motor_state == 3
                            app.dcmb_motor_control_state_motor_state = convertStringsToChars("Regen");
                        elseif app.dcmb_motor_control_state_motor_state == 4
                            app.dcmb_motor_control_state_motor_state = convertStringsToChars("Stand By");
                        end
                        app.jtable.setValueAt(num2str(app.dcmb_motor_control_state_motor_state), 18, 7); 
                        app.dcmb_motor_control_state_5_digital_buttons = swapbytes(typecast(uint8(app.contents(3)),'uint8'));
                        app.jtable.setValueAt(num2str(app.dcmb_motor_control_state_5_digital_buttons), 19, 7);                    
                        app.dcmb_motor_control_state_target_power = swapbytes(typecast(uint8(app.contents(5:6)),'uint16'));
                        app.jtable.setValueAt(num2str(app.dcmb_motor_control_state_target_power), 20, 7);                       
                        app.dcmb_motor_control_state_target_speed = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.dcmb_motor_control_state_target_speed), 21, 7); 
                    % relay_states
                    elseif app.contents(1) == 6
                        app.dcmb_relay_states_battery_health_state = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        app.jtable.setValueAt(num2str(app.dcmb_relay_states_battery_health_state), 22, 7);                       
                        app.ddcmb_relay_states_battery_relay_state = swapbytes(typecast(uint8(app.contents(3)),'uint8'));
                        app.jtable.setValueAt(num2str(app.ddcmb_relay_states_battery_relay_state), 23, 7);                         
                        app.dcmb_relay_states_array_relay_state = swapbytes(typecast(uint8(app.contents(4)),'uint8'));
                        app.jtable.setValueAt(num2str(app.dcmb_relay_states_array_relay_state), 24, 7);
                    % pedals angle
                    elseif app.contents(1) == 7
                        app.dcmb_pedals_angle_acc_pedal_angle = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.dcmb_pedals_angle_acc_pedal_angle), 25, 7);                     
                        app.dcmb_pedals_angle_regen_pedal_angle = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.dcmb_pedals_angle_regen_pedal_angle), 26, 7);
                    % dcmb_side_panel
                    elseif app.contents(1) == 8
                        app.dcmb_side_panel_data_ignition = bitget(uint8(app.contents(2)),8);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_ignition), 27, 7);                   
                        app.dcmb_side_panel_data_camera = bitget(uint8(app.contents(2)),7);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_camera), 28, 7);                        
                        app.dcmb_side_panel_data_fwd_rev = bitget(uint8(app.contents(2)),6);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_fwd_rev), 29, 7);                     
                        app.dcmb_side_panel_data_fan = bitget(uint8(app.contents(2)),5);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_fan), 30, 7);                        
                        app.dcmb_side_panel_data_aux_2 = bitget(uint8(app.contents(2)),4);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_aux_2), 31, 7);                      
                        app.dcmb_side_panel_data_aux_1 = bitget(uint8(app.contents(2)),3);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_aux_1), 32, 7);                      
                        app.dcmb_side_panel_data_aux_0 = bitget(uint8(app.contents(2)),2);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_aux_0), 33, 7);                        
                        app.dcmb_side_panel_data_array = bitget(uint8(app.contents(2)),1);
                        app.jtable.setValueAt(num2str(app.dcmb_side_panel_data_array), 34, 7);
                    % text_string
                    elseif app.contents(1) == 11                        
                        app.dcmb_text_string_byte_stream = native2unicode(swapbytes(app.contents));
                        app.jtable.setValueAt(num2str(app.dcmb_text_string_byte_stream), 35, 7); 
                    % heartbeat
                    elseif app.contents(1) == 15
                        app.dcmb_heartbeat_toggle = swapbytes(typecast(uint8(app.contents(2)),'uint8'));  
                        app.jtable.setValueAt(num2str(app.dcmb_heartbeat_toggle), 36, 7);
                    end
                % bms
                elseif app.packet(3) == 1 && (app.packet(5) == 7 || app.packet(5) == 8 || app.packet(5) == 9) 
                    %disp("BMS RECIEVED");
                    % cell_temperature
                    if app.contents(1) == 7  
                        app.bms_cell_temperature_module_id = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                         app.jtable.setValueAt(num2str(app.bms_cell_temperature_module_id), 0, 9);                       
                        app.bms_cell_temperature_temp_0 = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_temperature_temp_0), 1, 9);                      
                        app.bms_cell_temperature_temp_1 = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_temperature_temp_1), 2, 9);                      
                        app.bms_cell_temperature_temp_2 = swapbytes(typecast(uint8(app.contents(13:16)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_temperature_temp_2), 3, 9);                      
                        app.bms_cell_temperature_temp_3 = swapbytes(typecast(uint8(app.contents(17:20)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_temperature_temp_3), 4, 9);              
                        app.bms_cell_temperature_temp_4 = swapbytes(typecast(uint8(app.contents(21:24)),'single')); 
                        app.jtable.setValueAt(num2str(app.bms_cell_temperature_temp_4), 5, 9);
                    % cell_voltage
                    elseif app.contents(1) == 8
                        app.bms_cell_voltage_module_id = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        app.jtable.setValueAt(num2str(app.bms_cell_voltage_module_id), 6, 9);                      
                        app.bms_cell_voltage_voltage_0 = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_voltage_voltage_0), 7, 9);                      
                        app.bms_cell_voltage_voltage_1 = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_voltage_voltage_1), 8, 9);                        
                        app.bms_cell_voltage_voltage_2 = swapbytes(typecast(uint8(app.contents(13:16)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_voltage_voltage_2), 9, 9);                        
                        app.bms_cell_voltage_voltage_3 = swapbytes(typecast(uint8(app.contents(17:20)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_voltage_voltage_3), 10, 9);                        
                        app.bms_cell_voltage_voltage_4 = swapbytes(typecast(uint8(app.contents(21:24)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_voltage_voltage_4), 11, 9);
                    % state_of_charge
                    elseif app.contents(1) == 9
                        app.bms_cell_state_of_charge_module_id = swapbytes(typecast(uint8(app.contents(2)),'uint8'));
                        app.jtable.setValueAt(num2str(app.bms_cell_state_of_charge_module_id), 12, 9);                      
                        app.bms_cell_state_of_charge_battery_soc_group_0 = swapbytes(typecast(uint8(app.contents(5:8)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_state_of_charge_battery_soc_group_0), 13, 9);                        
                        app.bms_cell_state_of_charge_battery_soc_group_1 = swapbytes(typecast(uint8(app.contents(9:12)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_state_of_charge_battery_soc_group_1), 14, 9);                        
                        app.bms_cell_state_of_charge_battery_soc_group_2 = swapbytes(typecast(uint8(app.contents(13:16)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_state_of_charge_battery_soc_group_2), 15, 9);                      
                        app.bms_cell_state_of_charge_battery_soc_group_3 = swapbytes(typecast(uint8(app.contents(17:20)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_state_of_charge_battery_soc_group_3), 16, 9);                      
                        app.bms_cell_state_of_charge_battery_soc_group_4 = swapbytes(typecast(uint8(app.contents(21:24)),'single'));
                        app.jtable.setValueAt(num2str(app.bms_cell_state_of_charge_battery_soc_group_4), 17, 9);
                    % text_string
                    elseif app.contents(1) == 11                        
                        app.bms_text_string_byte_stream = native2unicode(swapbytes(app.contents));
                        app.jtable.setValueAt(num2str(app.bms_text_string_byte_stream), 18, 9);
                    end                                 
                end
            end            
        end
    end   
end