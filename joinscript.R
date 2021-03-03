#Start

args = commandArgs(trailingOnly = TRUE)

  File.1 = args[2]
  File.1.Delimiter = as.character(args[4])
if (File.1.Delimiter == "tab") {
  File.1.Delimiter = "\t"
} else if (File.1.Delimiter == "comma") {
  File.1.Delimiter = ","
}
  File.1.Header = as.logical(args[6])
  File.1.Column = as.integer(args[8])
  File.1.Unmatched = as.logical(args[10])

  File.2 = args[12]
  File.2.Delimiter = as.character(args[14])
  if (File.2.Delimiter == "tab") {
    File.2.Delimiter = "\t"
  } else if (File.2.Delimiter == "comma") {
    File.2.Delimiter = ","
  }
  File.2.Header = as.logical(args[16])
  File.2.Column = as.integer(args[18])
  File.2.Unmatched = as.logical(args[20])

  Output.Type = as.character(args[22])

file1 <- read.table(File.1, header=File.1.Header, sep=File.1.Delimiter, quote="", fill=TRUE, stringsAsFactors=FALSE)
file2 <- read.table(File.2, header=File.2.Header, sep=File.2.Delimiter, quote="", fill=TRUE, stringsAsFactors=FALSE)

merged <- merge(x=file1, y=file2, by.x=File.1.Column, by.y=File.2.Column, all.x=File.1.Unmatched, all.y=File.2.Unmatched)

if (Output.Type == "txt") {
  outsep = "\t"
} else if (Output.Type == "csv") {
  outsep = ","
}

write.table(merged, paste0(basename(File.1),".",basename(File.2),".merged.",Output.Type), sep=outsep, quote=FALSE, row.names=FALSE, col.names=TRUE)
