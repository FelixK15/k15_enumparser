function printHelp()

local helpMessage =
[[EnumParser command line tool
Syntax:
enum_tool.exe [-h] [-i input] [-o output] [-l] [-s] [-r]

Options:

   -t         Displays the help message.

   -i input   Specify either a single C/C++ file (.h, .inl, .c, .cpp)
              or a .txt file with a list of directories, which contains
              C/C++ files. The tool will parse the file(s) for enum blocks.

   -o output  Specify a file, where the string arrays will get written to.

   -l         If specified, the tool will ignore the last value inside
              an enum block.

   -s         The string arrays that will get written are normally of
              type const char*. If you want to use std::string instead,
              use this option.

   -r         If the input is a list of directories written to a .txt file,
              use this option to search the directories recursively.]]

print(helpMessage)
end