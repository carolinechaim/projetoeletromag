antena_receptora =  spiralArchimedean('NumArms',1,'Tilt',90,'TiltAxis','Y','Turns',6,'OuterRadius',0.5,'InnerRadius',0.4);


array = linearArray('Element',antena_receptora,'Element',antena_transmissora)

array.ElementSpacing = 0.3;
show (array)