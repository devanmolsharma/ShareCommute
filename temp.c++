#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);

    // Initialize an array to store the count of super-binary numbers
    int dp[n + 1];
    dp[1] = 2; // There are 2 super-binary numbers of length 1: 0 and 1

    // Calculate the count of super-binary numbers for each length
    for (int i = 2; i <= n; ++i) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }

    // Print the result
    printf("%d\n", dp[n]);

    return 0;
}
