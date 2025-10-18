"""
- Purpose: Convert from YAML to bib
- Usage: `$ python bib_file_maker.py`
"""

from pathlib import Path

from rich import print
from yaml import safe_load

src_dir_path = Path().home().joinpath("Dropbox/dotfiles/typst/.local/share/typst/packages/local/bib/0.0.0")
dst_file_path = Path("./output-files/references/myreferences.bib")


def convert_to_bib(info: dict) -> str:
    # print(info)
    strings = ["@{}{{{},".format(info["type"], info["id"])]
    strings.append('\ttitle="' + info["title"] + '",')
    if "author" in info:
        strings.append(
            '\tauthor="' + str(info["author"]) + '",'
        )  # info["author"] はlistの可能性もあるためstr()を使う
    if "publisher" in info:
        strings.append('\tpublisher="{}",'.format(info["publisher"]))
    if "issued" in info:
        strings.append('\tyear="{}",'.format(info["issued"]))
    if "edition" in info:
        strings.append('\tedition="{}",'.format(info["edition"]))
    if "url" in info:
        strings.append('\thowpublished="URL: \\url{' + info["url"] + '}",')
    strings.append("}")
    return "\n".join(strings)


def main() -> None:
    contents = []
    for file_path_target in dir_path_src.glob("*.yaml"):
        if file_path_target.name not in {"computer.yaml", "math.yaml", "misc.yaml"}:  # debug
            continue
        print(f"Processing {file_path_target} ...")
        data_yaml = safe_load(file_path_target.read_text())
        for info in data_yaml["references"]:
            item = convert_to_bib(info)
            contents.append(item)
    file_path_dest.write_text("\n".join(contents))


if __name__ == "__main__":
    main()
