'Multiple network properties overcome random connectivity to enable stereotypic sensory responses' (Mittal et.al).

This code is an attempt to replicate the first few results of the above paper, especially fig 2.
>> "We show that stereotypy is a natural consequence of convergence following random connectivity and does not require learning."

## Settings for the simulations.

The following are called simultaneously for two individuals A and B.

The neural network considered 50 PNs as the input layer, 2000 KCs as the hidden layer and 1 MBON as the output layer for each individual. The simulation was run for 100 different odors in each individual.

PN response vectors varied with the odor but not with the individual, while PN-KC connection matrices varied with the individual but not with the odor. 
Each network simulation was performed 100 times with different initializations of the random number generator.

## Workflow with the DriverLiveScript

* **Generate the PN, KC and MBON responses for both the individuals for 100 odors and run the whole simulation 100 times.**

1. function [PN_KC_matrix] = pn_kc_matrix(no_of_PN,no_of_KC,seed)
2. function [KC_MBON_matrix] = kc_mbon_matrix(no_of_KC)
3. function [PN_spikes] = pn_spikes(no_of_PN,seed)
4. function [KC_spikes] = kc_spikes(PN_KC_matrix,PN_spikes)
5. function [MBON_spikes] = mbon_spikes(KC_MBON_matrix,KC_spikes)

* **Calculate the correlation and PRED stereotypy for the MBON responses - Fig. 2b** <br/>
*Also plot Fig 2c. Correlation vs PRED for MBON response*

6. function [correlation] = correlation(MBON_spikesA,MBON_spikesB)
7. function [stereotypy] = pairstereotypy(response)
8. function [PREDstereotypy] = stereotypy(MBON_spikesA, MBON_spikesB)

* **Calculate the correlation and PRED stereotypy for INDIVIDUAL KC responses - Fig. 2d (top)**

9. function [KC_correlation] = kc_correlation(kca,kcb)
10. function [KC_indPREDstereotypy] = kc_indpred(kca,kcb)

* **Calculate the correlation and PRED stereotypy for TOTAL KC responses - Fig. 2d (bottom)**

11. function [KC_totcor] = kc_totcor(kca,kcb)
12. function [KCtotalPREDstereotypy] = kc_totpred(kca,kcb)

* **Plot Fig. 2 using gramm plotting package**

13. Rest of the DriverLiveScript

[The results obtained are summarised here.](https://docs.google.com/document/d/1WbwENa35t6MtyO3GmkG5NoFRpyZtUH1sqi_HH09mQ0k/edit?usp=sharing)
