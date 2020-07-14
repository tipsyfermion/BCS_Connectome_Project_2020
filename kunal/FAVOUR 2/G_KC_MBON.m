function [KC_MBON_CONNECTION]=G_KC_MBON(no_KC)
    KC_MBON_CONNECTION = [ones(1000,1);zeros(no_KC-1000,1)];
end