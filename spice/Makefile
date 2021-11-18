
plt=python3 ../../py/plot.py

pixSens:
	${MAKE} ngspice	 TB=pixelSensor_tb

Sens:
	${MAKE} ngspice	 TB=sensor_tb

Comp:
	${MAKE} ngspice	 TB=comp_tb	
	
Inv:
	${MAKE} ngspice	 TB=inv_tb	
	
test:
	${MAKE} ngspice	 TB=test_tb	

ngspice:
	ngspice -a ${TB}.cir
