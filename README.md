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
A B-spline function consists of a smooth curve controlled by some control points. In our case, we have 8 landmarks. Therefore I chosed to use B-Spline in 2nd order with 8 segments.

It should be achieved by 5 steps :
1. Decide numbers of segments and numbers of nodes.
2. Initialize the least squares matrix M.
3. Fill the least squares matrix M row by row with the functions of the subsets.
4. Calculation of optimal control points.
5. Calculation of y estimated with the vector of optimal control points.

Some notions:
Basic function :A0(t), A1(t), A2(t), B0(t), B1(t), B2(t), C0(t), C1(t), C2(t);
Control point : Pk;
Segments : Sk;
Polynomial : Qi(t).

#### Orther approach : Least square
Compared to B-Spline, least square is suit to use in more simple situation rather than our case. It isn't able to pass every important points in our test![image]()
Moreover, its residue E^2=∑|V-theta*M|^2=32.3812 is large. Therefore, we need to choose B-Spline. However, the calculation of B-Spline in high order might be complex.

### Display of distances and angles between robot and QR codes
In this part, input of problem is a trajectory. We should display of distances and angles between robot and QR codes by using the function of distance and the difference between 2 angles.

## Disclusion
To solve the localization and mapping problem for square markers in 2 dimensions. Rafael's group came up with a method.They first created a closed loop using translation errors and rotation errors. So they got a pose chart. Finally, they minimized reprojection errors.

The differences between this projet and their projet are choises of approach. We choose the transformation of landmarks to solve the problem of closed loop while they choose Bundle Adjustment. Besides, I choose B-Spline to calculate a trajectory while they choose minimization of reprojection error.

## Conclusion
This projet need to be continue. I will correct programs of B-Spline and combine three of them. Otherwise, we should compile programs in reality. 

During this projet, I learn a lot in how to present a projet. Mr LENGAGNE help me a lot in this part. I am very grateful to him.

