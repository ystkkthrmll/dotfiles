
filename_target=english
dir_path_src=../pandoc/refs

pandoc ${dir_path_src}/${filename_target}.yaml -s -f markdown -t biblatex -o ${filename_target}.bib
cat ${filename_target}.bib

