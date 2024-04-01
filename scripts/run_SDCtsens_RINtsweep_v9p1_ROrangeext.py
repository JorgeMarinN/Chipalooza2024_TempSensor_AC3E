import subprocess
import sys

###result = subprocess.run(
###    [sys.executable, "-c", "print('ocean')"], capture_output=True, text=True
###)


result1 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_tm40.spice'])
print("stdout:", result1.stdout)
print("stderr:", result1.stderr)


result2 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_tm25.spice'])
print("stdout:", result2.stdout)
print("stderr:", result2.stderr)


result3 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_tm10.spice'])
print("stdout:", result3.stdout)
print("stderr:", result3.stderr)


result4 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t5.spice'])
print("stdout:", result4.stdout)
print("stderr:", result4.stderr)


result5 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t20.spice'])
print("stdout:", result5.stdout)
print("stderr:", result5.stderr)


result6 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t35.spice'])
print("stdout:", result6.stdout)
print("stderr:", result6.stderr)


result7 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t50.spice'])
print("stdout:", result7.stdout)
print("stderr:", result7.stderr)


result8 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t65.spice'])
print("stdout:", result8.stdout)
print("stderr:", result8.stderr)


result9 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t80.spice'])
print("stdout:", result9.stdout)
print("stderr:", result9.stderr)


result10 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t95.spice'])
print("stdout:", result10.stdout)
print("stderr:", result10.stderr)


result11 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t110.spice'])
print("stdout:", result11.stdout)
print("stderr:", result11.stderr)


result12 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t125.spice'])
print("stdout:", result12.stdout)
print("stderr:", result12.stderr)


result13 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t140.spice'])
print("stdout:", result13.stdout)
print("stderr:", result13.stderr)


result14 = subprocess.run(['/foss/tools/bin/ngspice','-b','-i','/foss/designs/chipalooza/Chipalooza2024_TempSensor_AC3E_redesign/test_SDCtsens_RINtsweep_9p1_ROrangeext_t155.spice'])
print("stdout:", result14.stdout)
print("stderr:", result14.stderr)

