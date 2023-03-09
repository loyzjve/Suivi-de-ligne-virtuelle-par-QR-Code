#include<iostream>
//#include<Transformation.h>
#include<math.h>
#include <Eigen/Dense>
using namespace std;


Eigen::Matrix<double,4,4> XYZRPY2transformation( double x, double y ,double z, double roll, double pitch,double yaw)
{
	Eigen::Matrix<double,4,4> out;
out.setIdentity();
	//first row
	out(0,0)=cos(yaw)*cos(pitch);
	out(0,1)=sin(yaw)*cos(pitch);
	out(0,2)=-sin(pitch);
	//second row
	out(1,0)=-sin(yaw)*cos(roll)+cos(yaw)*sin(pitch)*sin(roll);
	out(1,1)=cos(yaw)*cos(roll)+sin(yaw)*sin(pitch)*sin(roll);
	out(1,2)=cos(pitch)*sin(roll);
	//third row
	out(2,0)=sin(yaw)*sin(roll)+cos(yaw)*sin(pitch)*cos(roll);
	out(2,1)=-cos(yaw)*sin(roll)+sin(yaw)*sin(pitch)*cos(roll);
	out(2,2)=cos(pitch)*cos(roll);
	//fourth row
	out(3,0)=x;
	out(3,1)=y;
	out(3,2)=z;
	return out.transpose();
}



int main(){

	Eigen::Matrix<double,4,4> T1 = XYZRPY2transformation(1.2,0.2,0.2,0,0,0);
	Eigen::Matrix<double,4,4> T2 = XYZRPY2transformation(3.0,2.5,0.2,0,0.5,0);
	Eigen::Matrix<double,4,4> T3 = XYZRPY2transformation(4.0,4.5,0.2,0,1.57,0);
	Eigen::Matrix<double,4,4> T4 = XYZRPY2transformation(3.0,6.5,0.2,0,2.6,0);
	Eigen::Matrix<double,4,4> T5 = XYZRPY2transformation(0,8.0,0.2,0,3.14,0);
	Eigen::Matrix<double,4,4> T6 = XYZRPY2transformation(-3.0,6.5,0.2,0,-2.6,0);
	Eigen::Matrix<double,4,4> T7 = XYZRPY2transformation(-4.0,4.5,0.2,0,1.57,0);
	Eigen::Matrix<double,4,4> T8 = XYZRPY2transformation(-3.0,2.5,0.2,0,-0.5,0);


	Eigen::Matrix<double,4,4> matrix1,matrix2;
	matrix1 = Eigen::Matrix<double,4,4>::Zero(4,4);
	matrix2 = Eigen::Matrix<double,4,4>::Zero(4,4);

	// input first matrix.
	//cout << endl << "|Input Matrix 1|" << "\n\n";
    	//for (int i = 0; i < 4; ++i) {
        //for (int j = 0; j < 4; ++j) {
        //    cout << "Enter a" << i + 1 << j + 1 << " :\t ";
        //    cin >> matrix1(i,j);
        //}
	//}

	// input second matrix.
    	//cout << endl << "|Input Matrix 2|" << "\n\n";
   	//for (int i = 0; i < 4; ++i) {
        //for (int j = 0; j < 4; ++j) {
        //    cout << "Enter b " << i + 1 << j + 1 << " :\t ";
        //    cin >> matrix2(i,j);
        //}
    	//}
	//
        //    cout << " matrix1 * matrix2 = " << matrix1*matrix2 << endl;
	cout << " T1 * T2 = " << T1*T2 << endl;




}
