function [KC_MBON_CONNECTION]=G_KC_MBON(no_KC)
 %Generate connection based on first half of the connections.
    KC_MBON_CONNECTION = [ones(1000,1);zeros(no_KC-1000,1)];
end