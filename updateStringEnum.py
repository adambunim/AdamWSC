input = open("./en.lproj/Localizable.strings", "r")
output = open("AdamWSC/texts/StringKey.swift", "w")
output.write("import Foundation\n\n")
output.write("public enum StringKey: String {\n\n")
formatter = '\tcase {key} // {value}\n'
for line in input:
    line = line.strip()
    if line.endswith( ';' ):
        line = line[0:-1] 
    lineParts = line.split('=', 1)
    key = lineParts[0].strip()[1:-1]
    value = lineParts[1].strip()[1:-1]
    if " " in key or "-" in key:
        print("bad")
        continue
    output.write(formatter.format(key = key, value = value))
output.write("}")
