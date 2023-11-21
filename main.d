import std.stdio;
import std.container;
import std.algorithm;
import std.conv;
import std.array;

size_t indexFinder(T)(const Array!T arr, T value)
{
    for (size_t i = 0; i < arr.length; i++)
    {
        if (arr[i] == value)
        {
            return i;
        }
    }
    return arr.length;
}

void main() 
{
string inputs = "21 816 863 107 315 964 917 766 216 370 519 562 424 659 476 613 1006 1056 257 50 167 712";
int[] properInputs = inputs.split.map!(a => a.to!int).array;
auto values = Array!int(properInputs[1..$]); 
int ncase = properInputs[0];
auto originalValues = values.dup;
int t;
for (int j = ncase-1; j>0; j--) 
{
    for (int i = 0; i<j; i++) 
    {
        if (values[i] > values[i+1]) 
        {
            t = values[i];
            values[i] = values[i+1];
            values[i+1] = t;
        }
    }
}
foreach (value;values) 
{
size_t index = indexFinder(originalValues, value);
    if (index == originalValues.length)
    {
        writefln("Elemen %d tidak ditemukan", value);
    }
    else
    {
        write(index+1, " ");
    }
}
}