# Follow-a-virtual-line-by-QR-Code

## Subject
This subject consists in realizing a trajectory visualization by certain QR codes via a mobile robot from the company Agile.x using an rgbd-camera. It requires implementing a visualization under ROS of the distances and poses between the robot and this trajectory at any time.

## Hypothesis
At initialization and at any subsequent QR code position, it is assumed that the camera can observe at least 2 QR codes (for example, a landmark X and an after landmark X+1).

## Context
This project is for a Master 2 PAR project. It should create a virtual line according to several QR codes for a mobile robot. Studient must follow this line to calcul the robot's position and pose wherever it is.  

## Schedule(Gantt chart)
![image](https://raw.githubusercontent.com/loyzjve/Suivi-de-ligne-virtuelle-par-QR-Code/main/Pictures%20for%20readme%20file/gantt.JPG?token=GHSAT0AAAAAAB5TS4RITBQYRGVYF332QRUIY6PN7MQ)

## The process
1. At initialization, we place a certain number of QR codes under our hypothesis.
2. Then, we manually control a mobile robot to scan all QR codes.
3. In addition, we calculate and look for a better trajectory that allows you to pass all the landmarks.
4. Finally, we display this result under Rviz.

## Bibliography
### First approach : B-Spline


### Second approach

### Third approach

