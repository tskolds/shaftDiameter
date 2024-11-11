% shaftDiameter.m
% Timothy Skolds
% Created 11/8/24
% Edited 11/10/24
% Script for solving for diameters of shaft sections

clc
clear
close all

%% Input Values
n = input("Factor of Safety: ");
Se = input("Endurance Limit: ");
Kf = input("Bending Stress Concentration Factor: ");
Ma = input("Moment Amplitude: ");
Kfs = input("Torsional Stress Concentration Factor: ");
Mm = input("Mean Moment: ");
Ta = input("Torsion Amplitude: ");
Tm = input("Mean Torsion: ");
Sut = input("Tensile Strength: ");

%% Iterate for Diameter
i = 0; %Iteration counter
d0 = input("Initial Guess for d: ");

while true %Will iterate until value converges
    d = ((16 * n / pi) * ((1 / Se) * sqrt(4 * (Kf * Ma)^2 + 3 * (Kfs * Ta)^2) + ...
    (1 / Sut) * sqrt(4 * (Kf * Mm)^2 + 3 * (Kfs * Tm)^2)))^(1/3);
    dd = abs(d - d0); %Compare calculated value to the guessed value

    if dd > 0.01
        q = input("Would you like to alter K values?: ", 's');

        if q == "Y"
            d
            Kf = input("New Kf: ");
            Kfs = input("New Kfs: ");
        end
    else
        i = i + 1;
        break
    end

    d0 = d; %Update d0 with calculated value
    i = i + 1; %Update iteration counter

end

fprintf('The diameter is %.2f after %d iterations \n',d,i)
