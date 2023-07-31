#include <iostream>
#include<iomanip>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <stdexcept>
#include <unordered_map>

using namespace std;
double totalPrice = 0.0;
int cnt=1;
struct Entry {
    string user_id;
    string email;
    string price;
    string updated_at;
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
                case 2: entry.price = field; break;
                case 3: entry.updated_at = field; break;
                case 4: entry.expire_date = field; break;
                default: break;
            }
            fieldCount++;
        }
        entries.push_back(entry);
    }
    file.close();
    return entries;
}

void calculatePrice(const Entry& firstEntry, const Entry& currentEntry) {
    double price = stod(currentEntry.price);
    double newdiff = stod(firstEntry.expire_date)-stod(currentEntry.updated_at); 
    double olddiff = stod(currentEntry.expire_date) - stod(currentEntry.updated_at);
    if (olddiff==0)
        return;
    double calculatedPrice= price * (newdiff / olddiff);
    //cout<<newdiff<<" "<<olddiff<<" "<<calculatedPrice<<" ";
    totalPrice += calculatedPrice;
    cout.width(50);
    cout<<currentEntry.user_id<< right << setw(50)<<currentEntry.email<< right << setw(50)<<calculatedPrice<<endl;
    cnt++;
}

int main() {
    string filename = "input.csv";
    try {
        vector<Entry> entries = readCSV(filename);

        unordered_map<string, Entry> firstEntryMap;
        
        
        for (const auto& entry : entries) {
            const string& userId = entry.user_id;

            // Check if the user already has a first entry
            if (firstEntryMap.find(userId) != firstEntryMap.end()) {
                const Entry& firstEntry = firstEntryMap[userId];
                calculatePrice(firstEntry, entry);
                
            } else {
                // Store the first entry for each user
                firstEntryMap[userId] = entry;
                totalPrice += stod(entry.price);
                cout.width(50);
                cout<<entry.user_id<< right << setw(50)<<entry.email<< right << setw(50)<<stod(entry.price)<<endl;
                cnt++;
            }
            
        }

        cout << "Total Price: " << int(totalPrice) << endl;
    }
    catch (const exception& e) {
        cerr << "Error: " << e.what() << endl;
        return 1;
    }

    return 0;
}
