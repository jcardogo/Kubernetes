cd /home/alejandrocardoso/Projects/Cloned_Repos/DevOps/
git fetch origin
git merge origin/main
git commit Basic_Python_Syntax_introduction.py -m "third file commited from ubuntu HomeLab"
git remote set-url origin https://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@github.com/jcardogo/DevOps

####HOw to clone a repo with Personal Access Token
git clone https://acardogo:$GIITHUB_PAT@github.com/jcardogo/DevOps.git

###### GitHub lab
git clone https://acardogo:$GIITHUB_PAT@github.com/jcardogo/it-cert-automation-practice.git # cloning the repo for lab

git remote add upstream https://github.com/jcardogo/it-cert-automation-practice.git #to create an upstream on remote repo

git branch improve-username-behavior

git checkout improve-username-behavior

cd ~/it-cert-automation-practice/Course3/Lab4

git push origin improve-username-behavior
