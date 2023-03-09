# Follow-a-virtual-line-by-QR-Code
Editor : Zejun YE
Tutor : Sébastien LENGAGNE
University of Clermont Auvergne

## Subject
This subject consists in realizing a trajectory visualization by certain QR codes via a mobile robot from the company Agile.x using an rgbd-camera. It requires implementing a visualization under ROS of the distances and poses between the robot and these Aruco's QR codes at any time.

### Context
This project is for a master 2 PAR project. Mr LENGAGNE would like to create a practical work about the mobile robot and Aruco's QR codes. Because of being flexible to change trajectories, He prefers to use QR codes rather than trace directly on the ground. In this case, it should create a virtual line according to several QR codes with a mobile robot. Therefore, the student must teleguide the robot keeping tracking in the first run for all the QR codes. Then it should be able to calculate the distance between the robot and QR codes as well as their different angles after the first run wherever the robot is. 

### Hypothesis
At initialization and at any subsequent QR code position, it is assumed that the camera can observe at least 2 QR codes (for example, a landmark X and an after landmark X+1).

## Planning
![image]()
We divide this project into three parts. Localisations of QR codes, calculate a trajectory as well as display of distances and angles between robot and QR codes. 

### Schedule(Gantt chart)
![image](https://raw.githubusercontent.com/loyzjve/Suivi-de-ligne-virtuelle-par-QR-Code/main/Pictures%20for%20readme%20file/gantt.JPG?token=GHSAT0AAAAAAB5TS4RITBQYRGVYF332QRUIY6PN7MQ)

## Result
### Localisations of QR codes
In this part, input of problem are QR codes of Aruco and Mobile robot with a RGBD camera. However, we should to get all Aruco's QR code coordinate estimates as outputs.

It should calculate the matrix of transformation at first.![image]() Then it's important to create a closed loop by all the matrix of transformation.![image]() In fact, there are always some noise in measure. Therefore, it should minimise the function by using least square.

### Calculate a trajectory
In this part, input of problem are all Aruco's QR code coordinate estimates. We should to calculate a trajectory which need to pass some important points beside the landmarks. We define 30 cm between the important point and the landmark at the axis x.



#### First approach : B-Spline

#### Orther approach : 

### Display of distances and angles between robot and QR codes

## Disclusion

## Conclusion


