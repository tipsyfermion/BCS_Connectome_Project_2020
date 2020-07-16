% Generates a Class with all required variables
classdef stimulation
    properties
    CorrMbon %Correlation Stereotypy in MBON responses
    CorrKC %Correlation Stereotypy in total KC responses
    CorrKCi %Correlation Stereotypy in individual KC responses
    PredMbon %PRED stereotypy in MBON responses
    PredKC %PRED stereotypy in total KC responses
    PN % Response of PN neurons
    KC1 % Response of KC neurons of individual 1 
    MBON1 % Response of MBON neuron of individual 1
    KC2 % Response of KC neurons of individual 2
    MBON2 % Response of MBON neuron of individual 2
    end
    
    methods
        function obj = stimulation()
            % initialize variables
            CorrMbon = zeros(100,1);
            CorrKci = zeros(2000,100);
            CorrKct = zeros(100,1);
            PredMbon = zeros(4950,100);
            PredKct = zeros(4950,100);
            % Comb contains all the possible combinations of a pair of
            % odors
            Comb = combnk(1:100,2);
            
            obj.PN = zeros(50,100,100);
            obj.KC1 = zeros(2000,100,100);
            obj.MBON1 = zeros(100,100);
            obj.KC2 = zeros(2000,100,100);
            obj.MBON2 = zeros(100,100);
            
            % Runs for 100 iterations
            
            for i = 1:100
                % PN spikes of 50 neurons for 100 odors
            PN = PN_Spikes(50,100);
            [PN_KC1,KC_MBON1] = Connection_Matrix(50,2000,1,0.14);
            [PN_KC2,KC_MBON2] = Connection_Matrix(50,2000,1,0.14);
            KC1 = max(0,PN'*PN_KC1-119); % KC response of 1st id
            KC2 = max(0,PN'*PN_KC2-119); % KC response of 2nd id
            MBON1 = max(0,KC1*KC_MBON1-119); % MBON response of 1st id
            MBON2 = max(0,KC2*KC_MBON2-119); % MBON response of 2nd id
            
            % Including all responses for this iteration into main
            % properties
            obj.PN(:,:,i) = PN;
            
            obj.KC1(:,:,i) = KC1';
            obj.MBON1(i,:) = MBON1';
            
            obj.KC2(:,:,i) = KC2';
            obj.MBON2(i,:) = MBON2';
            
            % Correlation Stereotypy in MBON response
            CorrM = corrcoef(MBON1,MBON2);
            CorrMbon(i,1) = CorrM(1,2);
            % Correlation Stereotypy in total KC response
            CorrKt = corrcoef(sum(KC1,2),sum(KC2,2));
            CorrKct(i,1) = CorrKt(1,2);
            
            
            PredM = zeros(4950,1);
            PredKt = zeros(4950,1);
            % sum of KC responses for 100 odors
            SK1 = sum(KC1,2);
            SK2 = sum(KC2,2);
            
            for j = 1:4950
                o1 = Comb(j,1);
                o2 = Comb(j,2);
                am1 = MBON1(o1,1);
                am2 = MBON1(o2,1);
                bm1 = MBON2(o1,1);
                bm2 = MBON2(o2,1);
                ak1 = SK1(o1,1);
                ak2 = SK1(o2,1);
                bk1 = SK2(o1,1);
                bk2 = SK2(o2,1);
                
                % PRED stereotypy in MBON response
                PredM(j,1) = PRED(am1,am2,bm1,bm2);
                
                % PRED stereotypy in total KC response
                PredKt(j,1) = PRED(ak1,ak2,bk1,bk2);
            end
            
            % Correlation stereotypy in individual KC response
            CorrKi = zeros(2000,1);
            for it = 1:2000
                c = corrcoef(KC1(:,it),KC2(:,it));
                CorrKi(it,1) = c(1,2);
            end
            % including variable into function variables
            CorrKci(:,i) = CorrKi;
            PredMbon(:,i) = PredM;
            PredKct(:,i) = PredKt;
            end
            
            % Converting function variables into properties
            obj.CorrKC = CorrKct;
            obj.CorrMbon = CorrMbon;
            obj.PredKC = PredKct;
            obj.PredMbon = PredMbon;
            obj.CorrKCi = CorrKci; 
        end
    end
end