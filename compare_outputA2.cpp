#include <bits/stdc++.h>
#include  <iostream>
using namespace std;

void read_ktrusses(int b, ifstream &f, vector<vector<int>> &tr) {
  tr = vector<vector<int>> (b);
  for (int i = 0; i < b; i ++) {
    string s;
    getline(f, s);
    istringstream x(s);
    while (x) {
      int y;
      x >> y;
      tr[i].push_back(y);
    }
    sort(tr[i].begin(), tr[i].end());
  }
  sort(tr.begin(), tr.end());
}

void compare_trusses(vector<int> &t1, vector<int> &t2) {
  int a = 0, b = 0;
  while (a < t1.size() && b < t2.size()) {
    if (t1[a] == t2[b]) {
      a++; b++;
    }
    else if (t1[a] < t2[b]) {
      cout << "> " << t1[a] << endl;
      a++;
    }
    else {
      cout << "< " << t2[b] << endl;
      b++;
    }
  }
  if (a < t1.size()) {
    for (int i = a; i < t1.size(); i ++) {
      cout << "> " << t1[a] << endl;
    }
  }
  if (b < t2.size()) {
    for (int i = b; i < t2.size(); i ++) {
      cout << "< " << t2[b] << endl;
    }
  }
}

int read_num_ktruss (ifstream &f){
  string s;
  getline(f, s);
  int x = 0;
  try {
    x = stoi(s);
  } catch (...) {
    
  }
  if (x != 0) {
    getline(f, s);
    try {
      x = stoi(s);
    } catch (...) {
    
    }
  }
  return x;
}

void get_next (ifstream &f1, ifstream &f2) {
  int b1, b2;
  b1 = read_num_ktruss(f1);
  b2 = read_num_ktruss(f2);
  if (b1 != b2) {
    cout << "different number of k-truss groups given" << endl;
  }
  vector<vector<int>> tr1,tr2;
  read_ktrusses(b1, f1, tr1);
  read_ktrusses(b2, f2, tr2);
  for (int i = 0; i < min(b1, b2); i ++) {
    compare_trusses(tr1[i], tr2[i]);
  }
}

int main (int argc, char ** argv) {
  
  ifstream f1(argv[1]);
  cout << argv[1] << endl;
  ifstream f2(argv[2]);
  cout << argv[2] << endl;
  while (f1 || f2) {
    get_next(f1, f2);
  }
}
