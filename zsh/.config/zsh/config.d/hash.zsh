# - Purpose: Define hash
# - Notes
#   - Zsh において，hash とは＊＊＊．
#   - 例えば，`$ cd ~dotfiles` または `$ ~dotfiles` で移動可能
#   - ハッシュ名（正式名称は？）はよほどの事情がない限り変更してはいけない．
#     したがって，ハッシュ名は慎重に決めよ．
#   - 配列で処理したいところだが，bash/zsh には2多次元配列が用意されていない
#     - \href{https://stackoverflow.com/questions/12317483/array-of-arrays-in-bash/35728122}{参照先}
# - Warning
#   - 名前と `=` の間にタブやスペースを入れるとエラー

# #region dotfiles
hash -d dropbox=~/Dropbox

hash -d dotfiles=~dropbox/dotfiles
hash -d dotfiles-bash=~dotfiles/bash
hash -d dotfiles-git=~dotfiles/git/.config/git
hash -d dotfiles-pandoc=~dotfiles/pandoc/.local/share/pandoc/defaults
hash -d dotfiles-tex=~dotfiles/tex
hash -d dotfiles-typst=~dotfiles/typst/.local/share/typst/packages/local
hash -d dotfiles-vim=~dotfiles/vim/.config/nvim
hash -d dotfiles-vscode=~dotfiles/visual-studio-code/.config/Code/User
hash -d dotfiles-zsh=~dotfiles/zsh/.config/zsh/config.d




hash -d config-files=~dropbox/config-files
hash -d config-latex=~config-files/latex
hash -d config-misc=~config-files/misc
hash -d config-pandoc=~config-files/pandoc
hash -d config-typst=~config-files/typst
hash -d config-vim=~config-files/vim
hash -d config-vscode=~config-files/visual-studio-code
# #endregion dotfiles

# #region misc
hash -d dropbox-my-docs=~dropbox/my-docs
# hash -d bookmarks=~notes/bookmarks
hash -d notes=~dropbox/notes
hash -d test=~/test

# #endregion misc

# #region computer
hash -d computer=~/my-docs/computer

# #region computer science
hash -d computer-science=~computer/computer-science
# #endregion computer science

# #region data science
hash -d data-science=~computer/data-science

hash -d causal-discovery=~data-science/causal-discovery

hash -d deep-learning=~data-science/deep-learning
hash -d image-classification=~deep-learning/image-classification
hash -d image-segmentation=~deep-learning/image-segmentation

hash -d machine-learning=~data-science/machine-learning
hash -d natural-language-processing=~deep-learning/natural-language-processing
hash -d object-detection=~deep-learning/object-detection
hash -d reinforcement-learning=~data-science/reinforcement-learning
# #endregion data science

# #region operating systems
hash -d os=~computer/operating-systems

hash -d linux=~os/linux
hash -d windows=~os/windows

# #endregion operating systems

# #region programming-languages
hash -d programming-languages=~computer/programming-languages

hash -d java=~programming-languages/java
hash -d python=~programming-languages/python
hash -d rust=~programming-languages/rust
hash -d shell=~programming-languages/shell
hash -d sql=~programming-languages/sql

# #endregion programming-languages

# #region software
hash -d software=~computer/software

hash -d aws=~software/aws
hash -d latex=~software/typesetting-sofrware/latex
hash -d markdown=~software/typesetting-sofrware/markdown
hash -d typst=~software/typesetting-sofrware/typst
hash -d text-editor=~software/text-editor
hash -d virtualization=~software/virtualization

# #endregion software

# #endregion computer

# #region english
hash -d expressions=~/my-docs/english/expressions
hash -d grammar=~/my-docs/english/grammar
hash -d vocabulary=~/my-docs/english/vocabulary
# #endregion english

# #region job
hash -d job=~/my-docs/job
hash -d job-change=~job/job-change
hash -d job-etc=~job/etc
hash -d job-general-theory=~job/general-theory
hash -d job-current-company=~job/current-company

# #endregion job

# #region math
hash -d math=~/my-docs/math

# #region algebra
hash -d algebra=~math/algebra
hash -d linear-algebra=~math/algebra/linear-algebra/srcs


# #endregion algebra

# #region analysis
hash -d analysis=~math/analysis

hash -d real-analysis=~analysis/real-analysis/srcs
hash -d functional-analysis=~analysis/functional-analysis/srcs



# #endregion analysis

# #region applied-math
hash -d applied-math=~math/applied-math

hash -d math-data-science=~applied-math/data-science/srcs
hash -d information-theory=~applied-math/information-theory
hash -d probability-theory=~applied-math/probability-and-statistics/probability-theory/srcs
hash -d statistics=~applied-math/probability-and-statistics/statistics/srcs



# #endregion applied-math

# #region foundations
hash -d set-theory=~math/foundations/set-theory/srcs
hash -d topological-space=~math/foundations/topological-space/srcs
# #endregion foundations





# #endregion math

# #region misc
hash -d misc=~/my-docs/misc

hash -d misc-data=~/my-docs/misc/data

hash -d car=~misc/car
hash -d e-qualification=~misc/misc/e-qualification
hash -d qiita=~misc/qiita
hash -d rules=~misc/rules
hash -d shopping=~misc/shopping
hash -d habit-tracker=~misc/misc/habit-tracker
# #endregion misc

# #region physics
hash -d physics=~/my-docs/physics

hash -d classical-mechanics=~physics/classical-mechanics/subfiles
hash -d electromagnetism=~physics/electromagnetism/subfiles
hash -d relativity=~physics/theory-of-relativity/subfiles
hash -d quantum-mechanics=~physics/quantum-mechanics/subfiles
hash -d electromagnetism=~physics/electromagnetism/subfiles







# #endregion physics

# #region projects
readonly COMPUTER_NAME=home

if [[ $(uname -n) == ${COMPUTER_NAME} ]]; then

else

hash -d misc=~/projects/999-miscellaneous

hash -d windows=/mnt/c/Users/kitahara.yasutaka/projects-on-windows
hash -d dgx-home=dgx:/home/ykitahara
hash -d dgx-aidea=dgx:/raid/work/aisea/train/ykitahara
hash -d dgx-atsuta=dgx:/raid/work/kitahara/002-atsuta-health-center---ai

hash -d projects=~/projects
hash -d common=~/projects/000-common-items
hash -d nagoya-cu=~/projects/002-nagoya-city-university---head-ai
hash -d subaru=~/projects/003-subaru---anomaly-detection
hash -d jdc-kaggle=~/projects/004-jdc-kaggle---data-analysis
hash -d neutral=~projects/005-neutral---ntech-predict
hash -d jonan=~/projects/006-jonan-denki---data-analysis
hash -d tiis=~/projects/007-tiis---palletizing
hash -d kioxia=~/projects/008-kioxia---anomaly-detection
hash -d yamaha=~/projects/009-yamaha---speaker-optimization
hash -d aidea=~/projects/010-aidea---converting-programming-language
hash -d jamstec=~/projects/011-jamstec---material-recognition
hash -d scsk=~/projects/012-scsk---omniverse
hash -d tmc=~/projects/013-tmc---data-science
hash -d smart-scape=~projects/014-smart-scape---data-science
hash -d toyota-auto-body=~projects/2025-06-01-toyota-auto-body---data-analysis

fi
# #endregion projects
