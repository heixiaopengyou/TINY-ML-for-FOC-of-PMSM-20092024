%% Load data from SImulink
data = out.simout.signals.values;
Ts = 3.3333e-5; % Sampling time
num_samples = size(data, 1); % Number of samples
time = (0:num_samples-1) * Ts; % Time axis in seconds
% Assign Variables
ref_quad_volt = data(:, 8); % PI predicted voltage with overshoot
V_q = ref_quad_volt;
%% Generate a corrective signal for the Quadrature Voltage
value1_start = single(0); value1_end = single(0.700194); % 0.3 - 0.4
value2_start = single(0.920464); value2_end = single(0.850579); % 0.4 - 0.5
value3_start = single(0.775237); value3_end = single(0.25044); % 0.5 - 0.6
value4_start = single(0.317284); value4_end = single(0.598162); % 0.6 - 0.7
value5_start = single(0.546422); value5_end = single(0.0726063); % 0.7 - 0.8
value6_start = single(0.254013); value6_end = single(0.855063); % 0.8 - 1.0
value7_start = single(0.805863); value7_end = single(0.660859); % 1.0 - 1.1
value8_start = single(0.677215); value8_end = single(0.73101); % 1.1 - 1.2
value9_start = single(0.746531); value9_end = single(0.837244); % 1.2 - 1.3
value10_start = single(0.808084); value10_end = single(0.567826); % 1.3 - 1.4
value11_start = single(0.504341); value11_end = single(0.391322); % 1.4 - 1.5
value12_start = single(0.316022); value12_end = single(0.16846); % 1.5 - 1.6
value13_start = single(0.299008); value13_end = single(0.852818); % 1.6 - 1.7
value14_start = single(0.813408); value14_end = single(0.770048); % 1.7 - 1.8 *
value15_start = single(0.767069); value15_end = single(0.56822); % 1.8 - 1.9
value16_start = single(0.576771); value16_end = single(0.840916); % 1.9 - 2.0
value17_start = single(0.79064); value17_end = single(0.287489); % 2.0 - 2.1
value18_start = single(0.356936); value18_end = single(0.630575); % 2.1 - 2.2
value19_start = single(0.667778); value19_end = single(0.799456); % 2.2 - 2.3
value20_start = single(0.778921); value20_end = single(0.694069); % 2.3 - 2.4
value21_start = single(0.710773); value21_end = single(0.834645); % 2.4 - 2.5 
value22_start = single(0); value22_end = single(0); % 2.5 - 2.6
value23_start = single(0.106982); value23_end = single(0.594791); % 2.6 - 2.7
value24_start = single(0); value24_end = single(0); % 2.7 - 2.8
value25_start = single(0.109588); value25_end = single(0.85411); % 2.8 - 2.9
value26_start = single(0.78151); value26_end = single(0.25521); % 2.9 - 3.0
value27_start = single(0.310053); value27_end = single(0.558905); % 3.0 - 3.1
value28_start = single(0.580091); value28_end = single(0.709457); % 3.1 - 3.2
value29_start = single(0.672289); value29_end = single(0.47923); % 3.2 - 3.3
value30_start = single(0.529834); value30_end = single(0.776001); % 3.3 - 3.4
value31_start = single(0.758933); value31_end = single(0.670065); % 3.4 - 3.5
value32_start = single(0.649553); value32_end = single(0.537427); % 3.5 - 3.6
value33_start = single(0.57533); value33_end = single(0.760708); % 3.6 - 3.7
value34_start = single(0.804955); value34_end = single(0.838386); % 3.7 - 3.8
value35_start = single(0.785826); value35_end = single(0.390263); % 3.8 - 3.9
value36_start = single(0.453788); value36_end = single(0.686854); % 3.9 - 4.0
value37_start = single(0.717331); value37_end = single(0.764399); % 4.0 - 4.1
value38_start = single(0.769895); value38_end = single(0.784935); % 4.1 - 4.2
value39_start = single(0.763063); value39_end = single(0.669764); % 4.2 - 4.3
value40_start = single(0.685742); value40_end = single(0.771193); % 4.3 - 4.4
value41_start = single(0.766954); value41_end = single(0.747479); % 4.4 - 4.5
value42_start = single(0.731005); value42_end = single(0.612552); % 4.5 - 4.6
value43_start = single(0.547806); value43_end = single(0.258536); % 4.6 - 4.7
value44_start = single(0.175063); value44_end = single(0.139951); % 4.7 - 4.8
value45_start = single(0.262538); value45_end = single(0.761474); % 4.8 - 4.9
value46_start = single(0.701716); value46_end = single(0.40463); % 4.9 - 5.0
value47_start = single(0.442837); value47_end = single(0.595655); % 5.0 - 5.1
value48_start = single(0.554177); value48_end = single(0.40044); % 5.1 - 5.2
value49_start = single(0.444354); value49_end = single(0.675788); % 5.2 - 5.3
value50_start = single(0.73187); value50_end = single(0.804128); % 5.3 - 5.4
value51_start = single(0.755241); value51_end = single(0.457351); % 5.4 - 5.5
value52_start = single(0.524283); value52_end = single(0.78063); % 5.5 - 5.6
value53_start = single(0.822295); value53_end = single(0.834831); % 5.6 - 5.7
value54_start = single(0); value54_end = single(0); % 5.7 - 5.8
value55_start = single(0.139784); value55_end = single(0.71188); % 5.8 - 5.9
value56_start = single(0.667546); value56_end = single(0.379964); % 5.9 - 6.0
value57_start = single(0.448778); value57_end = single(0.80993); % 6.0 - 6.1
value58_start = single(0.817); value58_end = single(0.840448); % 6.1 - 6.2
value59_start = single(0.807053); value59_end = single(0.639108); % 6.2 - 6.3
value60_start = single(0.670633); value60_end = single(0.836085); % 6.3 - 6.4
value61_start = single(0.773617); value61_end = single(0.328581); % 6.4 - 6.5
value62_start = single(0.405506); value62_end = single(0.745857); % 6.5 - 6.6
value63_start = single(0.712476); value63_end = single(0.494374); % 6.6 - 6.7
value64_start = single(0.517563); value64_end = single(0.671308); % 6.7 - 6.8
value65_start = single(0.701485); value65_end = single(0.835978); % 6.8 - 6.9
value66_start = single(0.81663); value66_end = single(0.589625); % 6.9 - 7.0
value67_start = single(0.543199); value67_end = single(0.532931); % 7.0 - 7.1
value68_start = single(0.576553); value68_end = single(0.764608); % 7.1 - 7.2
value69_start = single(0.749419); value69_end = single(0.67053); % 7.2 - 7.3
value70_start = single(0.67053); value70_end = single(0.0981894); % 7.3 - 7.4
value71_start = single(0.26716); value71_end = single(0.775681); % 7.4 - 7.5 
value72_start = single(0.70595); value72_end = single(0.547383); % 7.5 - 7.6 %
value73_start = single(0.566815); value73_end = single(0.769923); % 7.6 - 7.8 %
value74_start = single(0.705114); value74_end = single(0.238654); % 7.8 - 7.9 %
value75_start = single(0.328137); value75_end = single(0.616095); % 7.9 - 8.0 %
value76_start = single(0.666575); value76_end = single(0.740829); % 8.0 - 8.1 %
value77_start = single(0.70052); value77_end = single(0.530564); % 8.1 - 8.2 %
value78_start = single(0.563368); value78_end = single(0.735482); % 8.2 - 8.3 %
value79_start = single(0.663043); value79_end = single(0.113979); % 8.3 - 8.4 %
value80_start = single(0.197571); value80_end = single(0.51835); % 8.4 - 8.5 %
value81_start = single(0.491124); value81_end = single(0.442943); % 8.5 - 8.6 %
value82_start = single(0.9099); value82_end = single(0.843337); % 8.6 - 8.7 %
value83_start = single(0.799687); value83_end = single(0.593406); % 8.7 - 8.8 %
value84_start = single(0.605117); value84_end = single(0.64039); % 8.8 - 8.9 %
value85_start = single(0.663941); value85_end = single(0.694523); % 8.9 - 9.0 %
value86_start = single(0.637143); value86_end = single(0.247804); % 9.0 - 9.1 %
value87_start = single(0.570354); value87_end = single(0.84443); % 9.1 - 9.2 %
value88_start = single(0.807226); value88_end = single(0.769197); % 9.2 - 9.3 %
value89_start = single(0.752535); value89_end = single(0.594752); % 9.3 - 9.4 %
value90_start = single(0.510479); value90_end = single(0.320155); % 9.4 - 9.5 %
value91_start = single(0.390271); value91_end = single(0.67793); % 9.5 - 9.6 %
value92_start = single(0.603093); value92_end = single(0.167187); % 9.6 - 9.7 %
value93_start = single(); value93_end = single(); % 9.7 - 9.7 %
value94_start = single(); value94_end = single(); % 9.8 - 9.9 %
value95_start = single(); value95_end = single(); % 9.9 - 10.0 %
%% Update V_q based on the specified time intervals
V_q(time >= t1_start & time < t1_end) = value1;
V_q(time >= t2_start & time < t2_end) = value2;
V_q(time >= t3_start & time < t3_end) = value3;
V_q(time >= t4_start & time < t4_end) = value4;
V_q(time >= t5_start & time < t5_end) = value5;
V_q(time >= t6_start & time < t6_end) = value6;
V_q(time >= t7_start & time < t7_end) = value7;
V_q(time >= t8_start & time < t8_end) = value8;
V_q(time >= t9_start & time < t9_end) = value9;
V_q(time >= t10_start & time < t10_end) = value10;
V_q(time >= t11_start & time < t11_end) = value11;
V_q(time >= t12_start & time < t12_end) = value12;
V_q(time >= t13_start & time < t13_end) = value13; 
%% Get the Error vector by subtraccting the Reference (PI) Voltage with the corrected voltage Vq
Error_vector = V_q - ref_quad_volt;
