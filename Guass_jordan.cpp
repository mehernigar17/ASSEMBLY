
#include <bits/stdc++.h>
using namespace std;

int n;
vector<vector<double>> a;
vector<double> b;

void printMatrix()
{
    for(int i = 0; i < n; i++)
    {
        for(int j = 0; j < n; j++)
        {
            cout << fixed << setprecision(2) << a[i][j] << " ";
        }
        cout << " | " << b[i] << endl;
    }
}

void GaussJordan()
{
    for(int i = 0; i < n; i++)
    {
        // Partial Pivoting
        int maxRow = i;

        for(int j = i + 1; j < n; j++)
        {
            if(abs(a[j][i]) > abs(a[maxRow][i]))
            {
                maxRow = j;
            }
        }

        if(maxRow != i)
        {
            swap(a[i], a[maxRow]);
            swap(b[i], b[maxRow]);
        }

        // Pivot Partition
        double pivot = a[i][i];

        for(int j = 0; j < n; j++)
        {
            a[i][j] /= pivot;
        }
        b[i] /= pivot;

        // Make Pivot Column Zero
        for(int j = 0; j < n; j++)
        {
            if(j == i)
                continue;

            double factor = a[j][i];

            for(int k = 0; k < n; k++)
            {
                a[j][k] -= factor * a[i][k];
            }

            b[j] -= factor * b[i];
        }
    }
}

int main()
{
    cin >> n;

    a = vector<vector<double>>(n, vector<double>(n));
    b = vector<double>(n);

    // Coefficient Matrix Input
    for(int i = 0; i < n; i++)
    {
        for(int j = 0; j < n; j++)
        {
            cin >> a[i][j];
        }
    }

    // Constant Vector Input
    for(int i = 0; i < n; i++)
    {
        cin >> b[i];
    }

    GaussJordan();

    cout << "\nReduced Row Echelon Form (RREF):\n";
    printMatrix();

    cout << "\nSolution:\n";
    for(int i = 0; i < n; i++)
    {
        cout << "x" << i + 1 << " = " << b[i] << endl;
    }

    return 0;
}
