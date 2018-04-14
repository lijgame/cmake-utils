#include <iostream>
#include <glm/glm.hpp>
#include <tbb/tbb.h>
#include <boost/filesystem.hpp>

int main(int argc, char** argv)
{
    boost::filesystem::path app(argv[0]);

	std::cout<<"Welcome to: "<<app.stem()<<std::endl;
    tbb::parallel_for(0, 10, [](int i)
    {
        std::cout << i << std::endl;
    });
	return 0;
}
