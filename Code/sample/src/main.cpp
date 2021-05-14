#include <boost/filesystem.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/timer/timer.hpp>

#include <opencv2/dnn.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/videoio.hpp>
#include <mtcnn/detector.h>

#include <iostream>
#include <string>
#include <dirent.h>
#include <vector>
#include <sstream> 
#include <fstream> 
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

using namespace std;
using namespace cv;

namespace fs = boost::filesystem;

using rectPoints = std::pair<cv::Rect, std::vector<cv::Point>>;
CascadeClassifier DETECTOR;

void update_date(void){

    FILE *ptr_day, *ptr_year;
    struct tm *tm_ref;
	time_t time_now;

    time_now = time(NULL);
	tm_ref = localtime(&time_now);

    ptr_day = fopen("../use_files/day_ref.bin","wb");
    fwrite(&(tm_ref->tm_min), sizeof(int), 1, ptr_day);
    fclose(ptr_day);

    ptr_year = fopen("../use_files/year_ref.bin","wb");
    fwrite(&(tm_ref->tm_year), sizeof(int), 1, ptr_year);
    fclose(ptr_year);

}

int check_date(void){

    FILE *ptr_day, *ptr_year;
	struct tm *tm_ref;
	time_t time_now;

    time_now = time(NULL);
	tm_ref = localtime(&time_now);

    int f_day, f_year;
    ptr_day = fopen("../use_files/day_ref.bin","rb");
	fread(&f_day,sizeof(int),1, ptr_day);
    fclose (ptr_day);

    ptr_year = fopen("../use_files/year_ref.bin","rb");
	fread(&f_year,sizeof(int),1, ptr_year);
    fclose (ptr_year);

    if ((f_day == tm_ref->tm_min)&&(f_year == tm_ref->tm_year)){
        cout << "Mesmo dia \n";
        return 0;
    }else{
        cout << "Outro dia" << endl << "criando outro arquivo" << endl;
        return 1;
    }

    return 0;
}


static cv::Mat drawRectsAndPoints(const cv::Mat &img,
                                  const std::vector<rectPoints> data) {
  cv::Mat outImg;
  img.convertTo(outImg, CV_8UC3);

  for (auto &d : data) {
    cv::rectangle(outImg, d.first, cv::Scalar(0, 0, 255), 2);
    auto pts = d.second;
    //for (size_t i = 0; i < pts.size(); ++i) {
     // cv::circle(outImg, pts[i], 3, cv::Scalar(0, 0, 255));
   // }
  }
  return outImg;
}


vector<vector<double>> parse2DCsvFile(string inputFileName) {
 
    vector<vector<double> > data;
    ifstream inputFile(inputFileName);
    int l = 0;
 
    while (inputFile) {
        l++;
        string s;
        if (!getline(inputFile, s)) break;
        if (s[0] != '#') {
            istringstream ss(s);
            vector<double> record;
 
            while (ss) {
                string line;
                if (!getline(ss, line, ','))
                    break;
                try {
                    record.push_back(stof(line));
                }
                catch (const std::invalid_argument e) {
                    e.what();
                }
            }
 
            data.push_back(record);
        }
    }
 
    if (!inputFile.eof()) {
        cerr << "Could not read file " << inputFileName << "\n";
        __throw_invalid_argument("File not found.");
    }
 
    return data;
}

double get_avg_csv_files(string dir_path, int hour){

    double media=0;
    char path_file[512];

    double cum=0;
    int count=0;
    int col = 0;
    int clck=0;

    int Total=0;
    int c=0;

    if (auto dir = opendir(dir_path.c_str())) {
            
            while (auto csv_file = readdir(dir)) {

                if (!csv_file->d_name || csv_file->d_name[0] == '.') continue; 

                int num_sch = hour;
 
                cum=0;
                count=0;
                col = 0;
                clck=0;

                sprintf(path_file, "%s%s", dir_path.c_str(), csv_file->d_name);
                //cout << path_file;
                vector<vector<double>> data = parse2DCsvFile(path_file);

                for (auto l : data) {
                    for (auto x : l){

                        if (clck == 0&&x==num_sch){
                            count++;
                            clck = 1;
                        }
                        
                        if (clck>0&&col>=1){
                            cum += x;
                        };
                        
                        col++;
                    }
                    //cout << cum << endl;
                    Total += cum;
                    cum = 0;
                    clck = 0;
                    col = 0;
                 }

                c += count;
                //cout << "-------------" << endl;
            
            }
            
        }
        else {
            cout << "Nao foi possivel abrir diretorio" << endl;
            return -1;
        }

    //cout << Total << endl << c << endl;
    media = (double) Total*1.0/c;

    return media;
}


int main(int argc, char **argv) {

	FILE *fcsv;
    int chd;
    chd = check_date();
    update_date();

    int i;
    struct tm *tm_ref;
	time_t time_now;

    time_now = time(NULL);
	tm_ref = localtime(&time_now);

	ofstream csv_file;
    char csv_filename[300];
    sprintf(csv_filename, "../CSV_files/Dados_%d_%d_%d.csv", tm_ref->tm_year + 1900, tm_ref->tm_mon + 1, tm_ref->tm_min+150);

	int N_det = 0, c;
    auto dc = opendir("../detector_architectures/");
    while (auto d = readdir(dc)) N_det++;
    
	cout << "Numero de Detectores: " << N_det << endl;

	if (chd == 1){

        csv_file.open(csv_filename, ios::out );
        csv_file << "Hora" << ",";
		csv_file << "MTCNN" << ",";
        // csv_file << tm_ref->tm_hour << "," << tm_ref->tm_min << "," << tm_ref->tm_sec << endl;

		c=1;
        if (auto dc2 = opendir("../detector_architectures/")) {
            
            while (auto dd = readdir(dc2)) {

                if (!dd->d_name || dd->d_name[0] == '.') continue; 

                csv_file <<dd->d_name;
                if (c<(N_det-1))  csv_file << ",";

		cout << "D: " << dd->d_name << endl;
                c++;

            }

            csv_file << endl;
            csv_file.close();
            closedir(dc2);

        }
        else {
            cout << "Nao foi possivel abrir diretorio" << endl;
			return -1;
        }
	
    }

	fs::path modelDir = fs::path(argv[1]);

	ProposalNetwork::Config pConfig;
	pConfig.caffeModel = (modelDir / "det1.caffemodel").string();
	pConfig.protoText = (modelDir / "det1.prototxt").string();
	pConfig.threshold = 0.6f;

	RefineNetwork::Config rConfig;
	rConfig.caffeModel = (modelDir / "det2.caffemodel").string();
	rConfig.protoText = (modelDir / "det2.prototxt").string();
	rConfig.threshold = 0.7f;

	OutputNetwork::Config oConfig;
	oConfig.caffeModel = (modelDir / "det3.caffemodel").string();
	oConfig.protoText = (modelDir / "det3.prototxt").string();
	oConfig.threshold = 0.7f;

	MTCNNDetector detector(pConfig, rConfig, oConfig);
	cv::Mat target_image = cv::imread(argv[2]);

	std::vector<rectPoints> data;
	std::vector<Face> det;

	det = detector.detect(target_image, 20.f, 0.709f);

	for (size_t i = 0; i < det.size(); ++i) {
	std::vector<cv::Point> pts;
	for (int p = 0; p < NUM_PTS; ++p) {
	pts.push_back(
	  cv::Point(det[i].ptsCoords[2 * p], det[i].ptsCoords[2 * p + 1]));
	}

	auto rect = det[i].bbox.getRect();
	auto d = std::make_pair(rect, pts);
	data.push_back(d);
	}

	auto result_image = drawRectsAndPoints(target_image, data);
	auto result_image2 = result_image.clone();


	c = 1;
	csv_file.open(csv_filename, ios::out | ios::app );
    csv_file << tm_ref->tm_hour << ",";
	csv_file << det.size() << ",";

    double media = get_avg_csv_files("../CSV_files/", 7);
    cout << "\nMedia: " << media << endl << "\n--------------------------------\n";
	

	char cascade_name[400];

    int total_detect = 0;
    int N_media = 3;

	if (auto dir = opendir("../detector_architectures/")) {

		while (auto detector = readdir(dir)) {

			if (!detector->d_name || detector->d_name[0] == '.') continue; 

			sprintf(cascade_name,"../detector_architectures/%s", detector->d_name);
			DETECTOR.load(cascade_name);
			// DETECTOR.load("../detector_architectures/haarcascade_frontalface_alt2.xml");

			// equalizeHist(target_image, target_image );
			
			std::vector<Rect> detect;
			DETECTOR.detectMultiScale(target_image, detect);

			cout << "Detector_cascade:  " << cascade_name << endl << "N deteccoes:	" << detect.size() << endl << endl;

            

			for ( size_t i = 0; i < detect.size(); i++ ){
				cv::Point pt1(detect[i].x, detect[i].y);
				cv::Point pt2(detect[i].x + detect[i].width, detect[i].y + detect[i].height);
				cv::rectangle(result_image2, pt1, pt2, cv::Scalar(0, 255, 0), 1);
			}
			
			total_detect += detect.size()*N_media;
			
			N_media--;
			if (N_media <= 0) N_media = 3;
			
			csv_file << detect.size();
			if (c<(N_det-1))  csv_file << ",";
            c++;

		}
        csv_file << endl;
		closedir(dir);

	}
	else {
		cout << "Nao foi possivel abrir diretorio\n" << endl;
	}
    total_detect = total_detect/5;
    if (total_detect >= media) {
        cout << "\n\n---Detectada possivel aglomeração | Total detectados: " << total_detect << " ---\n\n";
        cout << "Enviando email \n\n";
        char comando_email[512];
        sprintf(comando_email, "../send_image.sh %s", argv[2]);
        system(comando_email);
    } else {cout << "\n\n--- Sem aglomeração | Total detectados: " << total_detect << " ---\n\n";}

	csv_file.close();
	
	Mat outImg;
	
	cv::resize(result_image2, outImg, cv::Size(), 0.25, 0.25);
	cv::imshow("Resultado", outImg);
	cv::waitKey(0);
	cv::imwrite("imagem.jpeg", result_image2);
	cout << "-------------------------------------------------\n" ;

	return 0;
}
