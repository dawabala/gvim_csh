# Filename: dumptb.py, 
# Author  : rewrite from dumptb.pl, by chatgpt 3.5; 
# Date    : 20241126;
# Descript: Key Changes:
#           Argument Parsing: Replaced perl's @ARGV with Python's sys.argv.
#           regex: use python re module for regex operations.
#           File Handling: Used python 'with' statement for safe file handling.
#           Print Statements: Updated print statements for Python 3.
#           System Calls: Used os.remove() to delete the temporary file.

import sys
import os
import re

def dumptb(filename, tbfilename=""):
    position = filename.find(".")
    length = len(filename)
    rootname = filename[:position]
    extname = filename[position:]
    
    if not tbfilename:
        tbfilename = rootname + "_tb" + extname
    tmpfilename = filename + ".tmp"

    # Parse Verilog file, concatenate into one line, save parameters into array
    try:
        with open(filename, "r") as infile, open(tmpfilename, "w") as outfile:
            for line in infile:
                newline = re.sub(r",[\s]*\n", ",", line)
                outfile.write(newline)
    except FileNotFoundError:
        print(f"No such file: {filename}")
        sys.exit(1)

    try:
        with open(tmpfilename, "r") as infile, open(tbfilename, "w") as outfile:
            portlisttag = 0
            reg_vars = ""
            clk_name = ""
            rst_name = ""

            for linenum, line in enumerate(infile, 1):
                if portlisttag == 1:
                    if ")" in line:
                        print(f"Port list end line: {line.strip()}")
                        port += line
                        portlisttag = 0
                        print(f"Port list is: {port.strip()}")
                    else:
                        print(f"Port list line: {line.strip()}")
                        port += line
                elif re.match(r"^[\s]*module", line):
                    outfile.write("`timescale 1ns / 1ns\n")
                    oldname = re.sub(r"module|\(.*\n", "", line).strip()
                    modulename = oldname
                    port = re.sub(rf"{modulename}|module", "", line)
                    tbmodulename = oldname + "_tb"
                    outfile.write(f"module {tbmodulename};\n")

                    if not ")" in port:
                        print("Having multi-line port list ......")
                        portlisttag = 1

                elif re.search(r"input", line):
                    newline = re.sub(r"input", "reg", line)
                    outfile.write(newline)
                    reg_vars += re.sub(r"(reg|;)", "", newline)

                elif re.search(r"output", line):
                    newline = re.sub(r"output", "wire", line)
                    outfile.write(newline)

                elif re.match(r"^[\s]*parameter", line):
                    outfile.write(line)
                
                elif re.search(r"endmodule", line):
                    port = re.sub(r" ", "", port)
                    outfile.write(f"\n{modulename} {modulename}1 {port}\n")
                    outfile.write("initial\nbegin\n#0\n")

                    reg_vars = re.sub(r"\n", ",", reg_vars)
                    reg_vars = re.sub(r"[ ]*", "", reg_vars)
                    reg_vars = re.sub(r"\[[0-9:]+\]", "", reg_vars)
                    reg_vars_list = reg_vars.split(",")

                    for reg_var in reg_vars_list:
                        if reg_var:
                            outfile.write(f"    {reg_var} = 0;\n")
                            if re.search(r"[S]*[C]+[LOC]*[K]+", reg_var, re.I):
                                clk_name = reg_var
                            if re.search(r"[R]+[E]*[S]+[E]*[T]+[_NB]*", reg_var, re.I):
                                rst_name = reg_var

                    outfile.write("#2000 $finish;\nend\n\n")
                    outfile.write("initial\nbegin\n")
                    outfile.write('    $monitor($time, " ')
                    
                    ports = re.sub(r"(\(|\)|;)", "", port).strip().split(",")
                    for p in ports:
                        outfile.write(f"@{p} =%b ")
                    outfile.write(f'", {",".join(ports)});\n')

                    outfile.write("end\n")
                    outfile.write(f"always \nbegin #10 {clk_name} = ~{clk_name}; \nend \nendmodule\n")
    except FileNotFoundError:
        print(f"No such file: {tmpfilename}")
        sys.exit(1)

    os.remove(tmpfilename)

if __name__ == "__main__":
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        print("Usage: dumptb.py <verilog_file>")
    elif len(sys.argv) == 2:
        print(sys.argv[1])
        dumptb(sys.argv[1])

