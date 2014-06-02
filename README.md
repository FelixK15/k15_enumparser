# README #

EnumParser is a command line tool written in Lua, which parses C/C++ files for enums. 
Once the C/C++ files have been processed, all enums that have been parsed will get written 
to a new header files as string arrays.

### Overview ###

```
#!lua
EnumParser command line tool
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
              use this option to search the directories recursively.
```


### What to consider ###
This is the first version, so be prepared for some bugs.
I'm not completely sure if the tool will recognize all 
possible ways to declare an enum in C/C++. Please also mind the ToDo list 
as there are still some features missing.

The tool uses hash values to prevent unnecessary file rewrites and therefore
unnecessary recompiles.


### Expected output ###
In the current state, the tool is designed to recognize the 
following way to declare an enum:

```
#!cpp
enum eCornerTypes
{
   CT_FAR_LEFT_TOP = 0,
   CT_FAR_RIGHT_TOP,
   CT_FAR_LEFT_BOTTOM,
   CT_FAR_RIGHT_BOTTOM,

   CT_NEAR_LEFT_TOP,
   CT_NEAR_RIGHT_TOP,
   CT_NEAR_LEFT_BOTTOM,
   CT_NEAR_RIGHT_BOTTOM,

   CT_COUNT
};
```

After the tool has run and parsed the above enum, it should
output the following code to a new file:

```
#!cpp
const char* eCornerTypesStr = 
{
   "CT_FAR_LEFT_TOP",
   "CT_FAR_RIGHT_TOP",
   "CT_FAR_LEFT_BOTTOM",
   "CT_FAR_RIGHT_BOTTOM",
   "CT_NEAR_LEFT_TOP",
   "CT_NEAR_RIGHT_TOP",
   "CT_NEAR_LEFT_BOTTOM",
   "CT_NEAR_RIGHT_BOTTOM",
   "CT_COUNT"
};
```

Other ways of enums declaration *could* be recognized but I won't give you my word on it. 

### ToDo ###
* recognize hex values.
* enum values as indices (optional).
* recognize a wider range of possible enum declarations.