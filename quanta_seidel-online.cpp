#include<bits/stdc++.h>
using namespace std;

int n;
vector<vector<double>> a;
vector<double> b;
vector<double> x;

double tolerance = 0.00001;

bool diagonal()
{
    bool dominant = true;

    for(int i = 0; i < n; i++)
    {
        double sum = 0;

        for(int j = 0; j < n; j++)
        {
            if(i != j)
            {
                sum += abs(a[i][j]);
            }
        }

        printf("|a[%d][%d]| = %.0f, Sum of other coefficients = %.0f -> ",
               i, i, abs(a[i][i]), sum);

        if(abs(a[i][i]) > sum)
        {
            cout << "dominant" << endl;
        }
        else
        {
            cout << "not dominant" << endl;
            dominant = false;
        }
    }

    return dominant;
}

void seidel()
{
    int itr = 1;
    double maxerror = 100000;

    while(maxerror > tolerance)
    {
        maxerror = 0;

        printf("\nIteration %d\n", itr);

        for(int i = 0; i < n; i++)
        {
            double old = x[i];
            double sum = 0;

            for(int j = 0; j < n; j++)
            {
                if(i != j)
                {
                    sum += a[i][j] * x[j];
                }
            }

            x[i] = (b[i] - sum) / a[i][i];

            double error = abs(x[i] - old);
            maxerror = max(maxerror, error);
        }

        for(int i = 0; i < n; i++)
        {
            printf("x[%d] = %.6f  ", i, x[i]);
        }

        printf("Max Error = %.6f\n", maxerror);

        itr++;
    }

    cout << "\nFinal Solution:\n";

    for(int i = 0; i < n; i++)
    {
        printf("x[%d] = %.6f\n", i, x[i]);
    }
}

int main()
{
    cin >> n;

    a = vector<vector<double>>(n, vector<double>(n));
    b = vector<double>(n, 0);
    x = vector<double>(n, 0);

    cout << "Enter coefficient matrix:\n";

    for(int i = 0; i < n; i++)
    {
        for(int j = 0; j < n; j++)
        {
            cin >> a[i][j];
        }
    }

    cout << "Enter constant vector:\n";

    for(int i = 0; i < n; i++)
    {
        cin >> b[i];
    }

    if(diagonal())
    {
        cout << "\nApplying Gauss-Seidel Method...\n";
        seidel();
    }
    else
    {
        cout << "\nMatrix is not diagonally dominant.\n";
    }

    return 0;
}
