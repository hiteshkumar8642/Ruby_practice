#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <stdexcept>
#include <unordered_map>

using namespace std;

struct Entry {
    string user_id;
    string email;
    string price;
    string device_count;
    string created_at;
    string expire_date;
};

vector<Entry> readCSV(const string& filename) {
    vector<Entry> entries;
    ifstream file(filename);
    if (!file.is_open()) {
        throw runtime_error("Failed to open file: " + filename);
    }

    string line;
    // Read the header line and discard it
    getline(file, line);

    while (getline(file, line)) {
        stringstream ss(line);
        string field;
        Entry entry;
        int fieldCount = 0;

        while (getline(ss, field, ',')) {
            switch (fieldCount) {
                case 0: entry.user_id = field; break;
                case 1: entry.email = field; break;
                case 2: entry.device_count = field; break;
                case 3: entry.price = field; break;
                case 4: entry.created_at = field; break;
                case 5: entry.expire_date = field; break;
                default: break;
            }
            fieldCount++;
        }
        entries.push_back(entry);
    }
    file.close();
    return entries;
}

int stringToInt(const string& str) {
    try {
        return stoi(str);
    } catch (const std::invalid_argument&) {
        throw runtime_error("Invalid argument: " + str);
    } catch (const std::out_of_range&) {
        throw runtime_error("Out of range: " + str);
    }
}

int main() {
    string filename = "input1.csv";
    vector<Entry> entries = readCSV(filename);

    unordered_map<string, Entry> firstEntryMap;
    unordered_map<string, int> upgrade_device_count;
    unordered_map<string, int> first_device_count;

    for (const auto& entry : entries) {
        const string& userId = entry.user_id;

        // Check if the user already has a first entry
        if (firstEntryMap.find(userId) != firstEntryMap.end()) {
            try {
                upgrade_device_count[userId] += stringToInt(entry.device_count);
            } catch (const std::runtime_error& e) {
                cerr << "Error: " << e.what() << endl;
            }
        } else {
            // Store the first entry for each user
            firstEntryMap[userId] = entry;
            try {
                first_device_count[userId] = stringToInt(entry.device_count);
            } catch (const std::runtime_error& e) {
                cerr << "Error: " << e.what() << endl;
            }
        }
    }

    cout << "User_ID " <<"Created_date"<< "Email "  
          << "First_Device_Count "  << "Upgrade_Device_Count  ,"<<endl;

    int preold=0,postold=0,pre2020=0,post2020=0,pre2021=0,post2021=0,pre2022=0,post2022=0,pre2023=0,post2023=0;
    for (const auto& entry : firstEntryMap) {
        const Entry& firstEntry = entry.second;
        const string& userId = firstEntry.user_id;
        if(first_device_count[userId]>upgrade_device_count[userId] && firstEntry.created_at.find("2022")!= string::npos)
            pre2022++;
        else  if(first_device_count[userId]<=upgrade_device_count[userId] && firstEntry.created_at.find("2022")!= string::npos)
            post2022++;
        else if(first_device_count[userId]>upgrade_device_count[userId] && firstEntry.created_at.find("2021")!= string::npos)
            pre2021++;
        else  if(first_device_count[userId]<=upgrade_device_count[userId] && firstEntry.created_at.find("2021")!= string::npos)
            post2021++;
        else if(first_device_count[userId]>upgrade_device_count[userId] && firstEntry.created_at.find("2020")!= string::npos)
            pre2020++;
        else  if(first_device_count[userId]<=upgrade_device_count[userId] && firstEntry.created_at.find("2020")!= string::npos)
            post2020++;
        else if(first_device_count[userId]>upgrade_device_count[userId] && firstEntry.created_at.find("2023")!= string::npos)
            pre2023++;
        else  if(first_device_count[userId]<=upgrade_device_count[userId] && firstEntry.created_at.find("2023")!= string::npos)
            post2023++;
        else if(first_device_count[userId]>upgrade_device_count[userId] )
            preold++;
        else  if(first_device_count[userId]<=upgrade_device_count[userId] )
            postold++;
        cout <<"  "<< userId <<" "<<firstEntry.created_at <<" "<< firstEntry.email  
              <<" "<< first_device_count[userId]  <<" "<< upgrade_device_count[userId]<<" ,"<<endl;
    }
    cout<<"Customer with first purchase more than upgrade in 2023\t"<<pre2023<<endl;
    cout<<"Customer with first purchase less than upgrade in 2023 \t"<<post2023<<endl;
    cout<<"Customer with first purchase more than upgrade in 2022\t"<<pre2022<<endl;
    cout<<"Customer with first purchase less than upgrade in 2022\t"<<post2022<<endl;
    cout<<"Customer with first purchase more than upgrade in 2021\t"<<pre2022<<endl;
    cout<<"Customer with first purchase less than upgrade in 2021\t"<<post2021<<endl;
    cout<<"Customer with first purchase more than upgrade in 2020\t"<<pre2021<<endl;
    cout<<"Customer with first purchase less than upgrade in 2020\t"<<post2020<<endl;
    cout<<"Customer with first purchase more than upgrade in old\t"<<preold<<endl;
    cout<<"Customer with first purchase less than upgrade in old\t"<<postold<<endl;
    
    return 0;
}
