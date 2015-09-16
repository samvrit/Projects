clc;
clear all;
close all;

l(1) = Link([0 0 0 0]);
l(2) = Link([0 0 0 pi/2]);
l(3) = Link([0 0 0 -pi/2]);
l(4) = Link([0 0.29 0 pi/2]);
l(5) = Link([0 0 0.3 -pi/2]);


r = SerialLink(l, 'name', 'SRL');


r.teach([0 0 0 0 0]);

