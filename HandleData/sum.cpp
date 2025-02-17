#include <iostream>

int calSum(int start, int end)
{
    int returnSum = 0; 
    for (int tmp = start; tmp <= end; tmp++)
    {
        returnSum += tmp;
    }
    return returnSum; 
}

int main(int argc, char* argv[])
{
    if (argc != 3)
    {
        std::cerr << "Error occurs. Not enough parameters given." << std::endl;

        // argv[0] is the name of the cpp file 
        std::cerr << "Usage : " << argv[0] << " <start integer> <end integer>" << std::endl;
        return 1; 
    }
    int start = std::atoi(argv[1]);
    int end = std::atoi(argv[2]);

    std::cout << "Starting integer,ending integer,sum" << std::endl; 
    std::cout << start << "," << end << "," << calSum(start, end) << std::endl;

    return 0; 

}